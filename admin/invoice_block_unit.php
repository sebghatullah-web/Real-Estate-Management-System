<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

$unit_id = isset($_GET['unit_id']) ? intval($_GET['unit_id']) : 0;
$amount  = isset($_GET['amount']) ? floatval($_GET['amount']) : 0;

if (!$unit_id) {
    header("Location: list_sold_units.php");
    exit;
}

// Apartment/unit info with customer and block
$sql = "SELECT bu.*, c.full_name, c.fathar_name, c.national_id, c.phone, c.address,
               b.block_code, b.block_name, m.name AS manzel_name
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

// Total payments and last payment
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
$date_str   = date('Y-m-d', strtotime($lastPay['payment_date'] ?? 'now')) . ' at ' . date('H:i', strtotime($lastPay['payment_date'] ?? 'now'));

require_once __DIR__ . '/includes/invoice_common.php';

invoice_a4_head('Payment Invoice — Apartment ' . htmlspecialchars($unit['unit_code'] ?? ''));
invoice_a4_toolbar('list_sold_units.php', 'Back to Sold List');
invoice_a4_open($invoice_no, $date_str, 'Payment Invoice', 'PAYMENT INVOICE');
invoice_a4_billto($unit);

// ---------- Apartment details ----------
$catLabel = unit_category_label($unit['category']);

invoice_a4_section('Apartment / Unit Details');
?>
<table class="inv-table">
    <thead>
        <tr>
            <th>Apartment Code</th>
            <th>Block</th>
            <th>Building / Manzel</th>
            <th>Unit No.</th>
            <th>Area (sqm)</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><?= htmlspecialchars($unit['unit_code'] ?? '') ?></b></td>
            <td><?= htmlspecialchars($unit['block_code'] ?? '') ?> <?php if (!empty($unit['block_name'])): ?><small>(<?= htmlspecialchars($unit['block_name']) ?>)</small><?php endif; ?></td>
            <td><?= htmlspecialchars($unit['manzel_name'] ?? '-') ?></td>
            <td class="t-center"><?= htmlspecialchars($unit['unit_number'] ?? '') ?></td>
            <td class="num"><?= htmlspecialchars($unit['unit_size'] ?? '') ?></td>
            <td class="t-center"><?= $catLabel ?></td>
        </tr>
    </tbody>
</table>

<?php
invoice_a4_section('Financial Details');
?>
<div class="inv-service"><b>Item:</b> Sale of apartment <?= htmlspecialchars($unit['unit_code'] ?? '') ?> — Building <?= htmlspecialchars($unit['manzel_name'] ?? '-') ?> — area <?= htmlspecialchars($unit['unit_size'] ?? '') ?> sqm</div>
<table class="inv-table amount-table">
    <thead>
        <tr><th>Description</th><th>Rate / sqm (USD)</th><th>Amount (USD)</th></tr>
    </thead>
    <tbody>
        <tr>
            <td>Apartment Unit Price</td>
            <td class="num"><?= invoice_fmt($unit['unit_price_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['unit_price'] ?? 0) ?></td>
        </tr>
        <tr>
            <td>Government Service Fee</td>
            <td class="num"><?= invoice_fmt($unit['gov_cost_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['gov_cost'] ?? 0) ?></td>
        </tr>
        <tr>
            <td>Infrastructure Service Fee</td>
            <td class="num"><?= invoice_fmt($unit['infra_cost_per_meter'] ?? 0) ?></td>
            <td class="num"><?= invoice_fmt($unit['infra_cost'] ?? 0) ?></td>
        </tr>
        <tr class="total-row">
            <td colspan="2">Total Price</td>
            <td class="num"><?= invoice_fmt($unit['total_price'] ?? 0) ?></td>
        </tr>
        <tr class="payment-row">
            <td colspan="2">This Payment</td>
            <td class="num"><?= invoice_fmt($amount) ?></td>
        </tr>
        <tr class="paid-row">
            <td colspan="2">Total Paid So Far</td>
            <td class="num"><?= invoice_fmt($paidTotal) ?></td>
        </tr>
        <tr class="dang-row">
            <td colspan="2">Remaining Balance</td>
            <td class="num"><?= invoice_fmt($remaining) ?></td>
        </tr>
    </tbody>
</table>

<div class="inv-words">
    This installment amount in words: <b><?= $amount > 0 ? numToWordsEn($amount) . ' USD' : '-' ?></b>
</div>
<?php
invoice_a4_close();
?>