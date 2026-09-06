<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT bu.*, b.block_code, b.block_name, b.unit_size AS block_unit_size FROM block_units bu JOIN blocks b ON bu.block_id = b.id WHERE bu.id = $id");
$unit = $result->fetch_assoc();

if (!$unit) {
    header("Location: block_units.php");
    exit;
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $floor    = intval($_POST['floor_number'] ?? 0);
    $unit_no  = trim($_POST['unit_number'] ?? '');
    $rooms    = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status   = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';
    $customer = !empty($_POST['customer_id']) ? intval($_POST['customer_id']) : NULL;

    if ($floor <= 0 || $unit_no === '') {
        header("Location: edit_block_unit.php?id=$id&error=invalid");
        exit;
    }

    $unit_code = $unit['block_code'] . '-' . $floor . '-' . $unit_no;

    // جلوگیری از تکراری بودن کد واحد
    $check = $conn->prepare("SELECT id FROM block_units WHERE block_id = ? AND floor_number = ? AND unit_number = ? AND id != ?");
    $check->bind_param("iisi", $unit['block_id'], $floor, $unit_no, $id);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        header("Location: edit_block_unit.php?id=$id&error=duplicate");
        exit;
    }
    $check->close();

    $stmt = $conn->prepare("UPDATE block_units SET floor_number=?, unit_number=?, unit_code=?, rooms=?, status=?, customer_id=? WHERE id=?");
    $stmt->bind_param("ississi", $floor, $unit_no, $unit_code, $rooms, $status, $customer, $id);
    $stmt->execute();
    $stmt->close();

    header("Location: block_units.php?block_id=" . $unit['block_id']);
    exit;
}

$customersResult = $conn->query("SELECT id, full_name FROM customers ORDER BY full_name ASC");
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
    <title>ویرایش اپارتمان / واحد</title>
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
            <li class="breadcrumb-item"><a href="block_units.php?block_id=<?= $unit['block_id'] ?>">واحدها</a>
            </li>
            <li class="breadcrumb-item active">ویرایش اپارتمان</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="block_units.php?block_id=<?= $unit['block_id'] ?>"><i class="icon-graph"></i> &nbsp;بازگشت به واحدها</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php if (isset($_GET['error']) && $_GET['error'] == 'duplicate'): ?>
                <div class="alert alert-danger mt-3">در این منزل همین شماره واحد قبلاً ثبت شده است.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger mt-3">ورودی نامعتبر است.</div>
            <?php endif; ?>

            <h2 class="mb-4">ویرایش اپارتمان: <?= htmlspecialchars($unit['unit_code']) ?></h2>

            <?php if ($unit['status'] == 'sold' && $unit['total_price'] !== null): ?>
                <!-- ========== معلومات فروش (قابل مشاهده بعد از فروش) ========== -->
                <div class="card mb-4">
                    <div class="card-header bg-success text-white"><strong>معلومات فروش</strong></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3"><strong>قیمت واحد (فی متر):</strong> <?= htmlspecialchars($unit['unit_price_per_meter']) ?> دالر</div>
                            <div class="col-md-3"><strong>خدمات دولت (فی متر):</strong> <?= htmlspecialchars($unit['gov_cost_per_meter']) ?> دالر</div>
                            <div class="col-md-3"><strong>خدمات زیربنا (فی متر):</strong> <?= htmlspecialchars($unit['infra_cost_per_meter']) ?> دالر</div>
                            <div class="col-md-3"><strong>تاریخ فروش:</strong> <?= htmlspecialchars($unit['sold_at']) ?></div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-3"><strong>قیمت واحد:</strong> <?= htmlspecialchars($unit['unit_price']) ?> دالر</div>
                            <div class="col-md-3"><strong>خدمات دولت:</strong> <?= htmlspecialchars($unit['gov_cost']) ?> دالر</div>
                            <div class="col-md-3"><strong>خدمات زیربنا:</strong> <?= htmlspecialchars($unit['infra_cost']) ?> دالر</div>
                            <div class="col-md-3"><strong class="text-success">قیمت مجموعی:</strong> <?= htmlspecialchars($unit['total_price']) ?> دالر</div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <div class="card">
                <div class="card-header"><strong>بلاک: <?= htmlspecialchars($unit['block_code']) ?></strong></div>
                <div class="card-body">
<form method="POST" class="row g-3">
                        <div class="col-md-4">
                            <label class="form-label">شماره منزل / طبقه <span class="text-danger">*</span></label>
                            <input type="number" name="floor_number" class="form-control" min="1" value="<?= htmlspecialchars($unit['floor_number']) ?>" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">شماره واحد <span class="text-danger">*</span></label>
                            <input type="text" name="unit_number" class="form-control" value="<?= htmlspecialchars($unit['unit_number']) ?>" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">متراژ واحد</label>
                            <div class="form-control bg-light fw-bold"><?= htmlspecialchars($unit['unit_size']) ?> متر مربع</div>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">تعداد اتاق</label>
                            <select name="rooms" class="form-select">
                                <option value="1" <?= $unit['rooms'] == '1' ? 'selected' : '' ?>>۱ اتاقه</option>
                                <option value="2" <?= $unit['rooms'] == '2' ? 'selected' : '' ?>>۲ اتاقه</option>
                                <option value="3" <?= $unit['rooms'] == '3' ? 'selected' : '' ?>>۳ اتاقه</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">وضعیت</label>
                            <select name="status" class="form-select">
                                <option value="available" <?= $unit['status'] == 'available' ? 'selected' : '' ?>>قابل فروش</option>
                                <option value="reserved" <?= $unit['status'] == 'reserved' ? 'selected' : '' ?>>رزرو شده</option>
                                <option value="sold" <?= $unit['status'] == 'sold' ? 'selected' : '' ?>>فروخته شده</option>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">مشتری</label>
                            <select name="customer_id" class="form-select">
                                <option value="">-- بدون مشتری --</option>
                                <?php while ($c = $customersResult->fetch_assoc()): ?>
                                <option value="<?= $c['id'] ?>" <?= $unit['customer_id'] == $c['id'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($c['full_name']) ?>
                                </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">ذخیره تغییرات</button>
                            <a href="block_units.php?block_id=<?= $unit['block_id'] ?>" class="btn btn-secondary">بازگشت</a>
                        </div>
                    </form>
</div>
                </div>
            </div>
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

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>