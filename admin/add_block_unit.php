<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id     = intval($_POST['block_id'] ?? 0);
    $floor        = intval($_POST['floor_number'] ?? 0);
    $units_per_fl = intval($_POST['units_per_floor'] ?? 0);
    $category     = trim($_POST['category'] ?? '');
    $unit_no_raw  = trim($_POST['unit_number'] ?? '');
    $rooms        = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status       = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';

    if ($category === '') $category = 'standard';

    // Split unit numbers (several numbers separated by comma)
    $unit_numbers = [];
    foreach (explode(',', $unit_no_raw) as $part) {
        $num = trim($part);
        if ($num !== '') $unit_numbers[] = $num;
    }

    if ($block_id <= 0 || $floor <= 0 || count($unit_numbers) == 0 || $units_per_fl < 1 || $units_per_fl > 4 || count($unit_numbers) > 4) {
        header("Location: block_units.php?block_id=$block_id&error=invalid");
        exit;
    }

    // Get block info
    $bResult = $conn->query("SELECT * FROM blocks WHERE id = $block_id");
    $block = $bResult->fetch_assoc();

    if (!$block) {
        header("Location: block_units.php?error=block");
        exit;
    }

    // Floor number must not exceed the block's floor count
    if ($floor > intval($block['floors_count'])) {
        header("Location: block_units.php?block_id=$block_id&error=floor");
        exit;
    }

    // Unit size on this floor = (block size − staircase) ÷ units per floor
    $usable = intval($block['size']) - intval($block['staircase_size']);
    if ($usable <= 0) {
        header("Location: block_units.php?block_id=$block_id&error=size");
        exit;
    }
    $unit_size = round($usable / $units_per_fl, 2);

    $added   = 0;
    $skipped = 0;
    $created_ids = [];

    $check = $conn->prepare("SELECT id FROM block_units WHERE block_id = ? AND floor_number = ? AND unit_number = ?");
    $stmt  = $conn->prepare("INSERT INTO block_units (block_id, floor_number, units_per_floor, category, unit_number, unit_code, rooms, unit_size, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

    foreach ($unit_numbers as $unit_no) {
        // Prevent duplicate unit number on the same floor
        $check->bind_param("iis", $block_id, $floor, $unit_no);
        $check->execute();
        $exists = $check->get_result()->fetch_assoc();

        if ($exists) {
            $skipped++;
            continue;
        }

        $unit_code = $block['block_code'] . '-' . $floor . '-' . $unit_no;
        $stmt->bind_param("iiisssids", $block_id, $floor, $units_per_fl, $category, $unit_no, $unit_code, $rooms, $unit_size, $status);
        $stmt->execute();
        $created_ids[] = $conn->insert_id;
        $added++;
    }

    $check->close();
    $stmt->close();

    if ($added > 0) {
        // Sync existing units on this floor (unit count and category)
        $sync = $conn->prepare("UPDATE block_units SET units_per_floor=?, category=? WHERE block_id=? AND floor_number=? AND status='available'");
        $sync->bind_param("isii", $units_per_fl, $category, $block_id, $floor);
        $sync->execute();
        $sync->close();

        // Save unit details (block_unit_features)
        $features = $_POST['features'] ?? [];
        if (!is_array($features) && $features !== '' && $features !== null) {
            $features = array($features);
        }
        if (count($features) > 0) {
            $fStmt = $conn->prepare("INSERT INTO block_unit_features (unit_id, feature_key, feature_label) VALUES (?, ?, ?)");
            foreach ($created_ids as $unit_id) {
                foreach ($features as $key) {
                    $label = $UNIT_FEATURES[$key] ?? null;
                    if ($label !== null) {
                        $fStmt->bind_param("iss", $unit_id, $key, $label);
                        $fStmt->execute();
                    }
                }
            }
            $fStmt->close();
        }
    }

    header("Location: block_units.php?block_id=$block_id&added=$added&skipped=$skipped");
    exit;
}

header("Location: block_units.php");
exit;
?>