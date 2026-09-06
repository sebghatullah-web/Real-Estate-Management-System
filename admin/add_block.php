<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    // دریافت و اعتبارسنجی ورودی‌ها
    $block_code   = trim($_POST['block_code'] ?? '');
    $block_name   = trim($_POST['block_name'] ?? '');
    $size         = intval($_POST['size'] ?? 0);
    $staircase    = intval($_POST['staircase_size'] ?? 45);
    $floors       = intval($_POST['floors_count'] ?? 0);
    $units_per_fl = intval($_POST['units_per_floor'] ?? 1);
    $category     = in_array($_POST['category'] ?? '', ['standard', 'premium', 'vip']) ? $_POST['category'] : 'standard';

    if ($block_code === '' || $size <= 0 || $floors <= 0 || $units_per_fl < 1 || $units_per_fl > 3) {
        header("Location: blocks.php?error=invalid");
        exit;
    }

    if ($staircase < 0) {
        $staircase = 0;
    }

    // متراژ هر واحد = (سایز بلاک - راه پله) ÷ تعداد واحد در هر منزل
    $usable = $size - $staircase;
    if ($usable <= 0) {
        header("Location: blocks.php?error=size");
        exit;
    }
    $unit_size = round($usable / $units_per_fl, 2);

    // درج بلاک
    $stmt = $conn->prepare("INSERT INTO blocks (block_code, block_name, size, staircase_size, floors_count, units_per_floor, unit_size, category, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'active')");
    $stmt->bind_param("ssiiiiis", $block_code, $block_name, $size, $staircase, $floors, $units_per_fl, $unit_size, $category);
    $stmt->execute();

    $block_id = $conn->insert_id;

    // تولید خودکار اپارتمان/واحدها برای تمام منزل‌ها
    $unitStmt = $conn->prepare("INSERT INTO block_units (block_id, floor_number, unit_number, unit_code, rooms, unit_size, status) VALUES (?, ?, ?, ?, 1, ?, 'available')");

    for ($floor = 1; $floor <= $floors; $floor++) {
        for ($u = 1; $u <= $units_per_fl; $u++) {
            $unit_code = $block_code . '-' . $floor . '-' . $u;
            $unitStmt->bind_param("iissd", $block_id, $floor, $u, $unit_code, $unit_size);
            $unitStmt->execute();
        }
    }

    $unitStmt->close();
    $stmt->close();

    header("Location: blocks.php?ok=1");
    exit;
}

header("Location: blocks.php");
exit;
?>