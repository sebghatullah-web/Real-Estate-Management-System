<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = intval($_GET['id'] ?? 0);
if ($id > 0) {
    $conn->query("DELETE FROM block_units WHERE id = $id");
}

$block_id  = intval($_GET['block_id'] ?? 0);
$manzel_id = intval($_GET['manzel_id'] ?? 0);
header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id");
exit;
?>