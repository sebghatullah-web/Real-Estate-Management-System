<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id    = intval($_POST['block_id'] ?? 0);
    $name        = trim($_POST['name'] ?? '');
    $code        = trim($_POST['code'] ?? '');
    $floors      = intval($_POST['floors_count'] ?? 1);
    $notes       = trim($_POST['notes'] ?? '');

    if ($floors < 1) $floors = 1;

    if ($block_id <= 0 || $name === '') {
        header("Location: manazil.php?block_id=$block_id&error=invalid");
        exit;
    }

    // Block must exist
    $b = $conn->query("SELECT id FROM blocks WHERE id = $block_id")->fetch_assoc();
    if (!$b) {
        header("Location: manazil.php?error=block");
        exit;
    }

    $stmt = $conn->prepare("INSERT INTO manazil (block_id, name, code, floors_count, notes) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("issis", $block_id, $name, $code, $floors, $notes);
    $stmt->execute();
    $stmt->close();

    header("Location: manazil.php?block_id=$block_id&added=1");
    exit;
}

header("Location: manazil.php");
exit;
?>