<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$plot_id = $_GET['plot_id'] ?? null;
if (!$plot_id) {
    header("Location: list_plots_600.php");
    exit;
}

// گرفتن اطلاعات نمره و مشتری
$sql = "SELECT p.*, c.full_name, c.fathar_name, c.national_id 
        FROM plots_600 p 
        LEFT JOIN customers c ON p.customer_id = c.id 
        WHERE p.id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $plot_id);
$stmt->execute();
$plot = $stmt->get_result()->fetch_assoc();

if (!$plot) {
    die("نمره یافت نشد.");
}

// مجموع پرداختی‌های قبلی
$pay_sql = "SELECT IFNULL(SUM(amount),0) AS paid_amount FROM pay_600 WHERE plot_id=?";
$pay_stmt = $conn->prepare($pay_sql);
$pay_stmt->bind_param("i", $plot_id);
$pay_stmt->execute();
$paid = $pay_stmt->get_result()->fetch_assoc()['paid_amount'];

$remaining = $plot['total_price'] - $paid;

// ثبت پرداخت جدید
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['amount'])) {
    $amount = $_POST['amount'];

    if ($amount <= $remaining && $amount > 0) {
        $insert = $conn->prepare("INSERT INTO pay_600 (plot_id, customer_id, amount) VALUES (?, ?, ?)");
        $insert->bind_param("iid", $plot_id, $plot['customer_id'], $amount);
        $insert->execute();

        // بعد از ثبت پرداخت، چاپ انوایس
        header("Location: invoice_600.php?plot_id=$plot_id&amount=$amount");
        exit;
    } else {
        $error = "مبلغ پرداختی باید مثبت و کمتر یا مساوی باقی‌مانده باشد.";
    }
}
?>
<!DOCTYPE html>
<html lang="fa">
<head>
  <meta charset="UTF-8">
  <title>ثبت پرداختی</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body dir="rtl" class="container mt-4">
  <h2>ثبت پرداختی برای نمره (<?= htmlspecialchars($plot['plot_code']) ?>)</h2>
  <p>مشتری: <?= htmlspecialchars($plot['full_name']) ?> - <?= htmlspecialchars($plot['fathar_name']) ?> - <?= htmlspecialchars($plot['national_id']) ?></p>
  <p>قیمت مجموعی: <?= htmlspecialchars($plot['total_price']) ?> دالر</p>
  <p>پرداخت‌شده: <?= htmlspecialchars($paid) ?> دالر</p>
  <p>باقی‌مانده: <?= htmlspecialchars($remaining) ?> دالر</p>

  <?php if (!empty($error)): ?>
    <div class="alert alert-danger"><?= $error ?></div>
  <?php endif; ?>

  <?php if ($remaining > 0): ?>
    <form method="post" class="row g-3">
      <div class="col-md-4">
        <label class="form-label">مبلغ پرداختی</label>
        <input type="number" step="0.01" name="amount" class="form-control" required>
      </div>
      <div class="col-12">
        <button type="submit" class="btn btn-success">ثبت پرداخت</button>
        <a href="list_plots_600.php" class="btn btn-secondary">بازگشت</a>
      </div>
    </form>
  <?php else: ?>
    <div class="alert alert-info">این نمره کاملاً پرداخت شده است.</div>
  <?php endif; ?>
</body>
</html>
