<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
<?php require_once 'includes/block_catalog.php'; ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Sold Units List</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.dataTables.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="#">Sales Management</a></li>
            <li class="breadcrumb-item active">Sold Units List</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="#"><i class="icon-speech"></i></a>
                    <a class="btn btn-secondary" href="./"><i class="icon-graph"></i> &nbsp;Dashboard</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php
            // Block filter
            $filter_block = isset($_GET['block_id']) ? intval($_GET['block_id']) : 0;
            $blocksResult = $conn->query("SELECT id, block_code, size FROM blocks WHERE status='active' ORDER BY block_code ASC");
            ?>

            <h2 class="mb-4">Sold Apartments / Units List</h2>

            <div class="mb-3">
                <form method="GET" class="row g-2 align-items-center">
                    <div class="col-auto">
                        <select name="block_id" class="form-select" onchange="this.form.submit()">
                            <option value="">All Blocks</option>
                            <?php while ($b = $blocksResult->fetch_assoc()): ?>
                            <option value="<?= $b['id'] ?>" <?= $filter_block == $b['id'] ? 'selected' : '' ?>>
                                <?= htmlspecialchars($b['block_code']) ?> - <?= htmlspecialchars($b['size']) ?> sqm
                            </option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="col-auto">
                        <a href="list_sold_units.php" class="btn btn-secondary">All</a>
                    </div>
                </form>
            </div>
<table id="soldUnitsTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Block</th>
                        <th>Apartment / Unit</th>
                        <th>Category</th>
                        <th>Floor</th>
                        <th>Units/Floor</th>
                        <th>Area (sqm)</th>
                        <th>Total Price</th>
                        <th>Paid</th>
                        <th>Remaining</th>
                        <th>Customer</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $sql = "SELECT bu.*, b.block_code, b.block_name,
                            c.full_name, c.fathar_name, c.national_id,
                            IFNULL(SUM(pay.amount),0) AS paid_amount,
                            (bu.total_price - IFNULL(SUM(pay.amount),0)) AS remaining_amount
                        FROM block_units bu
                        LEFT JOIN blocks b ON bu.block_id = b.id
                        LEFT JOIN customers c ON bu.customer_id = c.id
                        LEFT JOIN pay_block_units pay ON bu.id = pay.unit_id
                        WHERE bu.status = 'sold'";
                    if ($filter_block > 0) {
                        $sql .= " AND bu.block_id = " . intval($filter_block);
                    }
                    $sql .= " GROUP BY bu.id, bu.block_id, bu.floor_number, bu.units_per_floor, bu.category, bu.unit_number, bu.unit_code, bu.rooms, bu.unit_size, bu.status, bu.customer_id, bu.unit_price_per_meter, bu.gov_cost_per_meter, bu.infra_cost_per_meter, bu.unit_price, bu.gov_cost, bu.infra_cost, bu.total_price, bu.sold_at, b.block_code, b.block_name, c.full_name, c.fathar_name, c.national_id
                        ORDER BY bu.id ASC";

                    $result = $conn->query($sql);

                    while($row = $result->fetch_assoc()):
                        $roomLabel = $row['rooms'] == 2 ? '2-Bedroom' : ($row['rooms'] == 3 ? '3-Bedroom' : '1-Bedroom');
                        $catLabel = unit_category_label($row['category']);
                        $catClass = unit_category_class($row['category']);
                        $remaining = (float)$row['remaining_amount'];
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td>
                            <strong><?= htmlspecialchars($row['block_code'] ?? '-') ?></strong>
                            <?php if (!empty($row['block_name'])): ?>
                                <br><small class="text-muted"><?= htmlspecialchars($row['block_name']) ?></small>
                            <?php endif; ?>
                        </td>
                        <td><strong><?= htmlspecialchars($row['unit_code']) ?></strong><br><small class="text-muted"><?= $roomLabel ?></small></td>
                        <td class="<?= $catClass ?>"><strong><?= $catLabel ?></strong></td>
                        <td><?= htmlspecialchars($row['floor_number']) ?> floor</td>
                        <td><?= htmlspecialchars($row['units_per_floor']) ?> unit(s)</td>
                        <td><?= htmlspecialchars($row['unit_size']) ?> sqm</td>
                        <td><strong><?= number_format((float)$row['total_price'], 2) ?></strong> USD</td>
                        <td class="text-success"><?= number_format((float)$row['paid_amount'], 2) ?> USD</td>
                        <td class="text-danger"><?= number_format($remaining, 2) ?> USD</td>
                        <td>
                            <?= htmlspecialchars($row['full_name'] ?? '-') ?><br>
                            <small class="text-muted"><?= htmlspecialchars($row['fathar_name'] ?? '') ?> - <?= htmlspecialchars($row['national_id'] ?? '') ?></small>
                        </td>
                        <td>
                            <?php if ($remaining > 0): ?>
                                <a href="pay_block_unit.php?unit_id=<?= $row['id'] ?>" class="btn btn-sm btn-warning" target="_blank">Payment</a>
                            <?php else: ?>
                                <button class="btn btn-sm btn-secondary" disabled>Completed</button>
                            <?php endif; ?>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
</div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <!-- DataTables Buttons -->
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.4.1/js/buttons.print.min.js"></script>
    <!-- Dependencies for Excel and PDF -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>

    <script>
        $(document).ready(function() {
            $('#soldUnitsTable').DataTable({
                "pageLength": 10,
                "lengthMenu": [10, 20, 30, 50],
                "language": {
                    "search": "Search:",
                    "lengthMenu": "Show _MENU_ entries per page",
                    "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                    "paginate": {
                        "first": "First",
                        "last": "Last",
                        "next": "Next",
                        "previous": "Previous"
                    }
                },
                dom: 'Bfrtip',
                buttons: [
                    { extend: 'excelHtml5', text: 'Export Excel' },
                    { extend: 'pdfHtml5', text: 'Export PDF' },
                    { extend: 'print', text: 'Print' }
                ]
            });
        });
    </script>

    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>
    <script src="style/js/libs/Chart.min.js"></script>
    <script src="style/js/app.js"></script>
    <script src="style/js/views/main.js"></script>
</body>

</html>