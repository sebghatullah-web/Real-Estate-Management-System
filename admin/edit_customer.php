<?php require_once __DIR__ . '/includes/auth_check.php'; ?>

<?php
            include 'config/db.php';
            $id = $_GET['id'];
            $result = $conn->query("SELECT * FROM customers WHERE id=$id");
            $customer = $result->fetch_assoc();

            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                $uploadDir = "img/profilePic/";
                $profilePicPath = $customer['profile_pic']; // مسیر قبلی

                if (!empty($_FILES['profile_pic']['name'])) {
                    $fileName = time() . "_" . basename($_FILES['profile_pic']['name']);
                    $targetFile = $uploadDir . $fileName;

                    if (move_uploaded_file($_FILES['profile_pic']['tmp_name'], $targetFile)) {
                        $profilePicPath = $targetFile;
                    }
                }

                $stmt = $conn->prepare("UPDATE customers SET full_name=?, fathar_name=?, address=?, occupation=?, phone=?, email=?, national_id=?, profile_pic=? WHERE id=?");
                $stmt->bind_param("ssssssssi", $_POST['full_name'], $_POST['fathar_name'], $_POST['address'], $_POST['occupation'], $_POST['phone'], $_POST['email'], $_POST['national_id'], $profilePicPath, $id);
                $stmt->execute();
                header("Location: customers.php");
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


            

            <h2>ویرایش مشتری</h2>
            <form method="POST" enctype="multipart/form-data" class="row g-3">
            <div class="col-md-3">
                <label class="form-label">نام کامل</label>
                <input type="text" name="full_name" class="form-control" value="<?= $customer['full_name'] ?>" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">نام پدر</label>
                <input type="text" name="fathar_name" class="form-control" value="<?= $customer['fathar_name'] ?>">
            </div>
            <div class="col-md-3">
                <label class="form-label">آدرس</label>
                <input type="text" name="address" class="form-control" value="<?= $customer['address'] ?>">
            </div>
            <div class="col-md-3">
                <label class="form-label">وظیفه</label>
                <input type="text" name="occupation" class="form-control" value="<?= $customer['occupation'] ?>">
            </div>
            <div class="col-md-3">
                <label class="form-label">شماره تماس</label>
                <input type="text" name="phone" class="form-control" value="<?= $customer['phone'] ?>">
            </div>
            <div class="col-md-3">
                <label class="form-label">ایمیل</label>
                <input type="text" name="email" class="form-control" value="<?= $customer['email'] ?>">
            </div>
            <div class="col-md-3">
                <label class="form-label">شماره تذکره</label>
                <input type="text" name="national_id" class="form-control" value="<?= $customer['national_id'] ?>">
            </div>
            <!-- سایر فیلدها مشابه -->
            <div class="col-md-3">
                <label class="form-label">عکس پروفایل</label>
                <input type="file" name="profile_pic" class="form-control">
                <?php if($customer['profile_pic']): ?>
                <img src="<?= $customer['profile_pic'] ?>" alt="Profile" class="img-thumbnail mt-2" width="120">
                <?php endif; ?>
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">ذخیره تغییرات</button>
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
