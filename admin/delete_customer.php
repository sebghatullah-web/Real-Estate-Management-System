<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
$id = $_GET['id'];

try {
    // Delete profile picture
    $result = $conn->query("SELECT profile_pic FROM customers WHERE id=$id");
    if ($row = $result->fetch_assoc()) {
        if ($row['profile_pic'] && file_exists($row['profile_pic'])) {
            unlink($row['profile_pic']);
        }
    }

    // Attempt to delete the customer
    if (!$conn->query("DELETE FROM customers WHERE id=$id")) {
        throw new Exception($conn->error, $conn->errno);
    }

    header("Location: customers.php");
    exit;

} catch (Exception $e) {
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Delete Customer Error</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="container mt-4">
        <?php if ($e->getCode() == 1451): ?>
            <div class="alert alert-danger">
                This customer has a registered plot and cannot be deleted!
            </div>
        <?php else: ?>
            <div class="alert alert-warning">
                An unexpected error occurred: <?= htmlspecialchars($e->getMessage()) ?>
            </div>
        <?php endif; ?>
        <a href="customers.php" class="btn btn-primary mt-3">Back</a>
    </body>
    </html>
    <?php
}
?>
