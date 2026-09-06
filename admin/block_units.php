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
    <title>مدیریت اپارتمان‌ها / واحدها</title>
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
            <li class="breadcrumb-item"><a href="blocks.php">بلاک‌ها</a>
            </li>
            <li class="breadcrumb-item active">اپارتمان‌ها / واحدها</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="blocks.php"><i class="icon-graph"></i> &nbsp;لیست بلاک‌ها</a>
                    <a class="btn btn-secondary" href="#"><i class="icon-settings"></i> &nbsp;تنظیمات</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php
            $filter_block = isset($_GET['block_id']) ? intval($_GET['block_id']) : 0;
            $selectedBlock = null;
            if ($filter_block > 0) {
                $res = $conn->query("SELECT * FROM blocks WHERE id = $filter_block");
                $selectedBlock = $res->fetch_assoc();
            }
            $blocksResult = $conn->query("SELECT * FROM blocks ORDER BY id DESC");
            $customers = [];
            $custRes = $conn->query("SELECT id, full_name FROM customers ORDER BY full_name ASC");
            while ($c = $custRes->fetch_assoc()) {
                $customers[$c['id']] = $c['full_name'];
            }
            ?>
<!-- ========== فرم افزودن اپارتمان/واحد ========== -->
            <div class="card mt-3">
                <div class="card-header">
                    <strong>افزودن اپارتمان / واحد جدید</strong>
                    <?php if ($selectedBlock): ?>
                        <span class="badge bg-primary ms-2">بلاک: <?= htmlspecialchars($selectedBlock['block_code']) ?> (متراژ هر واحد: <?= htmlspecialchars($selectedBlock['unit_size']) ?> متر)</span>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <form action="add_block_unit.php" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">بلاک <span class="text-danger">*</span></label>
                            <select id="block_id" name="block_id" class="form-select" required>
                                <option value="">-- انتخاب بلاک --</option>
                                <?php
                                $blocksResult->data_seek(0);
                                while ($b = $blocksResult->fetch_assoc()):
                                ?>
                                <option value="<?= $b['id'] ?>" data-unit-size="<?= htmlspecialchars($b['unit_size']) ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($b['block_code']) ?> - <?= htmlspecialchars($b['size']) ?> متر (<?= htmlspecialchars($b['floors_count']) ?> منزل، <?= htmlspecialchars($b['units_per_floor']) ?> واحد/منزل)
                                </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">شماره منزل / طبقه <span class="text-danger">*</span></label>
                            <input type="number" name="floor_number" class="form-control" min="1" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">شماره واحد <span class="text-danger">*</span></label>
                            <input type="text" name="unit_number" class="form-control" placeholder="مثلاً 1" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">تعداد اتاق</label>
                            <select name="rooms" class="form-select">
                                <option value="1">۱ اتاقه</option>
                                <option value="2">۲ اتاقه</option>
                                <option value="3">۳ اتاقه</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">متراژ واحد</label>
                            <div class="form-control bg-light fw-bold" id="unit_size_preview">
                                <?= $selectedBlock ? htmlspecialchars($selectedBlock['unit_size']) . ' متر' : '-'; ?>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">وضعیت</label>
                            <select name="status" class="form-select">
                                <option value="available">قابل فروش</option>
                                <option value="reserved">رزرو شده</option>
                                <option value="sold">فروخته شده</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-success">ثبت اپارتمان</button>
                            <small class="text-muted ms-2">متراژ واحد بر اساس بلاک به‌صورت خودکار محاسبه می‌شود.</small>
                        </div>
                    </form>
                </div>
            </div>
