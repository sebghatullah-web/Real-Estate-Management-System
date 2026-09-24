<?php
include 'admin/config/db.php';
require_once 'admin/includes/block_catalog.php';

echo "CATEGORY_INFO count = " . count($CATEGORY_INFO) . "\n";
foreach ($UNIT_CATEGORIES as $cat) {
    echo str_pad($cat, 22) . ' | ' . str_pad(unit_category_label($cat), 18)
       . ' | ' . str_pad(unit_category_parking($cat), 40) . ' | ' . unit_category_desc($cat) . "\n";
}

// ---- manazil + unit round trip using variables only ----
$bid = 10011;
$name = 'TEST-BUILDING';
$code = 'TB1';
$floors = 2;
$notes = 'auto-test';

$stmt = $conn->prepare("INSERT INTO manazil (block_id, name, code, floors_count, notes) VALUES (?, ?, ?, ?, ?)");
$stmt->bind_param("issis", $bid, $name, $code, $floors, $notes);
$stmt->execute();
$mid = $conn->insert_id;
$stmt->close();

$row = $conn->query("SELECT m.*, b.block_code FROM manazil m JOIN blocks b ON m.block_id=b.id WHERE m.id=$mid")->fetch_assoc();
echo "INSERTED manazil id=$mid name=" . $row['name'] . " block=" . $row['block_code'] . "\n";

$unit_code = 'B-10011-TB1-10';
$category = 'grand_penthouse';
$unit_no = '10';
$unit_size = 285.5;

$stmt = $conn->prepare("INSERT INTO block_units (block_id, manzel_id, category, unit_number, unit_code, unit_size, status)
                        VALUES (?, ?, ?, ?, ?, ?, 'available')");
$stmt->bind_param("iisssd", $bid, $mid, $category, $unit_no, $unit_code, $unit_size);
$stmt->execute();
$uid = $conn->insert_id;
$stmt->close();

$row = $conn->query("SELECT bu.unit_code, bu.category, bu.unit_size, m.name AS manzel_name, b.block_code
                    FROM block_units bu
                    LEFT JOIN manazil m ON bu.manzel_id = m.id
                    LEFT JOIN blocks b ON bu.block_id = b.id
                    WHERE bu.id = $uid")->fetch_assoc();
echo "INSERTED unit id=$uid code=" . $row['unit_code'] . " cat=" . $row['category']
   . " (" . unit_category_label($row['category']) . ") size=" . $row['unit_size'] . " manzel=" . $row['manzel_name'] . " block=" . $row['block_code'] . "\n";

$conn->query("DELETE FROM block_units WHERE id = $uid");
$conn->query("DELETE FROM manazil WHERE id = $mid");

echo "cleanup done; TEST_OK\n";
$conn->close();