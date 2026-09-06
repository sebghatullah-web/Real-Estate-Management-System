<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = intval($_GET['id'] ?? 0);

if ($id > 0) {
    // ابتدا واحدهای بلاک حذف می‌شوند، بعد خود بلاک
    $conn->query("DELETE FROM block_units WHERE block_id = $id");
    $conn->query("DELETE FROM blocks WHERE id = $id");
}

header("Location: blocks.php?id_deleted=$id");
exit;
?>