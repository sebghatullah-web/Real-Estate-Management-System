<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
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
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
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


            <!-- فرم افزودن مشتری -->
            <h3 class="mt-5">افزودن مشتری جدید</h3>
            <form action="add_customer.php" method="POST" enctype="multipart/form-data" class="row g-3">
                <div class="col-md-3">
                    <label class="form-label">نام کامل</label>
                    <input type="text" name="full_name" class="form-control" required>
                </div>
                <div class="col-md-3">
                    <label class="form-label">نام پدر</label>
                    <input type="text" name="fathar_name" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">شماره تماس</label>
                    <input type="text" name="phone" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">ایمیل</label>
                    <input type="email" name="email" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">شماره تذکره</label>
                    <input type="text" name="national_id" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">آدرس</label>
                    <input type="text" name="address" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">شغل</label>
                    <input type="text" name="occupation" class="form-control">
                </div>
                <div class="col-md-3">
                    <label class="form-label">عکس پروفایل (URL)</label>
                    <input type="file" name="profile_pic" class="form-control">
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-success">ثبت مشتری</button>
                </div>
            </form>


            <h2 class="mb-4">لیست مشتریان</h2>

            <!-- جدول مشتریان -->
            <table id="plotsTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                    <th>آی‌دی</th>
                    <th>نام کامل</th>
                    <th>نام پدر</th>
                    <th>شماره تماس</th>
                    <th>ایمیل</th>
                    <th>عملیات</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $result = $conn->query("SELECT * FROM customers ORDER BY id DESC");
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                    <td><?= $row['id'] ?></td>
                    <td><?= $row['full_name'] ?></td>
                    <td><?= $row['fathar_name'] ?></td>
                    <td><?= $row['phone'] ?></td>
                    <td><?= $row['email'] ?></td>
                    <td>
                        <a href="edit_customer.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">ویرایش</a>
                        <a href="delete_customer.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('آیا مطمئن هستید؟')">حذف</a>
                    </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>

            

        </div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>


    <!-- jQuery فقط یک بار -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#plotsTable').DataTable({
                "pageLength": 10,
                "lengthMenu": [10, 20, 30, 50],
                "language": {
                    "search": "جستجو:",
                    "lengthMenu": "نمایش _MENU_ رکورد در هر صفحه",
                    "info": "نمایش _START_ تا _END_ از _TOTAL_ رکورد",
                    "paginate": {
                        "first": "اول",
                        "last": "آخر",
                        "next": "بعدی",
                        "previous": "قبلی"
                    }
                },
                dom: 'Bfrtip', // اضافه کردن بخش دکمه‌ها
                buttons: [
                    { extend: 'excelHtml5', text: 'خروجی Excel' },
                    { extend: 'pdfHtml5', text: 'خروجی PDF' },
                    { extend: 'print', text: 'چاپ' }
                ]
            });
        });
    </script>



    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!-- DataTables Buttons -->
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
    <!-- وابستگی‌ها برای Excel و PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <!-- Bootstrap and necessary plugins -->
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
