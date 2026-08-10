<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $stmt = $conn->prepare("INSERT INTO plots_1000 (plot_code, type, area, base_price, infra_cost, gov_cost, total_price, status, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssiddddsdd", $_POST['plot_code'], $_POST['type'], $_POST['area'], $_POST['base_price'], $_POST['infra_cost'], $_POST['gov_cost'], $_POST['total_price'], $_POST['status'], $_POST['latitude'], $_POST['longitude']);
    $stmt->execute();
}
header("Location: plots_1000.php");
exit;
?>