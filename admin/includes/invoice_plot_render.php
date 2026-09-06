<?php
/* ============================================================
   رندر انوایس حرفه‌ای نمرات (plots) به سایز A4
   نیاز دارد: $plot_table و $pay_table از قبل تنظیم شده باشند
   ============================================================ */

$plot_id = isset($_GET['plot_id']) ? intval($_GET['plot_id']) : 0;
$amount  = isset($_GET['amount']) ? floatval($_GET['amount']) : 0;

if (!$plot_id) {
    header("Location: index.php");
    exit;
}

// معلومات نمره به همراه مشتری
$sql = "SELECT p.*, c.full_name, c.fathar_name, c.national_id, c.phone, c.address
        FROM `$plot_table` p
        LEFT JOIN customers c ON p.customer_id = c.id
        WHERE p.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $plot_id);
$stmt->execute();
$plot = $stmt->get_result()->fetch_assoc();

if (!$plot) {
    die("نمره یافت نشد.");
}

// مجموع پرداخت‌ها و آخرین پرداخت برای شماره انوایس
$payStmt = $conn->prepare("SELECT IFNULL(SUM(amount),0) AS paid_total FROM `$pay_table` WHERE plot_id = ?");
$payStmt->bind_param("i", $plot_id);
$payStmt->execute();
$paidTotal = $payStmt->get_result()->fetch_assoc()['paid_total'];

$lastStmt = $conn->prepare("SELECT id, payment_date FROM `$pay_table` WHERE plot_id = ? ORDER BY id DESC LIMIT 1");
$lastStmt->bind_param("i", $plot_id);
$lastStmt->execute();
$lastPay = $lastStmt->get_result()->fetch_assoc();

$remaining  = (float)$plot['total_price'] - (float)$paidTotal;
$invoice_no = 'INV-' . date('Y') . '-' . str_pad((string)($lastPay['id'] ?? $plot_id), 5, '0', STR_PAD_LEFT);
$date_str   = date('Y-m-d', strtotime($lastPay['payment_date'] ?? 'now')) . ' ساعت ' . date('H:i', strtotime($lastPay['payment_date'] ?? 'now'));

require_once __DIR__ . '/invoice_common.php';

invoice_a4_head('انوایس پرداختی — نمره ' . htmlspecialchars($plot['plot_code'] ?? ''));
invoice_a4_toolbar('index.php', 'بازگشت به داشبرد');
invoice_a4_open($invoice_no, $date_str);
invoice_a4_billto($plot);

// ---------- جزئیات مورد فروش ----------
invoice_a4_section('معلومات نمره / قطعه زمین');
?>
<table class="inv-table">
    <thead>
        <tr>
            <th>کد نمره</th>
            <th>نوعیت نمره</th>
            <th>مساحت (متر مربع)</th>
            <th>وضعیت</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><?= htmlspecialchars($plot['plot_code'] ?? '') ?></b></td>
            <td><?= htmlspecialchars($plot['type'] ?? '') ?></td>
            <td class="num"><?= htmlspecialchars($plot['area'] ?? '') ?> متر</td>
            <td><?= $plot['status'] == 'sold' ? 'فروخته شده' : ($plot['status'] == 'reserved' ? 'رزرو شده' : 'قابل فروش') ?></td>
        </tr>
    </tbody>
</table>

<?php
// ---------- جدول مبالغ ----------
invoice_a4_section('جزییات مالی');
?>
<div class="inv-service"><b>مورد:</b> فروش نمره <?= htmlspecialchars($plot['plot_code'] ?? '') ?> (<?= htmlspecialchars($plot['type'] ?? '') ?>) به مساحت <?= htmlspecialchars($plot['area'] ?? '') ?> متر مربع</div>
<table class="inv-table amount-table">
    <thead>
        <tr><th>شرح</th><th>مبلغ (دالر)</th></tr>
    </thead>
    <tbody>
        <tr><td>قیمت پایه نمره</td><td class="num"><?= invoice_fmt($plot['base_price'] ?? 0) ?></td></tr>
        <tr><td>پول خدمات دولت</td><td class="num"><?= invoice_fmt($plot['gov_cost'] ?? 0) ?></td></tr>
        <tr><td>پول خدمات زیربنا</td><td class="num"><?= invoice_fmt($plot['infra_cost'] ?? 0) ?></td></tr>
        <tr class="total-row"><td>قیمت مجموعی</td><td class="num"><?= invoice_fmt($plot['total_price'] ?? 0) ?></td></tr>
        <tr class="payment-row"><td>مبلغ این پرداخت</td><td class="num"><?= invoice_fmt($amount) ?></td></tr>
        <tr class="paid-row"><td>مجموع پرداخت‌شده تا به حال</td><td class="num"><?= invoice_fmt($paidTotal) ?></td></tr>
        <tr class="dang-row"><td>باقی‌مانده</td><td class="num"><?= invoice_fmt($remaining) ?></td></tr>
    </tbody>
</table>

<?php
// ---------- مبلغ به حروف ----------
?>
<div class="inv-words">
    مبلغ این قسط به حروف: <b><?= $amount > 0 ? numToWordsFa($amount) . ' دالر' : '-' ?></b>
</div>
<?php
invoice_a4_close();
?>