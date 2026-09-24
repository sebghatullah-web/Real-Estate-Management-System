<?php
error_reporting(0);
include 'admin/config/db.php';
$tables = ['blocks', 'block_units', 'block_unit_features', 'block_amenities', 'customers'];
foreach ($tables as $t) {
    echo "=== $t ===\n";
    $r = $conn->query("SHOW CREATE TABLE $t");
    if ($r) { $row = $r->fetch_assoc(); echo $row['Create Table'] . "\n\n"; }
    else { echo "ERROR: " . $conn->error . "\n\n"; }
}
echo "=== data counts ===\n";
foreach ($tables as $t) {
    $r = $conn->query("SELECT COUNT(*) c FROM $t");
    if ($r) { $row = $r->fetch_assoc(); echo "$t: {$row['c']}\n"; }
}
$r = $conn->query("SELECT id, block_code, block_name, size, staircase_size, floors_count, status FROM blocks ORDER BY id");
echo "\n=== blocks rows ===\n";
while ($row = $r->fetch_assoc()) echo json_encode($row) . "\n";
$r = $conn->query("SELECT id, block_id, manzel_id, category, unit_number, unit_code, unit_size, status, customer_id FROM block_units ORDER BY id LIMIT 30");
echo "\n=== block_units sample ===\n";
while ($row = $r->fetch_assoc()) echo json_encode($row) . "\n";