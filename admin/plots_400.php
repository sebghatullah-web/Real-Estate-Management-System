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
    <title>Manage Two Jiribs (200 sqm)</title>
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


            <!-- Add plot form -->
            <h3 class="mt-5">Add New Plot</h3>
            <form action="add_plot_400.php" method="POST" class="row g-3">
            <div class="col-md-3">
                <label class="form-label">Plot Code</label>
                <input type="text" name="plot_code" class="form-control" required>
            </div>
            <div class="col-md-3">
                <label class="form-label">Plot Type</label>
                <input type="text" name="type" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Plot Area</label>
                <input type="number" name="area" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Base Price</label>
                <input type="number" step="0.01" name="base_price" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Infrastructure Cost</label>
                <input type="number" step="0.01" name="infra_cost" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Government Services Cost</label>
                <input type="number" step="0.01" name="gov_cost" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Total Price</label>
                <input type="number" step="0.01" name="total_price" class="form-control">
            </div>
            <div class="col-md-3">
                <label class="form-label">Status</label>
                <select name="status" class="form-select">
                <option value="available">For Sale</option>
                <option value="reserved">Reserved</option>
                <option value="sold">Sold</option>
                </select>
            </div>
            <div class="col-md-6">
                <label class="form-label">Latitude</label>
                <input type="text" name="latitude" class="form-control">
            </div>
            <div class="col-md-6">
                <label class="form-label">Longitude</label>
                <input type="text" name="longitude" class="form-control">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-success">Save Plot</button>
            </div>
            </form>


            <h2 class="mb-4">List of Four Jiribs (400 sqm)</h2>



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
                <th>Status</th>
                <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $result = $conn->query("SELECT * FROM plots_400 ORDER BY id ASC");
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
                <td><?= htmlspecialchars($row['status']) ?></td>
                <td>
                    <a href="edit_plot_400.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                    <a href="delete_plot_400.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>

                    <?php if ($row['status'] == 'available'): ?>
                        <a href="sell_plot_400.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-success" target="_blank">Sell</a>
                    <?php else: ?>
                        <button class="btn btn-sm btn-secondary" disabled>Sale</button>
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
            }
        });
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
