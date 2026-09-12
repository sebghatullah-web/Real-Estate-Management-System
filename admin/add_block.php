<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    // دریافت و اعتبارسنجی ورودی‌ها
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

    // درج بلاک (بدون category و units_per_floor — اینها حالا متعلق به واحدها است)
    $stmt = $conn->prepare("INSERT INTO blocks (block_code, block_name, size, staircase_size, floors_count, status) VALUES (?, ?, ?, ?, ?, 'active')");
    $stmt->bind_param("ssiii", $block_code, $block_name, $size, $staircase, $floors);
    $stmt->execute();
    $stmt->close();

    $block_id = $conn->insert_id;

    // ثبت امکانات بلاک
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

    // توجه: واحدهای اپارتمان به‌صورت خودکار ساخته نمی‌شود؛ ادمین بعداً از بخش واحدها اضافه می‌کند.

    header("Location: blocks.php?ok=1&new=$block_id");
    exit;
}

header("Location: blocks.php");
exit;
?>