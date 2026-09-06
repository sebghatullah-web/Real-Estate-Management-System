<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$unit_id = isset($_GET['unit_id']) ? intval($_GET['unit_id']) : 0;
if (!$unit_id) {
    header("Location: list_sold_units.php");
    exit;
}

// دریافت معلومات اپارتمان/واحد فروخته‌شده و مشتری
$sql = "SELECT bu.*, c.full_name, c.fathar_name, c.national_id, b.block_code
        FROM block_units bu
        LEFT JOIN customers c ON bu.customer_id = c.id
        LEFT JOIN blocks b ON bu.block_id = b.id
        WHERE bu.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $unit_id);
$stmt->execute();
$unit = $stmt->get_result()->fetch_assoc();

if (!$unit) {
    die("اپارتمان یافت نشد.");
}

if ($unit['status'] != 'sold') {
    header("Location: list_sold_units.php");
    exit;
}

// مجموع پرداختی‌های قبلی
$pay_sql = "SELECT IFNULL(SUM(amount),0) AS paid_amount FROM pay_block_units WHERE unit_id = ?";
$pay_stmt = $conn->prepare($pay_sql);
$pay_stmt->bind_param("i", $unit_id);
$pay_stmt->execute();
$paid = $pay_stmt->get_result()->fetch_assoc()['paid_amount'];

$remaining = $unit['total_price'] - $paid;

// ثبت پرداخت جدید
$error = '';
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST' && isset($_POST['amount'])) {
    $amount = floatval($_POST['amount'] ?? 0);
    $note = trim($_POST['note'] ?? '');

    if ($amount <= 0) {
        $error = "مبلغ پرداختی باید مثبت باشد.";
    } elseif ($amount > $remaining) {
        $error = "مبلغ پرداختی نمی‌تواند بیشتر از باقی‌مانده (" . number_format($remaining, 2) . " دالر) باشد.";
    } else {
        $insert = $conn->prepare("INSERT INTO pay_block_units (unit_id, customer_id, amount, note) VALUES (?, ?, ?, ?)");
        $insert->bind_param("iids", $unit_id, $unit['customer_id'], $amount, $note);
        $insert->execute();
        $insert->close();

        // بعد از ثبت پرداخت، چاپ انوایس
        header("Location: invoice_block_unit.php?unit_id=$unit_id&amount=$amount");
        exit;
    }
}

$roomLabel = $unit['rooms'] == 2 ? '۲ اتاقه' : ($unit['rooms'] == 3 ? '۳ اتاقه' : '۱ اتاقه');
?>
<!DOCTYPE html>
<html lang="IR-fa" dir="rtl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ثبت پرداختی اپارتمان</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="navbar-fixed sidebar-nav fixed-nav">

    <main class="main">

        <div class="container-fluid">
            <h2 class="mb-4">ثبت پرداختی برای اپارتمان (<?= htmlspecialchars($unit['unit_code']) ?>)</h2>

            <div class="card">
                <div class="card-header"><strong>معلومات</strong></div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">ابلاک: <?= htmlspecialchars($unit['block_code']) ?></div>
                        <div class="col-md-6">اپارتمان: <?= htmlspecialchars($unit['unit_code']) ?> (<?= $roomLabel ?>، <?= htmlspecialchars($unit['unit_size']) ?> متر)</div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            مشتری: <?= htmlspecialchars($unit['full_name'] ?? '-') ?> -
                            <?= htmlspecialchars($unit['fathar_name'] ?? '-') ?> -
                            <?= htmlspecialchars($unit['national_id'] ?? '-') ?>
                        </div>
                        <div class="col-md-6"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-4"><strong>قیمت مجموعی:</strong> <?= number_format((float)$unit['total_price'], 2) ?> دالر</div>
                        <div class="col-md-4 text-success"><strong>پرداخت‌شده:</strong> <?= number_format((float)$paid, 2) ?> دالر</div>
                        <div class="col-md-4 text-danger"><strong>باقی‌مانده:</strong> <?= number_format((float)$remaining, 2) ?> دالر</div>
                    </div>
                </div>
            </div>

            <?php if (!empty($error)): ?>
                <div class="alert alert-danger mt-3"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

            <?php if ($remaining > 0): ?>
                <div class="card mt-3">
                    <div class="card-header"><strong>ثبت پرداخت جدید</strong></div>
                    <div class="card-body">
                        <form method="POST" class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">مبلغ پرداختی (دالر)</label>
                                <input type="number" step="0.01" min="0.01" max="<?= $remaining ?>" name="amount" class="form-control" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">ملاحظه (اختیاری)</label>
                                <input type="text" name="note" class="form-control" placeholder="مثلاً قسط اول">
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-success">ثبت پرداخت</button>
                                <a href="list_sold_units.php" class="btn btn-secondary">بازگشت</a>
                            </div>
                        </form>
                    </div>
                </div>
            <?php else: ?>
                <div class="alert alert-info mt-3">
                    این اپارتمان کاملاً پرداخت شده است. (پرداخت‌شده: <?= number_format((float)$paid, 2) ?> دالر از <?= number_format((float)$unit['total_price'], 2) ?> دالر)
                </div>
            <?php endif; ?>

            <?php
            // تاریخچه پرداخت‌ها
            $hist_sql = "SELECT amount, payment_date, note FROM pay_block_units WHERE unit_id = ? ORDER BY payment_date DESC";
            $hist_stmt = $conn->prepare($hist_sql);
            $hist_stmt->bind_param("i", $unit_id);
            $hist_stmt->execute();
            $payments = $hist_stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            ?>

            <div class="card mt-4">
                <div class="card-header"><strong>تاریخچه پرداخت‌ها</strong></div>
                <div class="card-body">
                    <?php if (count($payments) > 0): ?>
                        <table class="table table-bordered table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>مبلغ (دالر)</th>
                                    <th>تاریخ</th>
                                    <th>ملاحظه</th>
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
                        <p class="text-muted mb-0">هیچ پرداختی ثبت نشده است.</p>
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