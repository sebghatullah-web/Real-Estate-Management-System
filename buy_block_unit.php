<?php
require 'config/db.php';

$unit_id = intval($_GET['id'] ?? 0);
$unit = null;

if ($unit_id > 0) {
    $stmt = $pdo->prepare("SELECT bu.*, b.block_code, b.block_name, m.name AS manzel_name, m.code AS manzel_code
                           FROM block_units bu
                           JOIN blocks b ON bu.block_id = b.id
                           LEFT JOIN manazil m ON bu.manzel_id = m.id
                           WHERE bu.id = ?");
    $stmt->execute([$unit_id]);
    $unit = $stmt->fetch(PDO::FETCH_ASSOC);
}

// The success view after a completed purchase is allowed even though the unit is now sold.
$isSuccessView = (isset($_GET['success']) && $_GET['success'] == '1');

// Unit not found -> back to the map. Unit without a block reference -> also back to the map.
if (!$unit || empty($unit['block_code'])) {
    header("Location: map.php");
    exit;
}

// Unit already sold/reserved (and not the success view after purchase) -> back to block details.
if (!$isSuccessView && $unit['status'] != 'available') {
    header("Location: block_details.php?id=" . urlencode($unit['block_code']) . "&error=unavailable");
    exit;
}

// Price check: a unit can only be bought once its price was set at registration.
// If no price is set yet, the page shows a "price not announced" contact panel instead of the form.
$hasPrice = ($unit['total_price'] !== null && floatval($unit['total_price']) > 0);
$showNoPrice = (!$isSuccessView && !$hasPrice);

// Process purchase
$success = false;
$error = '';

if (!$showNoPrice && $_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['buy_block_unit'])) {
    $full_name = trim($_POST['full_name']);
    $fathar_name = trim($_POST['fathar_name']);
    $phone = trim($_POST['phone']);
    $email = trim($_POST['email']);
    $address = trim($_POST['address']);
    $occupation = trim($_POST['occupation']);
    $national_id = trim($_POST['national_id']);

    // Validation
    if (empty($full_name) || empty($phone) || empty($national_id)) {
        $error = "Please fill in the required fields (full name, phone number, national ID).";
    } else {
        try {
            $pdo->beginTransaction();

            // 1. Insert customer into customers table
            $stmt = $pdo->prepare("INSERT INTO customers (full_name, fathar_name, address, occupation, phone, email, national_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$full_name, $fathar_name, $address, $occupation, $phone, $email, $national_id]);
            $customer_id = $pdo->lastInsertId();

            // 2. Update the unit to sold and assign the customer (price was already set at registration)
            $stmt = $pdo->prepare("UPDATE block_units SET status = 'sold', customer_id = ?, sold_at = NOW() WHERE id = ? AND status = 'available'");
            $stmt->execute([$customer_id, $unit['id']]);

            if ($stmt->rowCount() === 0) {
                throw new Exception("This unit has already been sold or reserved.");
            }

            $pdo->commit();
            $success = true;

            // Redirect to success page
            header("Location: buy_block_unit.php?id=" . urlencode($unit_id) . "&success=1");
            exit;

        } catch (Exception $e) {
            $pdo->rollBack();
            $error = "Error registering the purchase: " . $e->getMessage();
        }
    }
}

include 'header.php';

// Success message
if (isset($_GET['success']) && $_GET['success'] == '1') {
?>
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
                    <div class="mb-4">
                        <i class="bi bi-check-circle-fill text-success" style="font-size: 5rem;"></i>
                    </div>
                    <h2 class="fw-bold text-success mb-3">Purchase successfully registered! &#10004;</h2>
                    <p class="text-muted mb-4">Unit <strong><?= htmlspecialchars($unit['unit_code']) ?></strong> has been registered in your name.</p>
                    <p class="text-muted mb-4">Your information has been recorded in the system. Our staff will contact you soon.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="block_details.php?id=<?= urlencode($unit['block_code']) ?>" class="btn btn-buy">
                            <i class="bi bi-building me-2"></i>Back to Block
                        </a>
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="bi bi-house me-2"></i>Home
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php
} elseif ($showNoPrice) {
    // Unit is available but no price has been set yet -> friendly contact panel (no purchase form)
    ?>
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div class="card border-0 shadow-sm rounded-4 text-center p-5">
                        <div class="mb-4">
                            <i class="bi bi-clock-history text-warning" style="font-size: 4.5rem;"></i>
                        </div>
                        <h2 class="fw-bold mb-3" style="color:#1a3a5c;">Price Not Announced Yet</h2>
                        <p class="text-muted mb-1">
                            The price for unit <strong><?= htmlspecialchars($unit['unit_code']) ?></strong>
                            (<?= htmlspecialchars($unit['manzel_name'] ?? '') ?> - Unit <?= htmlspecialchars($unit['unit_number']) ?>)
                            has not been set yet.
                        </p>
                        <p class="text-muted mb-4">Please contact us to reserve this unit or learn about the latest price.</p>
                        <div class="d-flex justify-content-center gap-3 flex-wrap">
                            <a href="https://wa.me/9379349150" target="_blank" class="btn btn-success btn-lg">
                                <i class="bi bi-whatsapp me-2"></i>Contact on WhatsApp
                            </a>
                            <a href="block_details.php?id=<?= urlencode($unit['block_code']) ?>" class="btn btn-outline-secondary btn-lg">
                                <i class="bi bi-arrow-left me-2"></i>Back to Block
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <?php
} else {
    // Error message
    if ($error): ?>
        <div class="container mt-4">
            <div class="alert alert-danger alert-dismissible fade show">
                <i class="bi bi-exclamation-triangle me-2"></i><?= htmlspecialchars($error) ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </div>
    <?php endif; ?>

    <?php if (isset($_GET['error']) && $_GET['error'] == 'unavailable'): ?>
        <div class="container mt-4">
            <div class="alert alert-warning">
                <i class="bi bi-exclamation-triangle me-2"></i>This unit has already been sold or reserved and is not available for purchase.
                <a href="block_details.php?id=<?= urlencode($unit['block_code']) ?>" class="alert-link">Back to Block</a>
            </div>
        </div>
    <?php endif; ?>

<section class="page-banner">
    <div class="container">
        <h1><i class="bi bi-cart me-2"></i>Buy Apartment / Unit</h1>
        <p class="mb-0">Unit Code: <?= htmlspecialchars($unit['unit_code']) ?> - <?= htmlspecialchars($unit['manzel_name'] ?? '') ?></p>
    </div>
</section>


<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <!-- Unit Summary -->
            <div class="col-lg-5">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4" style="color: #1a3a5c;"><i class="bi bi-info-circle me-2"></i>Unit Summary</h4>
                        <table class="table table-bordered">
                            <tr>
                                <th class="bg-light">Unit Code</th>
                                <td><?= htmlspecialchars($unit['unit_code']) ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">Block</th>
                                <td><?= htmlspecialchars($unit['block_code']) ?><?php if (!empty($unit['block_name'])): ?> (<?= htmlspecialchars($unit['block_name']) ?>)<?php endif; ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">Building / Manzel</th>
                                <td><?= htmlspecialchars($unit['manzel_name'] ?? '-') ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">Unit Number</th>
                                <td><?= htmlspecialchars($unit['unit_number']) ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">Category</th>
                                <td><?= htmlspecialchars($unit['category']) ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">Area</th>
                                <td><?= htmlspecialchars($unit['unit_size']) ?> Square Meters</td>
                            </tr>
                            <tr>
                                <th class="bg-light">Unit Price</th>
                                <td><?= number_format($unit['unit_price']) ?> $</td>
                            </tr>
                            <tr>
                                <th class="bg-light">Infrastructure Cost</th>
                                <td><?= number_format($unit['infra_cost']) ?> $</td>
                            </tr>
                            <tr>
                                <th class="bg-light">Government Service Cost</th>
                                <td><?= number_format($unit['gov_cost']) ?> $</td>
                            </tr>
                            <tr class="table-success">
                                <th class="fw-bold">Total Price</th>
                                <td class="fw-bold"><?= number_format($unit['total_price']) ?> $</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>


            <!-- Purchase Form -->
            <div class="col-lg-7">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4" style="color: #1a3a5c;"><i class="bi bi-person me-2"></i>Buyer Information</h4>
                        <form method="POST" onsubmit="return validateForm()">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">Full Name <span class="text-danger">*</span></label>
                                    <input type="text" name="full_name" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Father's Name <span class="text-danger">*</span></label>
                                    <input type="text" name="fathar_name" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Phone Number <span class="text-danger">*</span></label>
                                    <input type="text" name="phone" class="form-control" required placeholder="07xxxxxxxx">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Address</label>
                                    <input type="text" name="address" class="form-control" placeholder="Kabul, ...">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">Occupation</label>
                                    <input type="text" name="occupation" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">National ID (Tazkira) <span class="text-danger">*</span></label>
                                    <input type="text" name="national_id" class="form-control" required>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="termsCheck" required>
                                <label class="form-check-label" for="termsCheck">
                                    I agree with the purchase terms and conditions
                                </label>
                            </div>

                            <div class="d-flex gap-3">
                                <button type="submit" name="buy_block_unit" class="btn btn-buy btn-lg px-5">
                                    <i class="bi bi-check-lg me-2"></i>Confirm Purchase
                                </button>
                                <a href="block_details.php?id=<?= urlencode($unit['block_code']) ?>" class="btn btn-outline-secondary btn-lg">
                                    <i class="bi bi-arrow-left me-2"></i>Back
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<script>
function validateForm() {
    var phone = document.querySelector('input[name="phone"]').value;
    var nationalId = document.querySelector('input[name="national_id"]').value;

    if (phone.length < 10) {
        alert('Please enter a valid phone number');
        return false;
    }
    if (nationalId.length < 5) {
        alert('Please enter a valid national ID');
        return false;
    }
    return true;
}
</script>

<?php
}
include 'footer.php';
?>

