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

    $floor        = intval($_POST['floor_number'] ?? 0);
    $unit_no      = trim($_POST['unit_number'] ?? '');
    $units_per_fl = intval($_POST['units_per_floor'] ?? 0);
    $category     = trim($_POST['category'] ?? '');
    $rooms        = in_array($_POST['rooms'] ?? '1', ['1', '2', '3']) ? intval($_POST['rooms']) : 1;
    $status       = in_array($_POST['status'] ?? '', ['available', 'reserved', 'sold']) ? $_POST['status'] : 'available';
    $customer     = !empty($_POST['customer_id']) ? intval($_POST['customer_id']) : NULL;

    if ($category === '') $category = 'standard';

    if ($floor <= 0 || $unit_no === '' || $units_per_fl < 1 || $units_per_fl > 4) {
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
        header("Location: block_units.php?block_id=" . $unit['block_id']);
        exit;
    }

    $unit_code = $unit['block_code'] . '-' . $floor . '-' . $unit_no;

    // Prevent duplicate unit code
    $check = $conn->prepare("SELECT id FROM block_units WHERE block_id = ? AND floor_number = ? AND unit_number = ? AND id != ?");
    $check->bind_param("iisi", $unit['block_id'], $floor, $unit_no, $id);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        $check->close();
        header("Location: edit_block_unit.php?id=$id&error=duplicate");
        exit;
    }
    $check->close();

    // Recalculate size when units per floor change
    $usable = intval($unit['size']) - intval($unit['staircase_size']);
    $unit_size = $usable > 0 ? round($usable / $units_per_fl, 2) : $unit['unit_size'];

    $stmt = $conn->prepare("UPDATE block_units SET floor_number=?, unit_number=?, unit_code=?, units_per_floor=?, category=?, rooms=?, unit_size=?, status=?, customer_id=? WHERE id=?");
    $stmt->bind_param("issiisidsi", $floor, $unit_no, $unit_code, $units_per_fl, $category, $rooms, $unit_size, $status, $customer, $id);
    $stmt->execute();
    $stmt->close();

    // Sync existing units on the same floor
    $sync = $conn->prepare("UPDATE block_units SET units_per_floor=?, category=? WHERE block_id=? AND floor_number=? AND status='available' AND id != ?");
    $sync->bind_param("isiii", $units_per_fl, $category, $unit['block_id'], $floor, $id);
    $sync->execute();
    $sync->close();

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
                            <label class="form-label">Floor <span class="text-danger">*</span></label>
                            <input type="number" name="floor_number" class="form-control" min="1" value="<?= htmlspecialchars($unit['floor_number']) ?>" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Unit Number <span class="text-danger">*</span></label>
                            <input type="text" id="unit_no" name="unit_number" class="form-control" value="<?= htmlspecialchars($unit['unit_number']) ?>" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Units Per Floor <span class="text-danger">*</span></label>
                            <select id="units_per_floor" name="units_per_floor" class="form-select" required <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                                <option value="1" <?= $unit['units_per_floor'] == '1' ? 'selected' : '' ?>>1 Unit</option>
                                <option value="2" <?= $unit['units_per_floor'] == '2' ? 'selected' : '' ?>>2 Units</option>
                                <option value="3" <?= $unit['units_per_floor'] == '3' ? 'selected' : '' ?>>3 Units</option>
                                <option value="4" <?= $unit['units_per_floor'] == '4' ? 'selected' : '' ?>>4 Units</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Category</label>
                            <input type="text" name="category" class="form-control" list="cat_options" value="<?= htmlspecialchars($unit['category']) ?>" <?= $unit['status'] == 'sold' ? 'disabled' : '' ?>>
                            <datalist id="cat_options">
                                <?php foreach ($UNIT_CATEGORIES as $cat): ?>
                                <option value="<?= $cat ?>"><?= htmlspecialchars(unit_category_label($cat)) ?></option>
                                <?php endforeach; ?>
                            </datalist>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Unit Area</label>
                            <div class="form-control bg-light fw-bold" id="unit_size_display"><?= htmlspecialchars($unit['unit_size']) ?> sqm</div>
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

    <script src="style/js/views/main.js"></script>

    <script>
    // ===== Update size when units per floor change =====
    var blockSize   = <?= json_encode((float)$unit['size']) ?>;
    var blockStairs = <?= json_encode((float)$unit['staircase_size']) ?>;

    $('#units_per_floor').on('change', function() {
        var units = parseInt(this.value) || 1;
        var usable = blockSize - blockStairs;
        var per = usable > 0 ? usable / units : 0;
        $('#unit_size_display').text(per > 0 ? per.toFixed(2) + ' sqm' : '-');
    });
    </script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>