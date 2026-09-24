<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php include 'config/db.php'; ?>
<?php require_once 'includes/block_catalog.php';

$cat = trim($_GET['cat'] ?? ($UNIT_CATEGORIES[0] ?? 'standard'));
if (!isset($CATEGORY_INFO[$cat])) {
    $cat = $UNIT_CATEGORIES[0] ?? 'standard';
}

// ---------- POST handling (inline CRUD) ----------
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {
    $action = $_POST['action'] ?? '';
    $pcat   = isset($_POST['cat']) ? trim($_POST['cat']) : $cat;
    if (!isset($CATEGORY_INFO[$pcat])) $pcat = 'standard';

    if ($action == 'add') {
        $feature = trim($_POST['feature'] ?? '');
        if ($feature === '') {
            header("Location: category_features.php?cat=" . urlencode($pcat) . "&error=empty");
            exit;
        }
        $check = $conn->prepare("SELECT id FROM unit_category_features WHERE category = ? AND feature = ?");
        $check->bind_param("ss", $pcat, $feature);
        $check->execute();
        $exists = $check->get_result()->fetch_assoc();
        $check->close();
        if ($exists) {
            header("Location: category_features.php?cat=" . urlencode($pcat) . "&error=exists");
            exit;
        }
        $ordRes = $conn->query("SELECT COALESCE(MAX(sort_order), 0) + 1 AS n FROM unit_category_features WHERE category = '" . $conn->real_escape_string($pcat) . "'");
        $ord = intval($ordRes->fetch_assoc()['n']);
        $stmt = $conn->prepare("INSERT INTO unit_category_features (category, feature, sort_order) VALUES (?, ?, ?)");
        $stmt->bind_param("ssi", $pcat, $feature, $ord);
        $stmt->execute();
        $stmt->close();
        header("Location: category_features.php?cat=" . urlencode($pcat) . "&added=1");
        exit;
    }
    if ($action == 'delete') {
        $fid = intval($_POST['feature_id'] ?? 0);
        $del = $conn->prepare("DELETE FROM unit_category_features WHERE id = ? AND category = ?");
        $del->bind_param("is", $fid, $pcat);
        $del->execute();
        $del->close();
        header("Location: category_features.php?cat=" . urlencode($pcat) . "&deleted=1");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Category Features — Manage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <li class="breadcrumb-item"><a href="block_units.php">Apartments / Units</a></li>
            <li class="breadcrumb-item active">Category Features</li>
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group">
                    <a class="btn btn-secondary" href="block_units.php"><i class="icon-graph"></i> &nbsp;Units List</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php
            $countMap = [];
            $cRes = $conn->query("SELECT category, COUNT(*) AS c FROM unit_category_features GROUP BY category");
            while ($r = $cRes->fetch_assoc()) $countMap[$r['category']] = intval($r['c']);
            $featuresList = $conn->query("SELECT id, feature, sort_order FROM unit_category_features WHERE category = '" . $conn->real_escape_string($cat) . "' ORDER BY sort_order, id");
            ?>

            <?php if (isset($_GET['added'])): ?>
                <div class="alert alert-success">Feature added successfully.</div>
            <?php elseif (isset($_GET['deleted'])): ?>
                <div class="alert alert-success">Feature removed successfully.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'exists'): ?>
                <div class="alert alert-warning">This feature already exists for the selected category.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'empty'): ?>
                <div class="alert alert-warning">Feature text cannot be empty.</div>
            <?php endif; ?>
<div class="card mt-3">
                <div class="card-header">
                    <strong>Category Features</strong>
                    <span class="text-muted ms-2">These features appear automatically in the unit form when the matching category is selected.</span>
                </div>
                <div class="card-body">

                    <!-- Category selector -->
                    <form method="GET" class="row g-2 align-items-center">
                        <div class="col-auto"><label class="form-label">Category</label></div>
                        <div class="col-auto">
                            <select name="cat" class="form-select" onchange="this.form.submit()">
                                <?php foreach ($UNIT_CATEGORIES as $c): ?>
                                <option value="<?= $c ?>" <?= $cat == $c ? 'selected' : '' ?>>
                                    <?= htmlspecialchars(unit_category_label($c)) ?> (<?= intval($countMap[$c] ?? 0) ?>)
                                </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </form>

                    <div class="alert alert-light border mt-3 mb-0">
                        <strong><?= htmlspecialchars(unit_category_label($cat)) ?>:</strong>
                        <?= htmlspecialchars(unit_category_desc($cat)) ?>
                        <br><span class="text-muted">Finish:</span> <?= htmlspecialchars($CATEGORY_INFO[$cat]['finish']) ?>
                        &mdash; <span class="text-muted">Parking:</span> <?= htmlspecialchars($CATEGORY_INFO[$cat]['parking']) ?>
                    </div>

                    <hr>

                    <!-- Features list -->
                    <h5>Features currently defined <span class="badge bg-secondary"><?= intval($countMap[$cat] ?? 0) ?></span></h5>
                    <?php if (($countMap[$cat] ?? 0) > 0): ?>
                    <table class="table table-sm table-bordered">
                        <thead class="table-light">
                            <tr><th style="width:60px">#</th><th>Feature</th><th style="width:140px">Action</th></tr>
                        </thead>
                        <tbody>
                            <?php while ($f = $featuresList->fetch_assoc()): ?>
                            <tr>
                                <td><?= $f['sort_order'] ?></td>
                                <td><?= htmlspecialchars($f['feature']) ?></td>
                                <td>
                                    <form method="POST" class="d-inline" onsubmit="return confirm('Remove this feature from the category?');">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="cat" value="<?= $cat ?>">
                                        <input type="hidden" name="feature_id" value="<?= $f['id'] ?>">
                                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                    <?php else: ?>
                    <div class="alert alert-warning mb-2">No features defined for this category yet. Add the first one below.</div>
                    <?php endif; ?>

                    <hr>

                    <!-- Add one feature -->
                    <h5>Add a feature</h5>
                    <form method="POST" class="row g-2 align-items-center">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="cat" value="<?= $cat ?>">
                        <div class="col-9">
                            <input type="text" name="feature" class="form-control" placeholder="e.g. 1 master bedroom + 2-3 additional bedrooms" required>
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-success">Add Feature</button>
                        </div>
                        <div class="col-12 mt-1">
                            <small class="text-muted">Add one feature at a time — each becomes a checklist item in the unit form for this category.</small>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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