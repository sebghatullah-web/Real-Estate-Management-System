<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Buildings / Manazil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/css/style.css" rel="stylesheet">
    <link href="style/css/admin-modern.css" rel="stylesheet">
</head>


<body class="navbar-fixed sidebar-nav fixed-nav">
    <?php require_once 'includes/header.php'; ?>
    <?php require_once 'includes/sidebar.php'; ?>

    <main class="main">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="blocks.php">Blocks</a></li>
            <li class="breadcrumb-item active">Buildings / Manazil</li>

            <li class="breadcrumb-menu">
                <div class="btn-group" role="group">
                    <a class="btn btn-secondary" href="blocks.php"><i class="icon-graph"></i> &nbsp;Block List</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php
            $filter_block = isset($_GET['block_id']) ? intval($_GET['block_id']) : 0;
            $selectedBlock = null;
            if ($filter_block > 0) {
                $selectedBlock = $conn->query("SELECT * FROM blocks WHERE id = $filter_block")->fetch_assoc();
            }
            $blocksResult = $conn->query("SELECT id, block_code, size, floors_count FROM blocks ORDER BY block_code ASC");
            ?>

            <?php if (isset($_GET['added'])): ?>
                <div class="alert alert-success">Building saved successfully.</div>
            <?php elseif (isset($_GET['updated'])): ?>
                <div class="alert alert-success">Building updated successfully.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger">Invalid input. Building name is required.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'block'): ?>
                <div class="alert alert-danger">Selected block does not exist.</div>
            <?php endif; ?>

            <!-- ========== Add building form ========== -->
            <div class="card mt-3">
                <div class="card-header"><strong>Add New Building (منزل)</strong></div>
                <div class="card-body">
                    <form action="add_manzel.php" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Block <span class="text-danger">*</span></label>
                            <select name="block_id" class="form-select" required>
                                <option value="">-- Select Block --</option>
                                <?php while ($b = $blocksResult->fetch_assoc()): ?>
                                <option value="<?= $b['id'] ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>><?= htmlspecialchars($b['block_code']) ?> — <?= htmlspecialchars($b['size']) ?> sqm (<?= htmlspecialchars($b['floors_count']) ?> floors)</option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Building Name <span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" placeholder="e.g. منزل 1 / Building 1" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Short Code</label>
                            <input type="text" name="code" class="form-control" placeholder="e.g. MZ1">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Floors Count</label>
                            <input type="number" name="floors_count" class="form-control" min="1" value="1">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Notes</label>
                            <input type="text" name="notes" class="form-control" placeholder="optional">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-success">Save Building</button>
                            <small class="text-muted ms-2">Each block can contain several buildings. Apartments are then added inside a building from the &quot;Units&quot; section.</small>
                        </div>
                    </form>
                </div>
            </div>

            <!-- ========== Buildings list ========== -->
            <h2 class="mb-4">Buildings / Manazil List</h2>

            <div class="mb-3">
                <form method="GET" class="row g-2 align-items-center">
                    <div class="col-auto">
                        <select name="block_id" class="form-select" onchange="this.form.submit()">
                            <option value="">All Blocks</option>
                            <?php
                            $blocksResult->data_seek(0);
                            while ($b = $blocksResult->fetch_assoc()):
                            ?>
                            <option value="<?= $b['id'] ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>><?= htmlspecialchars($b['block_code']) ?> - <?= htmlspecialchars($b['size']) ?> sqm</option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="col-auto">
                        <a href="manazil.php" class="btn btn-secondary">All</a>
                    </div>
                </form>
            </div>

            <table id="manazilTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Block</th>
                        <th>Building / Manzel</th>
                        <th>Code</th>
                        <th>Floors</th>
                        <th>Notes</th>
                        <th>Units</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT m.*, b.block_code, b.size,
                        (SELECT COUNT(*) FROM block_units bu WHERE bu.manzel_id = m.id) AS unit_count,
                        (SELECT COUNT(*) FROM block_units bu WHERE bu.manzel_id = m.id AND bu.status = 'sold') AS sold_count
                        FROM manazil m
                        JOIN blocks b ON m.block_id = b.id";
                    if ($filter_block > 0) {
                        $query .= " WHERE m.block_id = $filter_block";
                    }
                    $query .= " ORDER BY m.block_id, m.id";
                    $result = $conn->query($query);
                    while ($row = $result->fetch_assoc()):
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td>
                            <strong><?= htmlspecialchars($row['block_code']) ?></strong>
                            <br><small class="text-muted"><?= htmlspecialchars($row['size']) ?> sqm</small>
                        </td>
                        <td><strong><?= htmlspecialchars($row['name']) ?></strong></td>
                        <td><?= htmlspecialchars($row['code'] ?? '') ?: '<span class="text-muted">-</span>' ?></td>
                        <td><?= htmlspecialchars($row['floors_count']) ?> floor(s)</td>
                        <td><?= htmlspecialchars($row['notes'] ?? '') ?: '<span class="text-muted">-</span>' ?></td>
                        <td>
                            <a href="block_units.php?block_id=<?= $row['block_id'] ?>&manzel_id=<?= $row['id'] ?>" class="badge bg-primary text-decoration-none"><?= htmlspecialchars($row['unit_count']) ?> unit(s)</a>
                            <?php if ($row['sold_count'] > 0): ?>
                                <span class="badge bg-danger"><?= htmlspecialchars($row['sold_count']) ?> sold</span>
                            <?php endif; ?>
                        </td>
                        <td>
                            <a href="edit_manzel.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                            <a href="delete_manzel.php?id=<?= $row['id'] ?>&block_id=<?= $filter_block ?>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this building? Its units will remain but will no longer be linked to a building.');">Delete</a>
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

    <script>
    $(document).ready(function() {
        $('#manazilTable').DataTable({
            "pageLength": 10,
            "lengthMenu": [10, 20, 30, 50],
            "language": {
                "search": "Search:",
                "lengthMenu": "Show _MENU_ entries per page",
                "info": "Showing _START_ to _END_ of _TOTAL_ entries",
                "paginate": { "first": "First", "last": "Last", "next": "Next", "previous": "Previous" }
            }
        });
    });
    </script>

    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>
    <script src="style/js/libs/Chart.min.js"></script>
    <script src="style/js/app.js"></script>
    <script src="style/js/admin-modern.js"></script>
    <script src="style/js/views/main.js"></script>
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>