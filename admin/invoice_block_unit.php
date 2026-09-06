<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$unit_id = isset($_GET['unit_id']) ? intval($_GET['unit_id']) : 0;
$amount  = isset($_GET['amount']) ? floatval($_GET['amount']) : 0;

if (!$unit_id) {
    header("Location: list_sold_units.php");
    exit;
}

// معلومات اپارتمان/واحد به همراه مشتری و بلاک
$sql = "SELECT bu.*, c.full_name, c.fathar_name, c.national_id, c.phone, c.address,
               b.block_code, b.block_name, b.category
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

// مجموع پرداخت‌ها و آخرین پرداخت
$payStmt = $conn->prepare("SELECT IFNULL(SUM(amount),0) AS paid_total FROM pay_block_units WHERE unit_id = ?");
$payStmt->bind_param("i", $unit_id);
$payStmt->execute();
$paidTotal = $payStmt->get_result()->fetch_assoc()['paid_total'];

$lastStmt = $conn->prepare("SELECT id, payment_date FROM pay_block_units WHERE unit_id = ? ORDER BY id DESC LIMIT 1");
$lastStmt->bind_param("i", $unit_id);
$lastStmt->execute();
$lastPay = $lastStmt->get_result()->fetch_assoc();

$remaining  = (float)$unit['total_price'] - (float)$paidTotal;
$invoice_no = 'INV-A-' . date('Y') . '-' . str_pad((string)($lastPay['id'] ?? $unit_id), 5, '0', STR_PAD_LEFT);
$date_str   = date('Y-m-d', strtotime($lastPay['payment_date'] ?? 'now')) . ' ساعت ' . date('H:i', strtotime($lastPay['payment_date'] ?? 'now'));

require_once __DIR__ . '/includes/invoice_common.php';

invoice_a4_head('انوایس پرداختی — اپارتمان ' . htmlspecialchars($unit['unit_code'] ?? ''));
invoice_a4_toolbar('list_sold_units.php', 'بازگشت به لیست فروشات');
invoice_a4_open($invoice_no, $date_str, 'انوایس پرداختی', 'PAYMENT INVOICE');
invoice_a4_billto($unit);

// ---------- جزئیات اپارتمان ----------
$roomLabel = $unit['rooms'] == 2 ? '۲ اتاقه' : ($unit['rooms'] == 3 ? '۳ اتاقه' : '۱ اتاقه');
$catLabel = $unit['category'] == 'premium' ? 'پریمیوم' : ($unit['category'] == 'vip' ? 'وی‌آی‌پی' : 'استاندارد');

invoice_a4_section('معلومات اپارتمان / واحد');
?>
<table class="inv-table">
    <thead>
        <tr>
            <th>کد اپارتمان</th>
            <th>بلاک</th>
            <th>منزل / طبقه</th>
            <th>شماره واحد</th>
            <th>تعداد اتاق</th>
            <th>متراژ (متر مربع)</th>
            <th>کتگوری</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><?= htmlspecialchars($unit['unit_code'] ?? '') ?></b></td>
            <td><?= htmlspecialchars($unit['block_code'] ?? '') ?> <?php if (!empty($unit['block_name'])): ?><small>(<?= htmlspecialchars($unit['block_name']) ?>)</small><?php endif; ?></td>
            <td class="t-center"><?= htmlspecialchars($unit['floor_number'] ?? '') ?></td>
            <td class="t-center"><?= htmlspecialchars($unit['unit_number'] ?? '') ?></td>
            <td class="t-center"><?= $roomLabel ?></td>
            <td class="num"><?= htmlspecialchars($unit['unit_size'] ?? '') ?></td>
            <td class="t-center"><?= $catLabel ?></td>
        </tr>
    </tbody>
</table>

<?php
invoice_a4_section('جزییات مالی');
?>
<div class="inv-service"><b>مورد:</b> فروش اپارتمان <?= htmlspecialchars($unit['unit_code'] ?? '') ?> — منزل شماره <?= htmlspecialchars($unit['floor_number'] ?? '') ?> — به متراژ <?= htmlspecialchars($unit['unit_size'] ?? '') ?> متر مربع</div>
<table class="inv-table amount-table">
    <thead>
        <tr><th>شرح</th><th>نرخ فی متر (دالر)</th><th>مبلغ (دالر)</th></tr>
    </thead>
    <tbody>
        <tr>
            <td>قیمت واحد اپارتمان</td>
            <td class="num"><?= invoice_fmt($unit['unit_price_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['unit_price'] ?? 0) ?></td>
        </tr>
        <tr>
            <td>پول خدمات دولت</td>
            <td class="num"><?= invoice_fmt($unit['gov_cost_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['gov_cost'] ?? 0) ?></td>
        </tr>
        <tr>
            <td>پول خدمات زیربنا</td>
            <td class="num"><?= invoice_fmt($unit['infra_cost_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['infra_cost'] ?? 0) ?></td>
        </tr>
        <tr class="total-row">
            <td colspan="2">قیمت مجموعی</td>
            <td class="num"><?= invoice_fmt($unit['total_price'] ?? 0) ?></td>
        </tr>
        <tr class="payment-row">
            <td colspan="2">مبلغ این پرداخت</td>
            <td class="num"><?= invoice_fmt($amount) ?></td>
        </tr>
        <tr class="paid-row">
            <td colspan="2">مجموع پرداخت‌شده تا به حال</td>
            <td class="num"><?= invoice_fmt($paidTotal) ?></td>
        </tr>
        <tr class="dang-row">
            <td colspan="2">باقی‌مانده</td>
            <td class="num"><?= invoice_fmt($remaining) ?></td>
        </tr>
    </tbody>
</table>

<div class="inv-words">
    مبلغ این قسط به حروف: <b><?= $amount > 0 ? numToWordsFa($amount) . ' دالر' : '-' ?></b>
</div>
<?php
invoice_a4_close();
?>