<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT * FROM blocks WHERE id = $id");
$block = $result->fetch_assoc();

if (!$block) {
    header("Location: blocks.php");
    exit;
}

// امکانات فعلی بلاک
$curAmenities = [];
$amRes = $conn->query("SELECT amenity_key FROM block_amenities WHERE block_id = $id");
while ($a = $amRes->fetch_assoc()) {
    $curAmenities[$a['amenity_key']] = true;
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_code = trim($_POST['block_code'] ?? '');
    $block_name = trim($_POST['block_name'] ?? '');
    $size       = intval($_POST['size'] ?? 0);
    $staircase  = intval($_POST['staircase_size'] ?? 45);
    $floors     = intval($_POST['floors_count'] ?? 0);
    $status     = $_POST['status'] == 'inactive' ? 'inactive' : 'active';

    if ($staircase < 0) $staircase = 0;

    if ($block_code === '' || $size <= 0 || $floors <= 0 || $size - $staircase <= 0) {
        header("Location: edit_block.php?id=$id&error=invalid");
        exit;
    }

    $stmt = $conn->prepare("UPDATE blocks SET block_code=?, block_name=?, size=?, staircase_size=?, floors_count=?, status=? WHERE id=?");
    $stmt->bind_param("ssiiisi", $block_code, $block_name, $size, $staircase, $floors, $status, $id);
    $stmt->execute();
    $stmt->close();

    // به‌روزرسانی امکانات: حذف قبلی و درج انتخاب‌شده
    $conn->query("DELETE FROM block_amenities WHERE block_id = $id");
    $amenities = $_POST['amenities'] ?? [];
    if (is_array($amenities) && count($amenities) > 0) {
        $amStmt = $conn->prepare("INSERT INTO block_amenities (block_id, amenity_key, amenity_label) VALUES (?, ?, ?)");
        foreach ($amenities as $key) {
            $label = $BLOCK_AMENITIES[$key] ?? null;
            if ($label !== null) {
                $amStmt->bind_param("iss", $id, $key, $label);
                $amStmt->execute();
            }
        }
        $amStmt->close();
    }

    header("Location: blocks.php?ok=1");
    exit;
}
?>
<!DOCTYPE html>
<html lang="IR-fa" dir="rtl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CoreUI Bootstrap 4 Admin Template">
    <meta name="author" content="Lukasz Holeczek">
    <meta name="keyword" content="CoreUI Bootstrap 4 Admin Template">
    <!-- <link rel="shortcut icon" href="assets/ico/favicon.png"> -->
    <title>ویرایش بلاک</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/dest/style.css" rel="stylesheet">
</head>


<body class="navbar-fixed sidebar-nav fixed-nav">
    <?php require_once 'includes/header.php'; ?>
    <?php require_once 'includes/sidebar.php'; ?>
    
    <!-- Main content -->
    <main class="main">

        <!-- Breadcrumb -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">خانه</li>
            <li class="breadcrumb-item"><a href="blocks.php">بلاک‌ها</a>
            </li>
            <li class="breadcrumb-item active">ویرایش بلاک</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="blocks.php"><i class="icon-graph"></i> &nbsp;بازگشت به لیست</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php if (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger mt-3">ورودی نامعتبر است. لطفاً مقادیر را بررسی کنید.</div>
            <?php endif; ?>

            <h2 class="mb-4">ویرایش بلاک: <?= htmlspecialchars($block['block_code']) ?></h2>
<form method="POST" class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">کد بلاک <span class="text-danger">*</span></label>
                        <input type="text" name="block_code" class="form-control" value="<?= htmlspecialchars($block['block_code']) ?>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">نام بلاک</label>
                        <input type="text" name="block_name" class="form-control" value="<?= htmlspecialchars($block['block_name'] ?? '') ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">سایز بلاک (متر مربع) <span class="text-danger">*</span></label>
                        <input type="number" id="size" name="size" class="form-control" list="size_options" min="1" value="<?= htmlspecialchars($block['size']) ?>" required>
                        <datalist id="size_options">
                            <option value="114">114 - ۵ منزل</option>
                            <option value="412">412 - ۷ منزل</option>
                            <option value="644">644 - ۱۰ منزل</option>
                            <option value="902">902 - ۷ منزل</option>
                        </datalist>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">تعداد منزل / طبقه‌ها <span class="text-danger">*</span></label>
                        <input type="number" id="floors_count" name="floors_count" class="form-control" min="1" value="<?= htmlspecialchars($block['floors_count']) ?>" required>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">راه پله (متر مربع)</label>
                        <input type="number" id="staircase_size" name="staircase_size" class="form-control" min="0" value="<?= htmlspecialchars($block['staircase_size']) ?>">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">وضعیت</label>
                        <select name="status" class="form-select">
                            <option value="active" <?= $block['status'] == 'active' ? 'selected' : '' ?>>فعال</option>
                            <option value="inactive" <?= $block['status'] == 'inactive' ? 'selected' : '' ?>>غیرفعال</option>
                        </select>
                    </div>
                    <div class="col-12 mt-2">
                        <label class="form-label fw-bold">امکانات بلاک (اختیاری)</label>
                        <div class="row">
                            <?php foreach ($BLOCK_AMENITIES as $key => $label): ?>
                            <div class="col-md-2 form-check ms-1">
                                <input class="form-check-input" type="checkbox" name="amenities[]" value="<?= $key ?>" id="am_<?= $key ?>" <?= isset($curAmenities[$key]) ? 'checked' : '' ?>>
                                <label class="form-check-label small" for="am_<?= $key ?>"><?= htmlspecialchars($label) ?></label>
                            </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">ذخیره تغییرات</button>
                        <a href="blocks.php" class="btn btn-secondary">بازگشت</a>
                    </div>
                </form>
</div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>

    <!-- Plugins and scripts required by all views -->
    <script src="style/js/libs/Chart.min.js"></script>

    <!-- CoreUI main scripts -->
    <script src="style/js/app.js"></script>

    <script src="style/js/views/main.js"></script>

    <script>
    // ===== پر کردن خودکار تعداد منزل بر اساس سایز =====
    var sizeFloors = { 114: 5, 412: 7, 644: 10, 902: 7 };
    $('#size').on('input change', function() {
        var s = parseInt(this.value);
        if (sizeFloors[s]) {
            $('#floors_count').val(sizeFloors[s]);
        }
    });
    </script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>