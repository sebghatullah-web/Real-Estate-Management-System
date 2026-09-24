<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT bu.*, b.block_code, b.block_name, b.size, b.staircase_size FROM block_units bu JOIN blocks b ON bu.block_id = b.id WHERE bu.id = $id");
$unit = $result->fetch_assoc();

if (!$unit) {
    header("Location: block_units.php");
    exit;
}

// Current unit details
$curFeatures = [];
$fRes = $conn->query("SELECT feature_key FROM block_unit_features WHERE unit_id = $id");
while ($f = $fRes->fetch_assoc()) {
    $curFeatures[$f['feature_key']] = true;
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $manzel_id = intval($_POST['manzel_id'] ?? 0);
    $floor     = intval($_POST['floor_number'] ?? 1);
    $unit_no   = trim($_POST['unit_number'] ?? '');
    $category  = trim($_POST['category'] ?? '');
    $unit_size = floatval($_POST['unit_size'] ?? 0);
    $rooms     = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status    = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';
    $customer  = !empty($_POST['customer_id']) ? intval($_POST['customer_id']) : NULL;

    if ($category === '' || !isset($CATEGORY_INFO[$category])) {
        $category = 'standard';
    }
    if ($floor < 1) $floor = 1;

    if ($manzel_id <= 0 || $unit_no === '' || $unit_size <= 0) {
        header("Location: edit_block_unit.php?id=$id&error=invalid");
        exit;
    }

    // Sold unit — only allow editing details (not sale information)
    if ($unit['status'] == 'sold') {
        $features = $_POST['features'] ?? [];
        if (!is_array($features) && $features !== '' && $features !== null) {
            $features = array($features);
        }
        $conn->query("DELETE FROM block_unit_features WHERE unit_id = $id");
        if (count($features) > 0) {
            $fStmt = $conn->prepare("INSERT INTO block_unit_features (unit_id, feature_key, feature_label) VALUES (?, ?, ?)");
            foreach ($features as $key) {
                $label = $UNIT_FEATURES[$key] ?? null;
                if ($label !== null) {
                    $fStmt->bind_param("iss", $id, $key, $label);
                    $fStmt->execute();
                }
            }
            $fStmt->close();
        }
        header("Location: block_units.php?block_id=" . $unit['block_id'] . "&manzel_id=" . $unit['manzel_id']);
        exit;
    }

    // Manzel must exist and belong to the same block
    $mRes = $conn->query("SELECT id, name, code FROM manazil WHERE id = $manzel_id AND block_id = " . intval($unit['block_id']));
    $manzel = $mRes->fetch_assoc();
    if (!$manzel) {
        header("Location: edit_block_unit.php?id=$id&error=invalid");
        exit;
    }

    $manzel_key = !empty($manzel['code']) ? $manzel['code'] : $manzel['name'];
    $unit_code = $unit['block_code'] . '-' . $manzel_key . '-' . $unit_no;

    // Prevent duplicate unit number in the same block/building
    $check = $conn->prepare("SELECT id FROM block_units
                             WHERE block_id = ? AND unit_number = ?
                               AND ( (manzel_id IS NULL AND floor_number = ?) OR manzel_id = ? )
                               AND id != ?");
    $check->bind_param("isiii", $unit['block_id'], $unit_no, $floor, $manzel_id, $id);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        header("Location: edit_block_unit.php?id=$id&error=duplicate");
        exit;
    }
    $check->close();

    $stmt = $conn->prepare("UPDATE block_units SET
            manzel_id=?, floor_number=?, unit_number=?, unit_code=?, units_per_floor=1,
            category=?, rooms=?, unit_size=?, status=?, customer_id=?
            WHERE id=?");
    $stmt->bind_param("iisssidsii", $manzel_id, $floor, $unit_no, $unit_code, $category, $rooms, $unit_size, $status, $customer, $id);
    $stmt->execute();
    $stmt->close();

    // Save unit details
    $features = $_POST['features'] ?? [];
    if (!is_array($features) && $features !== '' && $features !== null) {
        $features = array($features);
    }
    $conn->query("DELETE FROM block_unit_features WHERE unit_id = $id");
    if (count($features) > 0) {
        $fStmt = $conn->prepare("INSERT INTO block_unit_features (unit_id, feature_key, feature_label) VALUES (?, ?, ?)");
        foreach ($features as $key) {
            $label = $UNIT_FEATURES[$key] ?? null;
            if ($label !== null) {
                $fStmt->bind_param("iss", $id, $key, $label);
                $fStmt->execute();
            }
        }
        $fStmt->close();
    }

    header("Location: block_units.php?block_id=" . $unit['block_id']);
    exit;
}

$customersResult = $conn->query("SELECT id, full_name FROM customers ORDER BY full_name ASC");
$manazilResult = $conn->query("SELECT id, name, code FROM manazil WHERE block_id = " . intval($unit['block_id']) . " ORDER BY id");
?>
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
    <title>Edit Apartment / Unit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/css/style.css" rel="stylesheet">
    <link href="style/css/admin-modern.css" rel="stylesheet">
</head>


<body class="navbar-fixed sidebar-nav fixed-nav">
    <?php require_once 'includes/header.php'; ?>
    <?php require_once 'includes/sidebar.php'; ?>
    
    <!-- Main content -->
    <main class="main">

        <!-- Breadcrumb -->
        <ol class="breadcrumb">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="blocks.php">Blocks</a>
            </li>
            <li class="breadcrumb-item"><a href="block_units.php?block_id=<?= $unit['block_id'] ?>">Units</a>
            </li>
            <li class="breadcrumb-item active">Edit Apartment</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="block_units.php?block_id=<?= $unit['block_id'] ?>"><i class="icon-graph"></i> &nbsp;Back to Units</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php if (isset($_GET['error']) && $_GET['error'] == 'duplicate'): ?>
                <div class="alert alert-danger mt-3">This unit number already exists on this floor.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger mt-3">Invalid input.</div>
            <?php endif; ?>

            <h2 class="mb-4">Edit Apartment: <?= htmlspecialchars($unit['unit_code']) ?></h2>

            <?php if ($unit['status'] == 'sold' && $unit['total_price'] !== null): ?>
                <!-- ========== Sale information (visible after the sale) ========== -->
                <div class="alert alert-secondary mt-2">
                    This unit is sold &mdash; only &quot;Unit Details&quot; can be changed; floor/number/category cannot be modified.
                </div>
                <div class="card mb-4">
                    <div class="card-header bg-success text-white"><strong>Sale Information</strong></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4"><strong>Unit Price (per sqm):</strong> <?= htmlspecialchars($unit['unit_price_per_meter']) ?> USD</div>
                            <div class="col-md-4"><strong>Total Price:</strong> <?= htmlspecialchars($unit['total_price']) ?> USD</div>
                            <div class="col-md-4"><strong>Sale Date:</strong> <?= htmlspecialchars($unit['sold_at']) ?></div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
<div class="card">
                <div class="card-header"><strong>Block: <?= htmlspecialchars($unit['block_code']) ?> <?php if (!empty($unit['block_name'])): ?>(<?= htmlspecialchars($unit['block_name']) ?>)<?php endif; ?></strong></div>
                <div class="card-body">
                    <form method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Building / Manzel <span class="text-danger">*</span></label>
                            <select name="manzel_id" class="form-select" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <option value="">-- Select Building --</option>
                                <?php while ($mn = $manazilResult->fetch_assoc()): ?>
                                <option value="<?= $mn['id'] ?>" <?= $unit['manzel_id'] == $mn['id'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($mn['name']) ?><?php if (!empty($mn['code'])): ?> (<?= htmlspecialchars($mn['code']) ?>)<?php endif; ?>
                                </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Unit Number <span class="text-danger">*</span></label>
                            <input type="text" id="unit_no" name="unit_number" class="form-control" value="<?= htmlspecialchars($unit['unit_number']) ?>" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Category <span class="text-danger">*</span></label>
                            <select name="category" class="form-select" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <?php foreach ($UNIT_CATEGORIES as $cat): ?>
                                <option value="<?= $cat ?>" <?= $unit['category'] == $cat ? 'selected' : '' ?>><?= htmlspecialchars(unit_category_label($cat)) ?></option>
                                <?php endforeach; ?>
                            </select>
                            <small class="text-muted d-block" id="cat_hint"></small>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Unit Size (sqm) <span class="text-danger">*</span></label>
                            <input type="number" id="unit_size" name="unit_size" class="form-control" step="0.01" min="1" value="<?= htmlspecialchars($unit['unit_size']) ?>" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                            <small class="text-muted">Free entry — editable anytime</small>
                        </div>
                        <div class="col-md-1">
                            <label class="form-label">Floor</label>
                            <input type="number" name="floor_number" class="form-control" min="1" value="<?= htmlspecialchars($unit['floor_number']) ?>" <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                        </div>
<div class="col-md-3">
                            <label class="form-label">Rooms</label>
                            <select name="rooms" class="form-select" <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <option value="1" <?= $unit['rooms'] == '1' ? 'selected' : '' ?>>1 Room</option>
                                <option value="2" <?= $unit['rooms'] == '2' ? 'selected' : '' ?>>2 Rooms</option>
                                <option value="3" <?= $unit['rooms'] == '3' ? 'selected' : '' ?>>3 Rooms</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-select" <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <option value="available" <?= $unit['status'] == 'available' ? 'selected' : '' ?>>Available for Sale</option>
                                <option value="reserved" <?= $unit['status'] == 'reserved' ? 'selected' : '' ?>>Reserved</option>
                                <option value="sold" <?= $unit['status'] == 'sold' ? 'selected' : '' ?>>Sold</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Customer</label>
                            <select name="customer_id" class="form-select" <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <option value="">-- No Customer --</option>
                                <?php while ($c = $customersResult->fetch_assoc()): ?>
                                <option value="<?= $c['id'] ?>" <?= $unit['customer_id'] == $c['id'] ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($c['full_name']) ?>
                                </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
<div class="col-12 mt-2">
                            <label class="form-label fw-bold">Unit Details (rooms &amp; amenities - optional)</label>
                            <div class="row">
                                <?php foreach ($UNIT_FEATURES as $key => $label): ?>
                                <div class="col-md-2 form-check ms-1">
                                    <input class="form-check-input" type="checkbox" name="features[]" value="<?= $key ?>" id="feat_<?= $key ?>" <?= isset($curFeatures[$key]) ? 'checked' : '' ?>>
                                    <label class="form-check-label small" for="feat_<?= $key ?>"><?= htmlspecialchars($label) ?></label>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <a href="block_units.php?block_id=<?= $unit['block_id'] ?>" class="btn btn-secondary">Back</a>
                        </div>
                    </form>
                </div>
            </div>
</div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>

    <!-- Plugins and scripts required by all views -->
    <script src="style/js/libs/Chart.min.js"></script>

    <!-- CoreUI main scripts -->
    <script src="style/js/app.js"></script>
    <script src="style/js/admin-modern.js"></script>

    <script src="style/js/views/main.js"></script>

    <script>
    // ===== Hint about the selected category (finish + parking) =====
    var CAT_INFO = <?= json_encode($CATEGORY_INFO) ?>;
    function categoryHint() {
        var cat = $('#category').val();
        var info = CAT_INFO[cat];
        $('#cat_hint').text(info ? (info.finish + ' — ' + info.parking) : '');
    }
    $('#category').on('change', categoryHint);
    categoryHint();
    </script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>