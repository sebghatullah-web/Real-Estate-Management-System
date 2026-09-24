<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id  = intval($_POST['block_id'] ?? 0);
    $manzel_id = intval($_POST['manzel_id'] ?? 0);
    $floor     = intval($_POST['floor_number'] ?? 1);
    $unit_no   = trim($_POST['unit_number'] ?? '');
    $category  = trim($_POST['category'] ?? '');
    $unit_size = floatval($_POST['unit_size'] ?? 0);
    $rooms     = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status    = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';

    if ($category === '' || !isset($CATEGORY_INFO[$category])) {
        $category = 'standard';
    }

    if ($floor < 1) $floor = 1;

    if ($block_id <= 0 || $manzel_id <= 0 || $unit_no === '' || $unit_size <= 0) {
        header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&error=invalid");
        exit;
    }

    // Get block info
    $bResult = $conn->query("SELECT * FROM blocks WHERE id = $block_id");
    $block = $bResult->fetch_assoc();

    if (!$block) {
        header("Location: block_units.php?error=block");
        exit;
    }

    // Manzel must exist and belong to that block
    $mRes = $conn->query("SELECT id, name, code FROM manazil WHERE id = $manzel_id AND block_id = $block_id");
    $manzel = $mRes->fetch_assoc();
    if (!$manzel) {
        header("Location: block_units.php?block_id=$block_id&error=manzel");
        exit;
    }

    // Duplicate check: same unit number in the same block/building
    // (legacy units without a building fall back to floor-based check)
    $check = $conn->prepare("SELECT id FROM block_units
                             WHERE block_id = ? AND unit_number = ?
                               AND ( (manzel_id IS NULL AND floor_number = ?) OR manzel_id = ? )");
    $check->bind_param("isii", $block_id, $unit_no, $floor, $manzel_id);
    $check->execute();
    $exists = $check->get_result()->fetch_assoc();
    $check->close();

    if ($exists) {
        header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&error=duplicate");
        exit;
    }

    $manzel_key = !empty($manzel['code']) ? $manzel['code'] : $manzel['name'];
    $unit_code  = $block['block_code'] . '-' . $manzel_key . '-' . $unit_no;

    $stmt = $conn->prepare("INSERT INTO block_units
        (block_id, manzel_id, floor_number, units_per_floor, category, unit_number, unit_code, rooms, unit_size, status)
        VALUES (?, ?, ?, 1, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iiisssids", $block_id, $manzel_id, $floor, $category, $unit_no, $unit_code, $rooms, $unit_size, $status);
    $stmt->execute();
    $unit_id = $conn->insert_id;
    $stmt->close();

    // Save unit details (block_unit_features)
    $features = $_POST['features'] ?? [];
    if (!is_array($features) && $features !== '' && $features !== null) {
        $features = array($features);
    }
    if (count($features) > 0) {
        $fStmt = $conn->prepare("INSERT INTO block_unit_features (unit_id, feature_key, feature_label) VALUES (?, ?, ?)");
        foreach ($features as $key) {
            $label = $UNIT_FEATURES[$key] ?? null;
            if ($label !== null) {
                $fStmt->bind_param("iss", $unit_id, $key, $label);
                $fStmt->execute();
            }
        }
        $fStmt->close();
    }

    header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&added=1&skipped=0");
    exit;
}

header("Location: block_units.php");
exit;
?>