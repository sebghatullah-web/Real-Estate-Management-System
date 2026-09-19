<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
<?php require_once 'includes/block_catalog.php'; ?>
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
    <title>Manage Blocks</title>
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
            <li class="breadcrumb-item active">Blocks</li>

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

            <?php if (isset($_GET['ok'])): ?>
                <div class="alert alert-success">Block saved/updated successfully. Now add the apartments from the &quot;Units&quot; section.</div>
            <?php endif; ?>

            <!-- ========== Add block form ========== -->
            <div class="card mt-3">
                <div class="card-header"><strong>Add New Block</strong></div>
                <div class="card-body">
                    <form action="add_block.php" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Block Code <span class="text-danger">*</span></label>
                            <input type="text" name="block_code" class="form-control" placeholder="e.g. B-412-A" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Block Name</label>
                            <input type="text" name="block_name" class="form-control" placeholder="e.g. Khwaja Block">
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Block Size (sqm) <span class="text-danger">*</span></label>
                            <input type="number" id="size" name="size" class="form-control" list="size_options" min="1" required>
                            <datalist id="size_options">
                                <option value="159">159 - 5 floors</option>
                                <option value="412">412 - 7 floors</option>
                                <option value="644">644 - 10 floors</option>
                                <option value="902">902 - 7 floors</option>
                            </datalist>
                            <small class="text-muted">The floor count is filled automatically when a size is selected</small>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Number of Floors <span class="text-danger">*</span></label>
                            <input type="number" id="floors_count" name="floors_count" class="form-control" min="1" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Staircase (sqm)</label>
                            <input type="number" id="staircase_size" name="staircase_size" class="form-control" min="0" value="45">
                            <small class="text-muted">It will be deducted from the area of each floor</small>
                        </div>
<div class="col-12 mt-2">
                            <label class="form-label fw-bold">Block Amenities (optional - select one or more)</label>
                            <div class="row">
                                <?php foreach ($BLOCK_AMENITIES as $key => $label): ?>
                                <div class="col-md-2 form-check ms-1">
                                    <input class="form-check-input" type="checkbox" name="amenities[]" value="<?= $key ?>" id="am_<?= $key ?>">
                                    <label class="form-check-label small" for="am_<?= $key ?>"><?= htmlspecialchars($label) ?></label>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-success">Save Block</button>
                            <small class="text-muted ms-2">Note: apartment units are not created automatically; add them later from the "Units" section after saving the block.</small>
                        </div>
                    </form>
                </div>
            </div>
<!-- ========== Blocks list ========== -->
            <h2 class="mb-4">Blocks List</h2>

            <table id="blocksTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Block Code</th>
                        <th>Block Name</th>
                        <th>Size (m)</th>
                        <th>Floors</th>
                        <th>Staircase</th>
                        <th>Units</th>
                        <th>Amenities</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT b.*,
                        (SELECT COUNT(*) FROM block_units bu WHERE bu.block_id = b.id) AS unit_count,
                        (SELECT COUNT(*) FROM block_amenities ba WHERE ba.block_id = b.id) AS amenity_count
                        FROM blocks b
                        ORDER BY b.id DESC";
                    $result = $conn->query($query);
                    while($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td><strong><?= htmlspecialchars($row['block_code']) ?></strong></td>
                        <td><?= htmlspecialchars($row['block_name'] ?? '') ?></td>
                        <td><?= htmlspecialchars($row['size']) ?> sqm</td>
                        <td><?= htmlspecialchars($row['floors_count']) ?> floors</td>
                        <td><?= htmlspecialchars($row['staircase_size']) ?> sqm</td>
                        <td>
                            <a href="block_units.php?block_id=<?= $row['id'] ?>" class="badge bg-primary text-decoration-none">
                                <?= htmlspecialchars($row['unit_count']) ?> unit(s)
                            </a>
                        </td>
                        <td>
                            <?php if ($row['amenity_count'] > 0): ?>
                                <span class="badge bg-success"><?= htmlspecialchars($row['amenity_count']) ?> item(s)</span>
                            <?php else: ?>
                                <span class="text-muted">-</span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if ($row['status'] == 'active'): ?>
                                <span class="badge bg-success">Active</span>
                            <?php else: ?>
                                <span class="badge bg-secondary">Inactive</span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <a href="block_units.php?block_id=<?= $row['id'] ?>" class="btn btn-sm btn-primary">Units</a>
                            <a href="edit_block.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                            <a href="delete_block.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure? All apartments of this block will also be deleted.');">Delete</a>
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
        $('#blocksTable').DataTable({
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

    // ===== Auto-fill floor count based on size =====
    var sizeFloors = { 114: 5, 412: 7, 644: 10, 902: 7 };
    $('#size').on('input change', function() {
        var s = parseInt(this.value);
        if (sizeFloors[s]) {
            $('#floors_count').val(sizeFloors[s]);
        }
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