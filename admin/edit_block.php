<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT * FROM blocks WHERE id = $id");
$block = $result->fetch_assoc();

if (!$block) {
    header("Location: blocks.php");
    exit;
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_code   = trim($_POST['block_code'] ?? '');
    $block_name   = trim($_POST['block_name'] ?? '');
    $size         = intval($_POST['size'] ?? 0);
    $staircase    = intval($_POST['staircase_size'] ?? 45);
    $floors       = intval($_POST['floors_count'] ?? 0);
    $units_per_fl = intval($_POST['units_per_floor'] ?? 1);
    $category     = in_array($_POST['category'] ?? '', ['standard', 'premium', 'vip']) ? $_POST['category'] : 'standard';
    $status       = $_POST['status'] == 'inactive' ? 'inactive' : 'active';

    if ($staircase < 0) $staircase = 0;
    $usable = $size - $staircase;
    $unit_size = $usable > 0 ? round($usable / $units_per_fl, 2) : 0;

    // جلوگیری از خراب شدن بلاک
    if ($block_code === '' || $size <= 0 || $floors <= 0 || $units_per_fl < 1 || $units_per_fl > 3 || $usable <= 0) {
        header("Location: edit_block.php?id=$id&error=invalid");
        exit;
    }

    $stmt = $conn->prepare("UPDATE blocks SET block_code=?, block_name=?, size=?, staircase_size=?, floors_count=?, units_per_floor=?, unit_size=?, category=?, status=? WHERE id=?");
    $stmt->bind_param("ssiiiiissi", $block_code, $block_name, $size, $staircase, $floors, $units_per_fl, $unit_size, $category, $status, $id);
    $stmt->execute();

    $structureChanged = ($floors != $block['floors_count']) || ($units_per_fl != $block['units_per_floor']);

    if ($structureChanged) {
        // ساختار تغییر کرده → همه اپارتمان‌های قبلی حذف و از نو ساخته می‌شوند
        if (!isset($_POST['confirm_rebuild'])) {
            header("Location: edit_block.php?id=$id&error=rebuild");
            exit;
        }
        $conn->query("DELETE FROM block_units WHERE block_id = $id");
        $unitStmt = $conn->prepare("INSERT INTO block_units (block_id, floor_number, unit_number, unit_code, rooms, unit_size, status) VALUES (?, ?, ?, ?, 1, ?, 'available')");
        for ($floor = 1; $floor <= $floors; $floor++) {
            for ($u = 1; $u <= $units_per_fl; $u++) {
                $unit_code = $block_code . '-' . $floor . '-' . $u;
                $unitStmt->bind_param("iissd", $id, $floor, $u, $unit_code, $unit_size);
                $unitStmt->execute();
            }
        }
        $unitStmt->close();
    } else {
        // ساختار ثابت است ولی ممکن است متراژ واحد تغییر کرده باشد → به‌روزرسانی واحدها
        $conn->query("UPDATE block_units SET unit_size = $unit_size WHERE block_id = $id");
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
                <small class="text-danger" id="structure_warn" style="display:none;">تغییر ساختار → اپارتمان‌های قبلی حذف می‌شوند</small>
              </div>
              <div class="col-md-4">
                <label class="form-label">راه پله (متر مربع)</label>
                <input type="number" id="staircase_size" name="staircase_size" class="form-control" min="0" value="<?= htmlspecialchars($block['staircase_size']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">تعداد واحد در هر منزل <span class="text-danger">*</span></label>
                <select id="units_per_floor" name="units_per_floor" class="form-select" required>
                  <option value="1" <?= $block['units_per_floor']=='1'?'selected':'' ?>>۱ واحد</option>
                  <option value="2" <?= $block['units_per_floor']=='2'?'selected':'' ?>>۲ واحد</option>
                  <option value="3" <?= $block['units_per_floor']=='3'?'selected':'' ?>>۳ واحد</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">کتگوری بلاک</label>
                <select name="category" class="form-select">
                  <option value="standard" <?= $block['category']=='standard'?'selected':'' ?>>استاندارد</option>
                  <option value="premium" <?= $block['category']=='premium'?'selected':'' ?>>پریمیوم</option>
                  <option value="vip" <?= $block['category']=='vip'?'selected':'' ?>>وی‌آی‌پی</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">وضعیت</label>
                <select name="status" class="form-select">
                  <option value="active" <?= $block['status']=='active'?'selected':'' ?>>فعال</option>
                  <option value="inactive" <?= $block['status']=='inactive'?'selected':'' ?>>غیرفعال</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">متراژ هر واحد</label>
                <div class="form-control bg-light fw-bold" id="unit_size_preview"><?= htmlspecialchars($block['unit_size']) ?> متر مربع</div>
              </div>
              <div class="col-12">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" name="confirm_rebuild" id="confirm_rebuild" value="1">
                  <label class="form-check-label text-danger" for="confirm_rebuild">
                    بازسازی اپارتمان‌ها (فقط هنگام تغییر تعداد منزل یا تعداد واحد در منزل تیک بزنید)
                  </label>
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
    var originalFloors = <?= (int)$block['floors_count'] ?>;
    var originalUnits  = <?= (int)$block['units_per_floor'] ?>;

    function checkStructureChange() {
        var f = parseInt($('#floors_count').val());
        var u = parseInt($('#units_per_floor').val());
        if (f !== originalFloors || u !== originalUnits) {
            $('#structure_warn').show();
        } else {
            $('#structure_warn').hide();
        }
        calcUnitSize();
    }

    function calcUnitSize() {
        var size = parseFloat($('#size').val()) || 0;
        var stairs = parseFloat($('#staircase_size').val());
        if (isNaN(stairs) || stairs < 0) stairs = 0;
        var units = parseInt($('#units_per_floor').val()) || 1;
        var usable = size - stairs;
        var per = units > 0 ? usable / units : 0;
        $('#unit_size_preview').text(per > 0 ? per.toFixed(2) + ' متر مربع' : 'ورودی نامعتبر');
    }

    $('#size').on('input change', function() {
        var s = parseInt(this.value);
        var map = { 114: 5, 412: 7, 644: 10, 902: 7 };
        if (map[s]) {
            $('#floors_count').val(map[s]);
        }
        checkStructureChange();
    });
    $('#floors_count, #staircase_size, #units_per_floor').on('input change', checkStructureChange);
    </script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="blocks.php"><i class="icon-graph"></i> &nbsp;بازگشت به لیست</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php if (isset($_GET['error']) && $_GET['error'] == 'rebuild'): ?>
                <div class="alert alert-danger mt-3">
                    ساختار بلاک (تعداد منزل یا تعداد واحد در منزل) تغییر کرده است. برای اعمال تغییر باید گزینه «بازسازی اپارتمان‌ها» را فعال کنید. توجه: با این کار تمام اپارتمان‌های قبلی و اطلاعات مشتریان آن‌ها حذف و اپارتمان‌های جدید ساخته می‌شوند.
                </div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger mt-3">ورودی نامعتبر است. لطفاً مقادیر را بررسی کنید.</div>
            <?php endif; ?>

            <h2 class="mb-4">ویرایش بلاک: <?= htmlspecialchars($block['block_code']) ?></h2>