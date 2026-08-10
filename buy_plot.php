<?php
require 'config/db.php';

$plot_code = $_GET['id'] ?? null;
$plot = null;
$table = null;

if ($plot_code) {
    if (strpos($plot_code, "p_2_") === 0) {
        $table = "plots_200";
    } elseif (strpos($plot_code, "p_2.6_") === 0) {
        $table = "plots_260";
    } elseif (strpos($plot_code, "p_3_") === 0) {
        $table = "plots_300";
    } elseif (strpos($plot_code, "p_4_") === 0) {
        $table = "plots_400";
    } elseif (strpos($plot_code, "p_5_") === 0) {
        $table = "plots_510";
    } elseif (strpos($plot_code, "p_6_") === 0) {
        $table = "plots_600";
    } elseif (strpos($plot_code, "p_10_") === 0) {
        $table = "plots_1000";
    } elseif (strpos($plot_code, "p_vip_") === 0) {
        $table = "plots_vip";
    }

    if ($table) {
        $stmt = $pdo->prepare("SELECT * FROM $table WHERE plot_code = ?");
        $stmt->execute([$plot_code]);
        $plot = $stmt->fetch(PDO::FETCH_ASSOC);
    }
}

// If plot not found or already sold/reserved
if (!$plot || $plot['status'] != 'available') {
    header("Location: plot_details.php?id=" . urlencode($plot_code) . "&error=unavailable");
    exit;
}

// Process purchase
$success = false;
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['buy_plot'])) {
    $full_name = trim($_POST['full_name']);
    $fathar_name = trim($_POST['fathar_name']);
    $phone = trim($_POST['phone']);
    $email = trim($_POST['email']);
    $address = trim($_POST['address']);
    $occupation = trim($_POST['occupation']);
    $national_id = trim($_POST['national_id']);

    // Validation
    if (empty($full_name) || empty($phone) || empty($national_id)) {
        $error = "لطفاً فیلدهای ضروری (نام کامل، شماره تماس، تذکره) را پر کنید.";
    } else {
        try {
            $pdo->beginTransaction();

            // 1. Insert customer into customers table
            $stmt = $pdo->prepare("INSERT INTO customers (full_name, fathar_name, address, occupation, phone, email, national_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$full_name, $fathar_name, $address, $occupation, $phone, $email, $national_id]);
            $customer_id = $pdo->lastInsertId();

            // 2. Update plot status to 'sold' and assign customer_id
            $stmt = $pdo->prepare("UPDATE $table SET status = 'sold', customer_id = ? WHERE id = ? AND status = 'available'");
            $stmt->execute([$customer_id, $plot['id']]);

            if ($stmt->rowCount() === 0) {
                throw new Exception("این نمره قبلاً فروخته یا رزرو شده است.");
            }

            $pdo->commit();
            $success = true;
            
            // Redirect to success page
            header("Location: buy_plot.php?id=" . urlencode($plot_code) . "&success=1");
            exit;

        } catch (Exception $e) {
            $pdo->rollBack();
            $error = "خطا در ثبت خرید: " . $e->getMessage();
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
                    <h2 class="fw-bold text-success mb-3">خرید با موفقیت ثبت شد! ✅</h2>
                    <p class="text-muted mb-4">نمره <strong><?= htmlspecialchars($plot['plot_code']) ?></strong> به نام شما ثبت شد.</p>
                    <p class="text-muted mb-4">اطلاعات شما در سیستم ثبت گردید. کارمندان ما بزودی با شما تماس خواهند گرفت.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="map.php" class="btn btn-buy">
                            <i class="bi bi-map me-2"></i>بازگشت به نقشه
                        </a>
                        <a href="index.php" class="btn btn-outline-secondary">
                            <i class="bi bi-house me-2"></i>صفحه اصلی
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
                <i class="bi bi-exclamation-triangle me-2"></i>این نمره قبلاً فروخته یا رزرو شده است و قابل خرید نمی‌باشد.
                <a href="map.php" class="alert-link">بازگشت به نقشه</a>
            </div>
        </div>
    <?php endif; ?>

<section class="page-banner">
    <div class="container">
        <h1><i class="bi bi-cart me-2"></i>خرید نمره</h1>
        <p class="mb-0">نمره <?= htmlspecialchars($plot['plot_code']) ?> - <?= htmlspecialchars($plot['type']) ?></p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <!-- Plot Summary -->
            <div class="col-lg-5">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4" style="color: #1a3a5c;"><i class="bi bi-info-circle me-2"></i>خلاصه نمره</h4>
                        <table class="table table-bordered">
                            <tr>
                                <th class="bg-light">کد نمره</th>
                                <td><?= htmlspecialchars($plot['plot_code']) ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">نوع</th>
                                <td><?= htmlspecialchars($plot['type']) ?></td>
                            </tr>
                            <tr>
                                <th class="bg-light">مساحت</th>
                                <td><?= htmlspecialchars($plot['area']) ?> متر مربع</td>
                            </tr>
                            <tr>
                                <th class="bg-light">قیمت پایه</th>
                                <td><?= htmlspecialchars($plot['base_price']) ?> دالر</td>
                            </tr>
                            <tr>
                                <th class="bg-light">هزینه خدمات زیربنایی</th>
                                <td><?= htmlspecialchars($plot['infra_cost']) ?> دالر</td>
                            </tr>
                            <tr>
                                <th class="bg-light">هزینه خدمات دولت</th>
                                <td><?= htmlspecialchars($plot['gov_cost']) ?> دالر</td>
                            </tr>
                            <tr class="table-success">
                                <th class="fw-bold">قیمت مجموعی</th>
                                <td class="fw-bold"><?= htmlspecialchars($plot['total_price']) ?> دالر</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Purchase Form -->
            <div class="col-lg-7">
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4">
                        <h4 class="fw-bold mb-4" style="color: #1a3a5c;"><i class="bi bi-person me-2"></i>اطلاعات خریدار</h4>
                        <form action="" method="POST" onsubmit="return validateForm()">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label class="form-label">نام کامل <span class="text-danger">*</span></label>
                                    <input type="text" name="full_name" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">نام پدر <span class="text-danger">*</span></label>
                                    <input type="text" name="fathar_name" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">شماره تماس <span class="text-danger">*</span></label>
                                    <input type="text" name="phone" class="form-control" required placeholder="۰۷۹xxxxxxxx">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">ایمیل</label>
                                    <input type="email" name="email" class="form-control">
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">آدرس</label>
                                    <input type="text" name="address" class="form-control" placeholder="کابل، ...">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">شغل</label>
                                    <input type="text" name="occupation" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label">شماره تذکره <span class="text-danger">*</span></label>
                                    <input type="text" name="national_id" class="form-control" required>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" id="termsCheck" required>
                                <label class="form-check-label" for="termsCheck">
                                    با قوانین و مقررات خرید موافقت می‌کنم
                                </label>
                            </div>

                            <div class="d-flex gap-3">
                                <button type="submit" name="buy_plot" class="btn btn-buy btn-lg px-5">
                                    <i class="bi bi-check-lg me-2"></i>تأیید خرید
                                </button>
                                <a href="plot_details.php?id=<?= urlencode($plot_code) ?>" class="btn btn-outline-secondary btn-lg">
                                    <i class="bi bi-arrow-right me-2"></i>بازگشت
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
        alert('لطفاً شماره تماس معتبر وارد کنید');
        return false;
    }
    if (nationalId.length < 5) {
        alert('لطفاً شماره تذکره معتبر وارد کنید');
        return false;
    }
    return true;
}
</script>

<?php
}
include 'footer.php';
?>