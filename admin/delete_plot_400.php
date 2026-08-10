<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
$id = $_GET['id'];
$conn->query("DELETE FROM plots_400 WHERE id=$id");
header("Location: plots_400.php");
exit;
?>
