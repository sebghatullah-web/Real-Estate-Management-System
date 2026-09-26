<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id  = intval($_POST['block_id'] ?? 0);
    $manzel_id = intval($_POST['manzel_id'] ?? 0);
    $unit_no   = trim($_POST['unit_number'] ?? '');
    $category  = trim($_POST['category'] ?? '');
    $unit_size = floatval($_POST['unit_size'] ?? 0);
    $status    = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';

    // ----- Pricing (set at registration time — customers see it on the public website) -----
    $unit_price_per_meter = floatval($_POST['unit_price_per_meter'] ?? 0);
    $gov_cost_per_meter   = floatval($_POST['gov_cost_per_meter'] ?? 0);
    $infra_cost_per_meter = floatval($_POST['infra_cost_per_meter'] ?? 0);

    if ($unit_price_per_meter < 0) { $unit_price_per_meter = 0; }
    if ($gov_cost_per_meter < 0)   { $gov_cost_per_meter = 0; }
    if ($infra_cost_per_meter < 0) { $infra_cost_per_meter = 0; }

    if ($category === '' || !isset($CATEGORY_INFO[$category])) {
        $category = 'standard';
    }

    if ($block_id <= 0 || $manzel_id <= 0 || $unit_no === '' || $unit_size <= 0) {
        header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&error=invalid");
        exit;
    }

    // Price must always be set when registering a unit (customers see it on the public website)
    if ($unit_price_per_meter <= 0) {
        header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&error=price");
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
    $check = $conn->prepare("SELECT id FROM block_units
                             WHERE block_id = ? AND unit_number = ?
                               AND manzel_id = ?");
    $check->bind_param("isi", $block_id, $unit_no, $manzel_id);
    $check->execute();
    $exists = $check->get_result()->fetch_assoc();
    $check->close();

    if ($exists) {
        header("Location: block_units.php?block_id=$block_id&manzel_id=$manzel_id&error=duplicate");
        exit;
    }

    $manzel_key = !empty($manzel['code']) ? $manzel['code'] : $manzel['name'];
    $unit_code  = $block['block_code'] . '-' . $manzel_key . '-' . $unit_no;

    // Calculate total price = (unit + government + infrastructure) per sqm x unit size
    $unit_price  = round($unit_price_per_meter * $unit_size, 2);
    $gov_cost    = round($gov_cost_per_meter   * $unit_size, 2);
    $infra_cost  = round($infra_cost_per_meter * $unit_size, 2);
    $total_price = round($unit_price + $gov_cost + $infra_cost, 2);

    $stmt = $conn->prepare("INSERT INTO block_units
        (block_id, manzel_id, category, unit_number, unit_code, unit_size,
         unit_price_per_meter, gov_cost_per_meter, infra_cost_per_meter,
         unit_price, gov_cost, infra_cost, total_price, status)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iisssdddddddds", $block_id, $manzel_id, $category, $unit_no, $unit_code, $unit_size,
                      $unit_price_per_meter, $gov_cost_per_meter, $infra_cost_per_meter,
                      $unit_price, $gov_cost, $infra_cost, $total_price, $status);
    $stmt->execute();
    $unit_id = $conn->insert_id;
    $stmt->close();

    // Save unit details (block_unit_features) — dynamic per-category features
    $features = $_POST['features'] ?? [];
    if (!is_array($features)) {
        $features = [];
    }
    $featureMap = category_features_map($conn, $category);
    if (count($features) > 0 && count($featureMap) > 0) {
        $fStmt = $conn->prepare("INSERT INTO block_unit_features (unit_id, feature_key, feature_label) VALUES (?, ?, ?)");
        foreach ($features as $fid) {
            $fid = intval($fid);
            $label = $featureMap[$fid] ?? null;
            if ($label !== null) {
                $fkey = (string)$fid;
                $fStmt->bind_param("iss", $unit_id, $fkey, $label);
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