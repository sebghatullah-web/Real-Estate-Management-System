<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$unit_id = isset($_GET['unit_id']) ? intval($_GET['unit_id']) : 0;
if (!$unit_id) {
    header("Location: list_sold_units.php");
    exit;
}

// Get sold apartment/unit and customer info
$sql = "SELECT bu.*, c.full_name, c.fathar_name, c.national_id, b.block_code, m.name AS manzel_name
        FROM block_units bu
        LEFT JOIN customers c ON bu.customer_id = c.id
        LEFT JOIN blocks b ON bu.block_id = b.id
        LEFT JOIN manazil m ON bu.manzel_id = m.id
        WHERE bu.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $unit_id);
$stmt->execute();
$unit = $stmt->get_result()->fetch_assoc();

if (!$unit) {
    die("Apartment not found.");
}

if ($unit['status'] != 'sold') {
    header("Location: list_sold_units.php");
    exit;
}

// Sum of previous payments
$pay_sql = "SELECT IFNULL(SUM(amount),0) AS paid_amount FROM pay_block_units WHERE unit_id = ?";
$pay_stmt = $conn->prepare($pay_sql);
$pay_stmt->bind_param("i", $unit_id);
$pay_stmt->execute();
$paid = $pay_stmt->get_result()->fetch_assoc()['paid_amount'];

$remaining = $unit['total_price'] - $paid;

// Insert new payment
$error = '';
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST' && isset($_POST['amount'])) {
    $amount = floatval($_POST['amount'] ?? 0);
    $note = trim($_POST['note'] ?? '');

    if ($amount <= 0) {
        $error = "Payment amount must be positive.";
    } elseif ($amount > $remaining) {
        $error = "Payment amount cannot exceed the remaining balance (" . number_format($remaining, 2) . " USD).";
    } else {
        $insert = $conn->prepare("INSERT INTO pay_block_units (unit_id, customer_id, amount, note) VALUES (?, ?, ?, ?)");
        $insert->bind_param("iids", $unit_id, $unit['customer_id'], $amount, $note);
        $insert->execute();
        $insert->close();

        // After saving the payment, print the invoice
        header("Location: invoice_block_unit.php?unit_id=$unit_id&amount=$amount");
        exit;
    }
}

$roomLabel = $unit['rooms'] == 2 ? '2-Bedroom' : ($unit['rooms'] == 3 ? '3-Bedroom' : '1-Bedroom');
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Record Apartment Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="navbar-fixed sidebar-nav fixed-nav">

    <main class="main">

        <div class="container-fluid">
            <h2 class="mb-4">Record Payment for Apartment (<?= htmlspecialchars($unit['unit_code']) ?>)</h2>

            <div class="card">
                <div class="card-header"><strong>Information</strong></div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">Block: <?= htmlspecialchars($unit['block_code']) ?> — Building: <?= htmlspecialchars($unit['manzel_name'] ?? '-') ?></div>
                        <div class="col-md-6">Apartment: <?= htmlspecialchars($unit['unit_code']) ?> (<?= $roomLabel ?>, <?= htmlspecialchars($unit['unit_size']) ?> sqm)</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            Customer: <?= htmlspecialchars($unit['full_name'] ?? '-') ?> -
                            <?= htmlspecialchars($unit['fathar_name'] ?? '-') ?> -
                            <?= htmlspecialchars($unit['national_id'] ?? '-') ?>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>Total Price:</strong> <?= number_format((float)$unit['total_price'], 2) ?> USD</div>
                        <div class="col-md-4 text-success"><strong>Paid:</strong> <?= number_format((float)$paid, 2) ?> USD</div>
                        <div class="col-md-4 text-danger"><strong>Remaining:</strong> <?= number_format((float)$remaining, 2) ?> USD</div>
                    </div>
                </div>
            </div>

            <?php if (!empty($error)): ?>
                <div class="alert alert-danger mt-3"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

            <?php if ($remaining > 0): ?>
                <div class="card mt-3">
                    <div class="card-header"><strong>New Payment</strong></div>
                    <div class="card-body">
                        <form method="POST" class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Payment Amount (USD)</label>
                                <input type="number" step="0.01" min="0.01" max="<?= $remaining ?>" name="amount" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Note (optional)</label>
                                <input type="text" name="note" class="form-control" placeholder="e.g. first installment">
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-success">Save Payment</button>
                                <a href="list_sold_units.php" class="btn btn-secondary">Back</a>
                            </div>
                        </form>
                    </div>
                </div>
            <?php else: ?>
                <div class="alert alert-info mt-3">
                    This apartment is fully paid. (Paid: <?= number_format((float)$paid, 2) ?> USD out of <?= number_format((float)$unit['total_price'], 2) ?> USD)
                </div>
            <?php endif; ?>

            <?php
            // Payment history
            $hist_sql = "SELECT amount, payment_date, note FROM pay_block_units WHERE unit_id = ? ORDER BY payment_date DESC";
            $hist_stmt = $conn->prepare($hist_sql);
            $hist_stmt->bind_param("i", $unit_id);
            $hist_stmt->execute();
            $payments = $hist_stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            ?>

            <div class="card mt-4">
                <div class="card-header"><strong>Payment History</strong></div>
                <div class="card-body">
                    <?php if (count($payments) > 0): ?>
                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Amount (USD)</th>
                                    <th>Date</th>
                                    <th>Note</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $i = 1; foreach ($payments as $p): ?>
                                <tr>
                                    <td><?= $i++ ?></td>
                                    <td><?= number_format((float)$p['amount'], 2) ?></td>
                                    <td><?= htmlspecialchars($p['payment_date']) ?></td>
                                    <td><?= htmlspecialchars($p['note'] ?? '') ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p class="text-muted mb-0">No payments recorded.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        <!--/.container-fluid-->
    </main>


    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>
    <script src="style/js/app.js"></script>
    <script src="style/js/views/main.js"></script>
</body>

</html>