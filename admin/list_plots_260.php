<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="CoreUI Bootstrap 4 Admin Template">
    <meta name="author" content="Lukasz Holeczek">
    <meta name="keyword" content="CoreUI Bootstrap 4 Admin Template">

    <!-- <link rel="shortcut icon" href="assets/ico/favicon.png"> -->
    <title>Manage Two and a Half Biswa (260 sqm)</title>

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
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="#">Management</a>
            </li>
            <li class="breadcrumb-item active">Dashboard</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="#"><i class="icon-speech"></i></a>
                    <a class="btn btn-secondary" href="./"><i class="icon-graph"></i> &nbsp;Dashboard</a>
                    <a class="btn btn-secondary" href="#"><i class="icon-settings"></i> &nbsp;Settings</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">


        <h2 class="mb-4">List of Sold Two and a Half Biswa (260 sqm) Plots</h2>

        <table id="plotsTable" class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Plot Code</th>
                    <th>Plot Type</th>
                    <th>Area</th>
                    <th>Plot Price</th>
                    <th>Gov. Services</th>
                    <th>Infrastructure</th>
                    <th>Total Price</th>
                    <th>Paid</th>
                    <th>Remaining</th>
                    <th>Customer</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // JOIN with the customers table
                        $sql = "SELECT p.*, 
                    c.full_name, c.fathar_name, c.national_id,
                    IFNULL(SUM(pay.amount),0) AS paid_amount,
                    (p.total_price - IFNULL(SUM(pay.amount),0)) AS remaining_amount
                FROM plots_260 p
                LEFT JOIN customers c ON p.customer_id = c.id
                LEFT JOIN pay_260 pay ON p.id = pay.plot_id
                WHERE p.status = 'sold'
                GROUP BY p.id, p.plot_code, p.type, p.area, p.base_price, p.gov_cost, p.infra_cost, p.total_price, p.status, c.full_name, c.fathar_name, c.national_id
                ORDER BY p.id ASC";

                $result = $conn->query($sql);

                while($row = $result->fetch_assoc()):
                ?>
                <tr>
                    <td><?= htmlspecialchars($row['id']) ?></td>
                    <td><?= htmlspecialchars($row['plot_code']) ?></td>
                    <td><?= htmlspecialchars($row['type']) ?></td>
                    <td><?= htmlspecialchars($row['area']) ?> sqm</td>
                    <td><?= htmlspecialchars($row['base_price']) ?> USD</td>
                    <td><?= htmlspecialchars($row['gov_cost']) ?> USD</td>
                    <td><?= htmlspecialchars($row['infra_cost']) ?> USD</td>
                    <td><?= htmlspecialchars($row['total_price']) ?> USD</td>
                    <td class="text-success"><?= htmlspecialchars($row['paid_amount']) ?> USD</td>
                    <td class="text-danger"><?= htmlspecialchars($row['remaining_amount']) ?> USD</td>
                    <td>
                        <?= htmlspecialchars($row['full_name']) ?> - 
                        <?= htmlspecialchars($row['fathar_name']) ?> - 
                        <?= htmlspecialchars($row['national_id']) ?>
                    </td>
                    <td>
                        <?php if ($row['remaining_amount'] > 0): ?>
                            <a href="pay_plots_260.php?plot_id=<?= $row['id'] ?>" class="btn btn-sm btn-warning" target="_blank">Payment</a>
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



    <!-- jQuery loaded once -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#plotsTable').DataTable({
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
                dom: 'Bfrtip', // enable buttons
                buttons: [
                    { extend: 'excelHtml5', text: 'Export Excel' },
                    { extend: 'pdfHtml5', text: 'Export PDF' },
                    { extend: 'print', text: 'Print' }
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
    <!-- Dependencies for Excel and PDF -->
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
