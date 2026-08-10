<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $uploadDir = "img/profilePic/";
    $profilePicPath = null;

    if (!empty($_FILES['profile_pic']['name'])) {
        $fileName = time() . "_" . basename($_FILES['profile_pic']['name']);
        $targetFile = $uploadDir . $fileName;

        if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $targetFile)) {
            $profilePicPath = $targetFile;
        }
    }

    $stmt = $conn->prepare("INSERT INTO customers (full_name, fathar_name, address, occupation, phone, email, national_id, profile_pic) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("ssssssss", $_POST['full_name'], $_POST['fathar_name'], $_POST['address'], $_POST['occupation'], $_POST['phone'], $_POST['email'], $_POST['national_id'], $profilePicPath);
    $stmt->execute();
}
header("Location: customers.php");
exit;
?>
