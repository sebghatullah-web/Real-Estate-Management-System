<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = $_GET['id'];
$result = $conn->query("SELECT * FROM plots_600 WHERE id=$id");
$plot = $result->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // آماده‌سازی مقدار customer_id
    $cust_id = !empty($_POST['customer_id']) ? $_POST['customer_id'] : NULL;

    $stmt = $conn->prepare("UPDATE plots_600 
        SET plot_code=?, type=?, area=?, base_price=?, infra_cost=?, gov_cost=?, total_price=?, status=?, customer_id=?, latitude=?, longitude=? 
        WHERE id=?");

    $stmt->bind_param("ssiddddsiddi", 
        $_POST['plot_code'],   // s
        $_POST['type'],        // s
        $_POST['area'],        // i
        $_POST['base_price'],  // d
        $_POST['infra_cost'],  // d
        $_POST['gov_cost'],    // d
        $_POST['total_price'], // d
        $_POST['status'],      // s
        $cust_id,              // i
        $_POST['latitude'],    // d
        $_POST['longitude'],   // d
        $id                    // i
    );
    $stmt->execute();
    header("Location: plots_600.php");
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
    <title>CoreUI Bootstrap 4 Admin Template</title>
    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <!-- Main styles for this application -->
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
            <li class="breadcrumb-item"><a href="#">مدیریت</a>
            </li>
            <li class="breadcrumb-item active">داشبرد</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="#"><i class="icon-speech"></i></a>
                    <a class="btn btn-secondary" href="./"><i class="icon-graph"></i> &nbsp;داشبرد</a>
                    <a class="btn btn-secondary" href="#"><i class="icon-settings"></i> &nbsp;تنظیمات</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <h2 class="mb-4">ویرایش نمره دو بسوه‌ای</h2>
            <form method="POST" class="row g-3">
              <div class="col-md-4">
                <label class="form-label">کد نمره</label>
                <input type="text" name="plot_code" class="form-control" value="<?= htmlspecialchars($plot['plot_code']) ?>" required>
              </div>
              <div class="col-md-4">
                <label class="form-label">نوع</label>
                <input type="text" name="type" class="form-control" value="<?= htmlspecialchars($plot['type']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">مساحت</label>
                <input type="number" name="area" class="form-control" value="<?= htmlspecialchars($plot['area']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">قیمت پایه</label>
                <input type="number" step="0.01" name="base_price" class="form-control" value="<?= htmlspecialchars($plot['base_price']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">هزینه خدمات زیربنا</label>
                <input type="number" step="0.01" name="infra_cost" class="form-control" value="<?= htmlspecialchars($plot['infra_cost']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">هزینه خدمات دولتی</label>
                <input type="number" step="0.01" name="gov_cost" class="form-control" value="<?= htmlspecialchars($plot['gov_cost']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">قیمت مجموعی</label>
                <input type="number" step="0.01" name="total_price" class="form-control" value="<?= htmlspecialchars($plot['total_price']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">وضعیت</label>
                <select name="status" class="form-select">
                  <option value="available" <?= $plot['status']=='available'?'selected':'' ?>>قابل فروش</option>
                  <option value="reserved" <?= $plot['status']=='reserved'?'selected':'' ?>>رزرو شده</option>
                  <option value="sold" <?= $plot['status']=='sold'?'selected':'' ?>>فروخته شده</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label">مشتری</label>
                <input type="number" name="customer_id" class="form-control" value="<?= htmlspecialchars($plot['customer_id']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">عرض جغرافیایی</label>
                <input type="text" name="latitude" class="form-control" value="<?= htmlspecialchars($plot['latitude']) ?>">
              </div>
              <div class="col-md-4">
                <label class="form-label">طول جغرافیایی</label>
                <input type="text" name="longitude" class="form-control" value="<?= htmlspecialchars($plot['longitude']) ?>">
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary">ذخیره تغییرات</button>
                <a href="plots_260.php" class="btn btn-secondary">بازگشت</a>
              </div>
            </form>
        </div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/jquery.min.js"></script>
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>

    <!-- Plugins and scripts required by all views -->
    <script src="style/js/libs/Chart.min.js"></script>

    <!-- CoreUI main scripts -->

    <script src="style/js/app.js"></script>

    <!-- Plugins and scripts required by this views -->
    <!-- Custom scripts required by this view -->
    <script src="style/js/views/main.js"></script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>