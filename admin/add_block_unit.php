<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id = intval($_POST['block_id'] ?? 0);
    $floor    = intval($_POST['floor_number'] ?? 0);
    $unit_no  = trim($_POST['unit_number'] ?? '');
    $rooms    = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status   = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';

    if ($block_id <= 0 || $floor <= 0 || $unit_no === '') {
        header("Location: block_units.php?block_id=$block_id&error=invalid");
        exit;
    }

    // دریافت معلومات بلاک برای ساخت کد واحد و متراژ
    $bResult = $conn->query("SELECT * FROM blocks WHERE id = $block_id");
    $block = $bResult->fetch_assoc();

    if (!$block) {
        header("Location: block_units.php?error=block");
        exit;
    }

    $unit_code  = $block['block_code'] . '-' . $floor . '-' . $unit_no;
    $unit_size  = $block['unit_size'];

    // جلوگیری از تکراری بودن کد واحد
    $check = $conn->prepare("SELECT id FROM block_units WHERE block_id = ? AND floor_number = ? AND unit_number = ?");
    $check->bind_param("iis", $block_id, $floor, $unit_no);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        header("Location: block_units.php?block_id=$block_id&error=duplicate");
        exit;
    }
    $check->close();

    $stmt = $conn->prepare("INSERT INTO block_units (block_id, floor_number, unit_number, unit_code, rooms, unit_size, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iississ", $block_id, $floor, $unit_no, $unit_code, $rooms, $unit_size, $status);
    $stmt->execute();
    $stmt->close();

    header("Location: block_units.php?block_id=$block_id");
    exit;
}

header("Location: block_units.php");
exit;
?>