<!-- ========== لیست اپارتمان‌ها / واحدها ========== -->
            <h2 class="mb-4">لیست اپارتمان‌ها / واحدها</h2>

            <div class="mb-3">
                <form method="GET" class="row g-2 align-items-center">
                    <div class="col-auto">
                        <select name="block_id" class="form-select" onchange="this.form.submit()">
                            <option value="">همه بلاک‌ها</option>
                            <?php
                            $blocksResult->data_seek(0);
                            while ($b = $blocksResult->fetch_assoc()):
                            ?>
                            <option value="<?= $b['id'] ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>>
                                <?= htmlspecialchars($b['block_code']) ?> - <?= htmlspecialchars($b['size']) ?> متر
                            </option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="col-auto">
                        <a href="block_units.php" class="btn btn-secondary">همه واحدها</a>
                    </div>
                </form>
            </div>

            <table id="unitsTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>آی‌دی</th>
                        <th>بلاک</th>
                        <th>اپارتمان / واحد</th>
                        <th>منزل / طبقه</th>
                        <th>تعداد اتاق</th>
                        <th>متراژ</th>
                        <th>قیمت واحد</th>
                        <th>خدمات دولت</th>
                        <th>خدمات زیربنا</th>
                        <th>قیمت مجموعی</th>
                        <th>وضعیت</th>
                        <th>مشتری</th>
                        <th>عملیات</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT bu.*, b.block_code, b.block_name, b.size
                        FROM block_units bu
                        JOIN blocks b ON bu.block_id = b.id";
                    if ($filter_block > 0) {
                        $query .= " WHERE bu.block_id = $filter_block";
                    }
                    $query .= " ORDER BY b.block_code ASC, bu.floor_number ASC, bu.unit_number ASC";
                    $result = $conn->query($query);
                    while($row = $result->fetch_assoc()):
                        $roomLabel = $row['rooms'] == 2 ? '۲ اتاقه' : ($row['rooms'] == 3 ? '۳ اتاقه' : '۱ اتاقه');
                        $statusBadge = '';
                        if ($row['status'] == 'available') {
                            $statusBadge = '<span class="badge bg-success">قابل فروش</span>';
                        } elseif ($row['status'] == 'reserved') {
                            $statusBadge = '<span class="badge bg-warning text-dark">رزرو شده</span>';
                        } else {
                            $statusBadge = '<span class="badge bg-danger">فروخته شده</span>';
                        }
                        $customerName = isset($customers[$row['customer_id']]) ? htmlspecialchars($customers[$row['customer_id']]) : ($row['customer_id'] ? 'ID: ' . $row['customer_id'] : '');
                        // قیمت‌ها فقط بعد از فروش ثبت می‌شوند
                        $hasPrice = $row['status'] == 'sold' && $row['total_price'] !== null;
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td>
                            <strong><?= htmlspecialchars($row['block_code']) ?></strong>
                            <?php if (!empty($row['block_name'])): ?>
                                <br><small class="text-muted"><?= htmlspecialchars($row['block_name']) ?></small>
                            <?php endif; ?>
                        </td>
                        <td><strong><?= htmlspecialchars($row['unit_code']) ?></strong></td>
                        <td><?= htmlspecialchars($row['floor_number']) ?> منزل</td>
                        <td><?= $roomLabel ?></td>
                        <td><?= htmlspecialchars($row['unit_size']) ?> متر</td>
                        <td><?= $hasPrice ? htmlspecialchars($row['unit_price']) . ' دالر' : '-' ?></td>
                        <td><?= $hasPrice ? htmlspecialchars($row['gov_cost']) . ' دالر' : '-' ?></td>
                        <td><?= $hasPrice ? htmlspecialchars($row['infra_cost']) . ' دالر' : '-' ?></td>
                        <td>
                            <?php if ($hasPrice): ?>
                                <strong class="text-success"><?= htmlspecialchars($row['total_price']) ?> دالر</strong>
                            <?php else: ?>
                                -
                            <?php endif; ?>
                        </td>
                        <td><?= $statusBadge ?></td>
                        <td><?= $customerName ?></td>
                        <td>
                            <?php if ($row['status'] == 'available'): ?>
                                <a href="sell_block_unit.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-success">فروش</a>
                            <?php elseif ($row['status'] == 'reserved'): ?>
                                <a href="sell_block_unit.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-success" onclick="return confirm('این واحد رزرو شده است. آیا برای فروش مطمئن هستید؟');">فروش</a>
                            <?php else: ?>
                                <button class="btn btn-sm btn-secondary" disabled>فروش</button>
                            <?php endif; ?>
                            <a href="edit_block_unit.php?id=<?= $row['id'] ?>&block_id=<?= $filter_block ?>" class="btn btn-sm btn-warning">ویرایش</a>
                            <a href="delete_block_unit.php?id=<?= $row['id'] ?>&block_id=<?= $filter_block ?>" class="btn btn-sm btn-danger" onclick="return confirm('آیا مطمئن هستید؟');">حذف</a>
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
        $('#unitsTable').DataTable({
            "pageLength": 10,
            "lengthMenu": [10, 20, 30, 50],
            "order": [[1, 'asc'], [3, 'asc']],
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
            }
        });
    });

    // ===== محاسبه زنده متراژ واحد بر اساس بلاک =====
    $('#block_id').on('change', function() {
        var sel = this.options[this.selectedIndex];
        var sz = sel ? sel.getAttribute('data-unit-size') : '';
        $('#unit_size_preview').text(sz ? sz + ' متر' : '-');
    });
    </script>

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