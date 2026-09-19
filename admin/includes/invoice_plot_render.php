<?php
/* ============================================================
   Professional A4 invoice renderer for plots
   Requires: $plot_table and $pay_table to be set beforehand
   ============================================================ */

$plot_id = isset($_GET['plot_id']) ? intval($_GET['plot_id']) : 0;
$amount  = isset($_GET['amount']) ? floatval($_GET['amount']) : 0;

if (!$plot_id) {
    header("Location: index.php");
    exit;
}

// Plot info with the customer
$sql = "SELECT p.*, c.full_name, c.fathar_name, c.national_id, c.phone, c.address
        FROM `$plot_table` p
        LEFT JOIN customers c ON p.customer_id = c.id
        WHERE p.id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $plot_id);
$stmt->execute();
$plot = $stmt->get_result()->fetch_assoc();

if (!$plot) {
    die("Plot not found.");
}

// Total payments and last payment for the invoice number
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
$date_str   = date('Y-m-d', strtotime($lastPay['payment_date'] ?? 'now')) . ' at ' . date('H:i', strtotime($lastPay['payment_date'] ?? 'now'));

require_once __DIR__ . '/invoice_common.php';

invoice_a4_head('Payment Invoice — Plot ' . htmlspecialchars($plot['plot_code'] ?? ''));
invoice_a4_toolbar('index.php', 'Back to Dashboard');
invoice_a4_open($invoice_no, $date_str);
invoice_a4_billto($plot);

// ---------- Sale item details ----------
invoice_a4_section('Plot Details');
?>
<table class="inv-table">
    <thead>
        <tr>
            <th>Plot Code</th>
            <th>Plot Type</th>
            <th>Area (sqm)</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b><?= htmlspecialchars($plot['plot_code'] ?? '') ?></b></td>
            <td><?= htmlspecialchars($plot['type'] ?? '') ?></td>
            <td class="num"><?= htmlspecialchars($plot['area'] ?? '') ?> m</td>
            <td><?= $plot['status'] == 'sold' ? 'Sold' : ($plot['status'] == 'reserved' ? 'Reserved' : 'Available') ?></td>
        </tr>
    </tbody>
</table>

<?php
// ---------- Amounts table ----------
invoice_a4_section('Financial Details');
?>
<div class="inv-service"><b>Item:</b> Sale of plot <?= htmlspecialchars($plot['plot_code'] ?? '') ?> (<?= htmlspecialchars($plot['type'] ?? '') ?>) with an area of <?= htmlspecialchars($plot['area'] ?? '') ?> sqm</div>
<table class="inv-table amount-table">
    <thead>
        <tr><th>Description</th><th>Amount (USD)</th></tr>
    </thead>
    <tbody>
        <tr><td>Plot Base Price</td><td class="num"><?= invoice_fmt($plot['base_price'] ?? 0) ?></td></tr>
        <tr><td>Government Service Fee</td><td class="num"><?= invoice_fmt($plot['gov_cost'] ?? 0) ?></td></tr>
        <tr><td>Infrastructure Service Fee</td><td class="num"><?= invoice_fmt($plot['infra_cost'] ?? 0) ?></td></tr>
        <tr class="total-row"><td>Total Price</td><td class="num"><?= invoice_fmt($plot['total_price'] ?? 0) ?></td></tr>
        <tr class="payment-row"><td>This Payment</td><td class="num"><?= invoice_fmt($amount) ?></td></tr>
        <tr class="paid-row"><td>Total Paid So Far</td><td class="num"><?= invoice_fmt($paidTotal) ?></td></tr>
        <tr class="dang-row"><td>Remaining Balance</td><td class="num"><?= invoice_fmt($remaining) ?></td></tr>
    </tbody>
</table>

<?php
// ---------- Amount in words ----------
?>
<div class="inv-words">
    This installment amount in words: <b><?= $amount > 0 ? numToWordsEn($amount) . ' USD' : '-' ?></b>
</div>
<?php
invoice_a4_close();
?>
