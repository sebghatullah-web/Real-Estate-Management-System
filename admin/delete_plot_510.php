<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
$id = $_GET['id'];
$conn->query("DELETE FROM plots_510 WHERE id=$id");
header("Location: plots_510.php");
exit;
?>
