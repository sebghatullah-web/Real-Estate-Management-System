<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    // Get and validate inputs
    $block_code = trim($_POST['block_code'] ?? '');
    $block_name = trim($_POST['block_name'] ?? '');
    $size       = intval($_POST['size'] ?? 0);
    $staircase  = intval($_POST['staircase_size'] ?? 45);
    $floors     = intval($_POST['floors_count'] ?? 0);

    if ($staircase < 0) {
        $staircase = 0;
    }

    if ($block_code === '' || $size <= 0 || $floors <= 0 || $size - $staircase <= 0) {
        header("Location: blocks.php?error=invalid");
        exit;
    }

    // Duplicate check: block_code must be unique
    $check = $conn->prepare("SELECT id FROM blocks WHERE block_code = ?");
    $check->bind_param("s", $block_code);
    $check->execute();
    $exists = $check->get_result()->fetch_assoc();
    $check->close();

    if ($exists) {
        header("Location: blocks.php?error=duplicate&code=" . urlencode($block_code));
        exit;
    }

    // Insert block (no category/units_per_floor — these now belong to units)
    $stmt = $conn->prepare("INSERT INTO blocks (block_code, block_name, size, staircase_size, floors_count, status) VALUES (?, ?, ?, ?, ?, 'active')");
    $stmt->bind_param("ssiii", $block_code, $block_name, $size, $staircase, $floors);
    try {
        $stmt->execute();
    } catch (mysqli_sql_exception $e) {
        $stmt->close();
        header("Location: blocks.php?error=db");
        exit;
    }
    $stmt->close();

    $block_id = $conn->insert_id;

    // Save block amenities
    $amenities = $_POST['amenities'] ?? [];
    if (is_array($amenities) && count($amenities) > 0) {
        $amStmt = $conn->prepare("INSERT INTO block_amenities (block_id, amenity_key, amenity_label) VALUES (?, ?, ?)");
        foreach ($amenities as $key) {
            $label = $BLOCK_AMENITIES[$key] ?? null;
            if ($label !== null) {
                $amStmt->bind_param("iss", $block_id, $key, $label);
                $amStmt->execute();
            }
        }
        $amStmt->close();
    }

    // Note: apartment units are not created automatically; the admin adds them later from the Units section.

    header("Location: blocks.php?ok=1&new=$block_id");
    exit;
}

header("Location: blocks.php");
exit;
?>