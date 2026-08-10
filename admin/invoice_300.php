<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$plot_id = $_GET['plot_id'];
$amount = $_GET['amount'];

// گرفتن اطلاعات نمره و مشتری
$sql = "SELECT p.*, c.full_name, c.fathar_name, c.national_id 
        FROM plots_300 p 
        LEFT JOIN customers c ON p.customer_id = c.id 
        WHERE p.id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $plot_id);
$stmt->execute();
$plot = $stmt->get_result()->fetch_assoc();
?>
<!DOCTYPE html>
<html lang="fa">
<head>
  <meta charset="UTF-8">
  <title>انوایس پرداختی</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body dir="rtl" class="container mt-4">
  <div class="card shadow-sm p-4">
    <h3 class="mb-3">انوایس پرداختی</h3>
    <p><strong>کد نمره:</strong> <?= htmlspecialchars($plot['plot_code']) ?></p>
    <p><strong>مشتری:</strong> <?= htmlspecialchars($plot['full_name']) ?> - <?= htmlspecialchars($plot['fathar_name']) ?> - <?= htmlspecialchars($plot['national_id']) ?></p>
    <p><strong>مبلغ پرداختی:</strong> <?= htmlspecialchars($amount) ?> دالر</p>
    <p><strong>تاریخ:</strong> <?= date('Y-m-d H:i') ?></p>
    <hr>
    <p>امضا مدیر: ____________________</p>
  </div>
  <button onclick="window.print()" class="btn btn-primary mt-3">چاپ انوایس</button>
</body>
</html>
