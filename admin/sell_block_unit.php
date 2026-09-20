<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';
require_once __DIR__ . '/includes/block_catalog.php';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if (!$id) {
    header("Location: block_units.php");
    exit;
}

$stmt = $conn->prepare("SELECT bu.*, b.block_code, b.block_name, b.size, b.floors_count
                        FROM block_units bu
                        JOIN blocks b ON bu.block_id = b.id
                        WHERE bu.id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$unit = $stmt->get_result()->fetch_assoc();

if (!$unit) {
    die("Apartment not found.");
}

if ($unit['status'] != 'available') {
    header("Location: block_units.php?block_id=" . $unit['block_id'] . "&info=not_sellable");
    exit;
}

$customers = $conn->query("SELECT id, full_name, fathar_name, national_id FROM customers ORDER BY full_name ASC")->fetch_all(MYSQLI_ASSOC);

$error = '';
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST' && isset($_POST['sell_unit'])) {

    $customer_id          = intval($_POST['customer_id'] ?? 0);
    $unit_price_per_meter = floatval($_POST['unit_price_per_meter'] ?? 0);
    $gov_cost_per_meter   = floatval($_POST['gov_cost_per_meter'] ?? 0);
    $infra_cost_per_meter = floatval($_POST['infra_cost_per_meter'] ?? 0);

    $check = $conn->prepare("SELECT id FROM customers WHERE id = ?");
    $check->bind_param("i", $customer_id);
    $check->execute();
    $exists = $check->get_result()->num_rows > 0;
    $check->close();

    if (!$exists) {
        $error = "Selected customer is not valid!";
    } elseif ($unit_price_per_meter <= 0 || $gov_cost_per_meter < 0 || $infra_cost_per_meter < 0) {
        $error = "Please enter a valid price per square meter (unit price must be greater than zero).";
    } else {
        $size = floatval($unit['unit_size']);

        $unit_price  = round($unit_price_per_meter * $size, 2); // total unit price
        $gov_cost    = round($gov_cost_per_meter   * $size, 2); // government service fee
        $infra_cost  = round($infra_cost_per_meter * $size, 2); // infrastructure service fee
        $total_price = round($unit_price + $gov_cost + $infra_cost, 2); // total price

        $update = $conn->prepare("UPDATE block_units SET
            status='sold',
            customer_id=?,
            unit_price_per_meter=?,
            gov_cost_per_meter=?,
            infra_cost_per_meter=?,
            unit_price=?,
            gov_cost=?,
            infra_cost=?,
            total_price=?,
            sold_at=NOW()
            WHERE id=?");
        $update->bind_param("idddddddi", $customer_id, $unit_price_per_meter, $gov_cost_per_meter, $infra_cost_per_meter, $unit_price, $gov_cost, $infra_cost, $total_price, $id);
        $update->execute();
        $update->close();

        header("Location: block_units.php?block_id=" . $unit['block_id'] . "&sold=1");
        exit;
    }
}

$roomLabel = $unit['rooms'] == 2 ? '2-Bedroom' : ($unit['rooms'] == 3 ? '3-Bedroom' : '1-Bedroom');
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
    <title>Sell Apartment / Unit</title>
    <!-- Select2 for customer search -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/css/select2.min.css" rel="stylesheet" />
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
            <li class="breadcrumb-item active">Sell Apartment</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="block_units.php?block_id=<?= $unit['block_id'] ?>"><i class="icon-graph"></i> &nbsp;Back to Units</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <h2 class="mb-4">Sell Apartment / Unit</h2>

            <!-- ========== Apartment information ========== -->
            <div class="card mb-4">
                <div class="card-header"><strong>Apartment Information</strong></div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3"><strong>Apartment Code:</strong> <?= htmlspecialchars($unit['unit_code']) ?></div>
                        <div class="col-md-3"><strong>Block:</strong> <?= htmlspecialchars($unit['block_code']) ?> (<?= htmlspecialchars($unit['block_name'] ?? '') ?>)</div>
                        <div class="col-md-2"><strong>Floor:</strong> <?= htmlspecialchars($unit['floor_number']) ?></div>
                        <div class="col-md-2"><strong>Category:</strong> <?= htmlspecialchars(unit_category_label($unit['category'])) ?></div>
                        <div class="col-md-2"><strong>Rooms:</strong> <?= $roomLabel ?></div>
                        <div class="col-md-2"><strong>Area:</strong> <?= htmlspecialchars($unit['unit_size']) ?> sqm</div>
                        <div class="col-md-2"><strong>Units/Floor:</strong> <?= htmlspecialchars($unit['units_per_floor']) ?></div>
                    </div>
                </div>
            </div>

            <?php if (!empty($error)): ?>
                <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
            <?php endif; ?>

<!-- ========== Sale form ========== -->
            <div class="card">
                <div class="card-header"><strong>Register Sale &mdash; prices are calculated per square meter</strong></div>
                <div class="card-body">
                    <form method="POST" class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Select Customer <span class="text-danger">*</span></label>
                            <select name="customer_id" class="form-select select2" required>
                                <option value="">Search &amp; select customer...</option>
                                <?php foreach ($customers as $c): ?>
                                    <option value="<?= $c['id'] ?>">
                                        <?= htmlspecialchars($c['full_name']) ?> -
                                        <?= htmlspecialchars($c['fathar_name'] ?? '') ?> -
                                        <?= htmlspecialchars($c['national_id'] ?? '') ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Unit Area (sqm)</label>
                            <div class="form-control bg-light fw-bold" id="size_display"><?= htmlspecialchars($unit['unit_size']) ?></div>
                        </div>
<div class="col-md-4">
                            <label class="form-label">Unit Price (per sqm) <span class="text-danger">*</span></label>
                            <input type="number" step="0.01" min="0.01" id="unit_rate" name="unit_price_per_meter" class="form-control" required>
                            <small class="text-muted">e.g. 350 USD per square meter</small>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Government Services (per sqm)</label>
                            <input type="number" step="0.01" min="0" id="gov_rate" name="gov_cost_per_meter" class="form-control" value="0">
                            <small class="text-muted">e.g. 10 USD per square meter</small>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Infrastructure Services (per sqm)</label>
                            <input type="number" step="0.01" min="0" id="infra_rate" name="infra_cost_per_meter" class="form-control" value="0">
                            <small class="text-muted">e.g. 8 USD per square meter</small>
                        </div>

                        <!-- ========== Calculation preview ========== -->
                        <div class="col-12">
                            <div class="table-responsive">
                                <table class="table table-bordered mt-2 mb-0">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Description</th>
                                            <th>Rate / sqm</th>
                                            <th>Area (sqm)</th>
                                            <th>Amount (USD)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Unit Price</td>
                                            <td id="pv_unit_rate">-</td>
                                            <td id="pv_size"><?= htmlspecialchars($unit['unit_size']) ?></td>
                                            <td><strong id="pv_unit_price">-</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Government Fee</td>
                                            <td id="pv_gov_rate">-</td>
                                            <td id="pv_size_gov"><?= htmlspecialchars($unit['unit_size']) ?></td>
                                            <td id="pv_gov_cost">-</td>
                                        </tr>
                                        <tr>
                                            <td>Infrastructure Fee</td>
                                            <td id="pv_infra_rate">-</td>
                                            <td id="pv_size_infra"><?= htmlspecialchars($unit['unit_size']) ?></td>
                                            <td id="pv_infra_cost">-</td>
                                        </tr>
                                        <tr class="table-success">
                                            <td colspan="3" class="text-center fw-bold">Total Price</td>
                                            <td><strong id="pv_total">-</strong></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="col-12">
                            <p class="text-muted small mb-2">
                                <i class="icon-info"></i>
                                The unit price, government service fee and infrastructure service fee are all calculated per square meter and recorded at the time of sale, because they may differ for each customer.
                            </p>
                            <button type="submit" name="sell_unit" class="btn btn-success btn-lg">Confirm Sale</button>
                            <a href="block_units.php?block_id=<?= $unit['block_id'] ?>" class="btn btn-secondary btn-lg">Back</a>
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
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/js/select2.min.js"></script>

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
    $(document).ready(function() {
        // Customer search
        $('.select2').select2({
            placeholder: "Search customer...",
            allowClear: true
        });

        // ===== Live price calculation =====
        var unitSize = <?= json_encode((float)$unit['unit_size']) ?>;

        function fmt(n) {
            return parseFloat(n).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
        }

        function calc() {
            var ur = parseFloat($('#unit_rate').val()) || 0;
            var gr = parseFloat($('#gov_rate').val()) || 0;
            var ir = parseFloat($('#infra_rate').val()) || 0;

            var up = ur * unitSize;   // unit price
            var gc = gr * unitSize;   // government service fee
            var ic = ir * unitSize;   // infrastructure service fee
            var tp = up + gc + ic;    // total price

            $('#pv_unit_rate').text(ur > 0 ? ur : '-');
            $('#pv_gov_rate').text(gr > 0 ? gr : '-');
            $('#pv_infra_rate').text(ir > 0 ? ir : '-');

            $('#pv_unit_price').text(ur > 0 ? fmt(up) : '-');
            $('#pv_gov_cost').text(gr > 0 ? fmt(gc) : '-');
            $('#pv_infra_cost').text(ir > 0 ? fmt(ic) : '-');
            $('#pv_total').text((ur + gr + ir) > 0 ? fmt(tp) : '-');
        }

        $('#unit_rate, #gov_rate, #infra_rate').on('input change', calc);
    });
    </script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>