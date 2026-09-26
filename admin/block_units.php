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
    <title>Manage Apartments / Units</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <!-- Icons -->
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <!-- Main styles for this application -->
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
            <li class="breadcrumb-item active">Apartments / Units</li>

            <!-- Breadcrumb Menu-->
            <li class="breadcrumb-menu">
                <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                    <a class="btn btn-secondary" href="blocks.php"><i class="icon-graph"></i> &nbsp;Block List</a>
                    <a class="btn btn-secondary" href="#"><i class="icon-settings"></i> &nbsp;Settings</a>
                </div>
            </li>
        </ol>

        <div class="container-fluid">

            <?php
            $filter_block  = isset($_GET['block_id']) ? intval($_GET['block_id']) : 0;
            $filter_manzel = isset($_GET['manzel_id']) ? intval($_GET['manzel_id']) : 0;
            $selectedBlock = null;
            $selectedManzel = null;
            if ($filter_block > 0) {
                $res = $conn->query("SELECT * FROM blocks WHERE id = $filter_block");
                $selectedBlock = $res->fetch_assoc();
            }
            if ($filter_manzel > 0 && $filter_block > 0) {
                $mres = $conn->query("SELECT id, name FROM manazil WHERE id = $filter_manzel AND block_id = $filter_block");
                $selectedManzel = $mres->fetch_assoc();
                if (!$selectedManzel) $filter_manzel = 0;
            }

            $blocksResult = $conn->query("SELECT id, block_code, size, staircase_size, floors_count FROM blocks ORDER BY id DESC");

            // Map of block id -> buildings (manazil) for the cascading dropdown
            $MANAZIL_MAP = [];
            $allManazil = $conn->query("SELECT id, block_id, name, code FROM manazil ORDER BY block_id, id");
            while ($m = $allManazil->fetch_assoc()) {
                if (!isset($MANAZIL_MAP[$m['block_id']])) {
                    $MANAZIL_MAP[$m['block_id']] = [];
                }
                $MANAZIL_MAP[$m['block_id']][] = ['id' => intval($m['id']), 'name' => $m['name'], 'code' => ($m['code'] ?? '')];
            }

            $customers = [];
            $custRes = $conn->query("SELECT id, full_name FROM customers ORDER BY full_name ASC");
            while ($c = $custRes->fetch_assoc()) {
                $customers[$c['id']] = $c['full_name'];
            }
            ?>

            <?php if (isset($_GET['added']) && intval($_GET['added']) > 0): ?>
                <div class="alert alert-success">
                    <?= intval($_GET['added']) ?> apartment(s) registered successfully.
                    <?php if (intval($_GET['skipped'] ?? 0) > 0): ?>
                        <span class="text-warning">(<?= intval($_GET['skipped']) ?> duplicate number(s) skipped.)</span>
                    <?php endif; ?>
                </div>
            <?php elseif (isset($_GET['skipped']) && intval($_GET['skipped']) > 0): ?>
                <div class="alert alert-warning"><?= intval($_GET['skipped']) ?> unit number(s) already existed and were skipped.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'duplicate'): ?>
                <div class="alert alert-danger">This unit number already exists in this building.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'sold'): ?>
                <div class="alert alert-danger">This unit is already sold and cannot be changed.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger">Invalid input - please re-check the required fields.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'size'): ?>
                <div class="alert alert-danger">Usable block size (size &minus; staircase) is zero or negative; reduce the staircase size.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'price'): ?>
                <div class="alert alert-danger">Please enter a valid unit price per square meter (greater than zero) &mdash; the price is set when the unit is registered so customers can see it on the public website.</div>
            <?php elseif (isset($_GET['error']) && $_GET['error'] == 'block'): ?>
                <div class="alert alert-danger">Selected block was not found.</div>
            <?php endif; ?>
<!-- ========== Add apartment/unit form ========== -->
            <div class="card mt-3">
                <div class="card-header">
                    <strong>Add New Apartment / Unit</strong>
                    <?php if ($selectedBlock): ?>
                        <span class="badge bg-primary ms-2">Block: <?= htmlspecialchars($selectedBlock['block_code']) ?> — size <?= htmlspecialchars($selectedBlock['size']) ?> sqm, staircase <?= htmlspecialchars($selectedBlock['staircase_size']) ?> sqm</span>
                    <?php endif; ?>
                </div>
                <div class="card-body">
                    <form action="add_block_unit.php" method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Block <span class="text-danger">*</span></label>
                            <select id="block_id" name="block_id" class="form-select" required>
                                <option value="">-- Select Block --</option>
                                <?php
                                $blocksResult->data_seek(0);
                                while ($b = $blocksResult->fetch_assoc()):
                                ?>
                                <option value="<?= $b['id'] ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($b['block_code']) ?> — <?= htmlspecialchars($b['size']) ?> sqm (<?= htmlspecialchars($b['floors_count']) ?> floors)
                                </option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Building / Manzel <span class="text-danger">*</span></label>
                            <select id="manzel_id" name="manzel_id" class="form-select" required>
                                <option value="">-- Select Block First --</option>
                            </select>
                            <small class="text-muted d-block" id="manzel_hint"></small>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Unit Number <span class="text-danger">*</span></label>
                            <input type="text" id="unit_number" name="unit_number" class="form-control" placeholder="e.g. 1" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Category <span class="text-danger">*</span></label>
                            <select id="category" name="category" class="form-select" required>
                                <?php foreach ($UNIT_CATEGORIES as $cat): ?>
                                <option value="<?= $cat ?>"><?= htmlspecialchars(unit_category_label($cat)) ?></option>
                                <?php endforeach; ?>
                            </select>
                            <small class="text-muted d-block" id="cat_hint"></small>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Unit Size (sqm) <span class="text-danger">*</span></label>
                            <input type="number" id="unit_size" name="unit_size" class="form-control" step="0.01" min="1" placeholder="e.g. 114.00" required>
                            <small class="text-muted">Free entry — editable anytime</small>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-select">
                                <option value="available">For Sale</option>
                                <option value="reserved">Reserved</option>
                                <option value="sold">Sold</option>
                            </select>
                        </div>
                        <div class="col-12 mt-2">
                            <div class="bg-light p-2 mb-1 rounded-3">
                                <strong class="text-secondary">Pricing (USD)</strong>
                                <small class="text-muted">&mdash; set at registration so customers can see the price of each unit on the public website</small>
                            </div>
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
                        <div class="col-12 mt-2">
                            <div class="table-responsive">
                                <table class="table table-bordered table-sm mb-0">
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
                                            <td id="pv_size">-</td>
                                            <td><strong id="pv_unit_price">-</strong></td>
                                        </tr>
                                        <tr>
                                            <td>Government Fee</td>
                                            <td id="pv_gov_rate">-</td>
                                            <td id="pv_size_gov">-</td>
                                            <td id="pv_gov_cost">-</td>
                                        </tr>
                                        <tr>
                                            <td>Infrastructure Fee</td>
                                            <td id="pv_infra_rate">-</td>
                                            <td id="pv_size_infra">-</td>
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
                        <div class="col-12 mt-2">
                            <div class="d-flex justify-content-between align-items-start mb-1">
                                <label class="form-label fw-bold mb-0">Unit Details &mdash; <span id="features_cat_label"><?= htmlspecialchars(unit_category_label($UNIT_CATEGORIES[0])) ?></span> features <span class="text-muted">(all selected by default &mdash; uncheck the ones that don't apply)</span></label>
                                <div class="text-nowrap ms-2">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" id="features_check_all">Select All</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary" id="features_check_none">Clear All</button>
                                </div>
                            </div>
                            <div id="features_box" class="row">
                                <?php foreach (category_features_map($conn, $UNIT_CATEGORIES[0]) as $fid => $ftext): ?>
                                <div class="col-md-4 form-check ms-1">
                                    <input class="form-check-input" type="checkbox" name="features[]" value="<?= $fid ?>" id="feat_<?= $fid ?>" checked>
                                    <label class="form-check-label small" for="feat_<?= $fid ?>"><?= htmlspecialchars($ftext) ?></label>
                                </div>
                                <?php endforeach; ?>
                            </div>
                            <small class="text-muted" id="features_hint"></small>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-success">Save Apartment</button>
                            <small class="text-muted ms-2">Unit size is entered manually and stays editable.</small>
                        </div>
                    </form>
                </div>
            </div>
<!-- ========== Apartments / Units list ========== -->
            <h2 class="mb-4">Apartments / Units List</h2>

            <div class="mb-3">
                <form method="GET" class="row g-2 align-items-center">
                    <div class="col-auto">
                        <select name="block_id" class="form-select" onchange="this.form.submit()">
                            <option value="">All Blocks</option>
                            <?php
                            $blocksResult->data_seek(0);
                            while ($b = $blocksResult->fetch_assoc()):
                            ?>
                            <option value="<?= $b['id'] ?>" <?= ($filter_block == $b['id']) ? 'selected' : '' ?>>
                                <?= htmlspecialchars($b['block_code']) ?> - <?= htmlspecialchars($b['size']) ?> sqm
                            </option>
                            <?php endwhile; ?>
                        </select>
                    </div>
                    <div class="col-auto">
                        <select name="manzel_id" class="form-select" onchange="this.form.submit()">
                            <option value="">All Buildings</option>
                            <?php
                            if ($filter_block > 0):
                                $fm = $conn->query("SELECT id, name FROM manazil WHERE block_id = $filter_block ORDER BY id");
                                while ($mn = $fm->fetch_assoc()):
                            ?>
                            <option value="<?= $mn['id'] ?>" <?= ($filter_manzel == $mn['id']) ? 'selected' : '' ?>><?= htmlspecialchars($mn['name']) ?></option>
                            <?php
                                endwhile;
                            endif;
                            ?>
                        </select>
                    </div>
                    <div class="col-auto">
                        <a href="block_units.php" class="btn btn-secondary">All Units</a>
                    </div>
                </form>
            </div>

            <table id="unitsTable" class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Block</th>
                        <th>Building / Manzel</th>
                        <th>Apartment / Unit</th>
                        <th>Category</th>
                        <th>Area (sqm)</th>
                        <th>Features</th>
                        <th>Unit Price</th>
                        <th>Gov. Services</th>
                        <th>Infrastructure</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Customer</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $query = "SELECT bu.*, b.block_code, b.block_name, b.size, m.name AS manzel_name,
                        (SELECT COUNT(*) FROM block_unit_features f WHERE f.unit_id = bu.id) AS feature_count,
                        (SELECT GROUP_CONCAT(f.feature_label) FROM block_unit_features f WHERE f.unit_id = bu.id) AS feature_labels
                        FROM block_units bu
                        JOIN blocks b ON bu.block_id = b.id
                        LEFT JOIN manazil m ON bu.manzel_id = m.id";
                    $qwhere = [];
                    if ($filter_block > 0) {
                        $qwhere[] = "bu.block_id = $filter_block";
                    }
                    if ($filter_manzel > 0) {
                        $qwhere[] = "bu.manzel_id = $filter_manzel";
                    }
                    if (count($qwhere) > 0) {
                        $query .= " WHERE " . implode(" AND ", $qwhere);
                    }
                    $query .= " ORDER BY b.block_code ASC, COALESCE(m.name, '') ASC, bu.unit_number ASC";
                    $result = $conn->query($query);
                    while($row = $result->fetch_assoc()):
                        $catLabel = unit_category_label($row['category']);
                        $catClass = unit_category_class($row['category']);
                        $statusBadge = '';
                        if ($row['status'] == 'available') {
                            $statusBadge = '<span class="badge bg-success">For Sale</span>';
                        } elseif ($row['status'] == 'reserved') {
                            $statusBadge = '<span class="badge bg-warning text-dark">Reserved</span>';
                        } else {
                            $statusBadge = '<span class="badge bg-danger">Sold</span>';
                        }
                        $customerName = isset($customers[$row['customer_id']]) ? htmlspecialchars($customers[$row['customer_id']]) : ($row['customer_id'] ? 'ID: ' . $row['customer_id'] : '');
                        $hasPrice = $row['total_price'] !== null;
                    ?>
                    <tr>
                        <td><?= htmlspecialchars($row['id']) ?></td>
                        <td>
                            <strong><?= htmlspecialchars($row['block_code']) ?></strong>
                            <?php if (!empty($row['block_name'])): ?>
                                <br><small class="text-muted"><?= htmlspecialchars($row['block_name']) ?></small>
                            <?php endif; ?>
                        </td>
                        <td>
                            <?php if (!empty($row['manzel_name'])): ?>
                                <strong><?= htmlspecialchars($row['manzel_name']) ?></strong>
                            <?php else: ?>
                                <span class="text-muted">-</span>
                            <?php endif; ?>
                        </td>
                        <td><strong><?= htmlspecialchars($row['unit_code']) ?></strong></td>
                        <td class="<?= $catClass ?>"><strong><?= $catLabel ?></strong></td>
                        <td><?= htmlspecialchars($row['unit_size']) ?> sqm</td>
                        <td>
                            <?php if ($row['feature_count'] > 0): ?>
                                <span class="badge bg-info text-dark" title="<?= htmlspecialchars($row['feature_labels']) ?>"><?= htmlspecialchars($row['feature_count']) ?> features</span>
                                <br><small class="text-muted"><?= htmlspecialchars($row['feature_labels']) ?></small>
                            <?php else: ?>
                                <span class="text-muted">-</span>
                            <?php endif; ?>
                        </td>
<td><?= $hasPrice ? htmlspecialchars($row['unit_price']) . ' USD' : '-' ?></td>
                        <td><?= $hasPrice ? htmlspecialchars($row['gov_cost']) . ' USD' : '-' ?></td>
                        <td><?= $hasPrice ? htmlspecialchars($row['infra_cost']) . ' USD' : '-' ?></td>
                        <td>
                            <?php if ($hasPrice): ?>
                                <strong class="text-success"><?= htmlspecialchars($row['total_price']) ?> USD</strong>
                            <?php else: ?>
                                -
                            <?php endif; ?>
                        </td>
                        <td><?= $statusBadge ?></td>
                        <td><?= $customerName ?></td>
                        <td>
                            <?php if ($row['status'] == 'available'): ?>
                                <a href="sell_block_unit.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-success">Sell</a>
                            <?php elseif ($row['status'] == 'reserved'): ?>
                                <a href="sell_block_unit.php?id=<?= $row['id'] ?>" class="btn btn-sm btn-success" onclick="return confirm('This unit is reserved. Are you sure you want to sell it?');">Sell</a>
                            <?php else: ?>
                                <button class="btn btn-sm btn-secondary" disabled>Sale</button>
                            <?php endif; ?>
                            <a href="edit_block_unit.php?id=<?= $row['id'] ?>&block_id=<?= $row['block_id'] ?>" class="btn btn-sm btn-warning">Edit</a>
                            <a href="delete_block_unit.php?id=<?= $row['id'] ?>&block_id=<?= $filter_block ?>&manzel_id=<?= $filter_manzel ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?');">Delete</a>
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
        $('#unitsTable').DataTable({
            "pageLength": 10,
            "lengthMenu": [10, 20, 30, 50],
            "order": [[1, 'asc'], [3, 'asc']],
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

    // ===== Live price calculation (add-unit form — set at registration) =====
    function fmtMoney(n) {
        return parseFloat(n).toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
    }
    function calcAddPrice() {
        var sz = parseFloat($('#unit_size').val()) || 0;
        var ur = parseFloat($('#unit_rate').val()) || 0;
        var gr = parseFloat($('#gov_rate').val()) || 0;
        var ir = parseFloat($('#infra_rate').val()) || 0;

        $('#pv_size').text(sz > 0 ? fmtMoney(sz) : '-');
        $('#pv_size_gov').text(sz > 0 ? fmtMoney(sz) : '-');
        $('#pv_size_infra').text(sz > 0 ? fmtMoney(sz) : '-');

        $('#pv_unit_rate').text(ur > 0 ? fmtMoney(ur) : '-');
        $('#pv_gov_rate').text(gr > 0 ? fmtMoney(gr) : '-');
        $('#pv_infra_rate').text(ir > 0 ? fmtMoney(ir) : '-');

        $('#pv_unit_price').text(ur > 0 ? fmtMoney(ur * sz) : '-');
        $('#pv_gov_cost').text(gr > 0 ? fmtMoney(gr * sz) : '-');
        $('#pv_infra_cost').text(ir > 0 ? fmtMoney(ir * sz) : '-');
        $('#pv_total').text((ur + gr + ir) > 0 ? fmtMoney((ur + gr + ir) * sz) : '-');
    }
    $('#unit_size, #unit_rate, #gov_rate, #infra_rate').on('input change', calcAddPrice);

    // ===== Cascading dropdown: Block -> Building (Manzel) =====
    var MANAZIL_MAP = <?= json_encode($MANAZIL_MAP) ?>;
    var CAT_INFO = <?= json_encode($CATEGORY_INFO) ?>;

    function reloadManazil() {
        var bid = $('#block_id').val();
        var $sel = $('#manzel_id');
        var hint = $('#manzel_hint');
        $sel.find('option').remove();
        if (!bid) {
            $sel.append($('<option>').val('').text('-- Select Block First --'));
            hint.text('');
            return;
        }
        var list = MANAZIL_MAP[bid] || [];
        if (list.length === 0) {
            $sel.append($('<option>').val('').text('-- No Buildings Yet --'));
            hint.html('<span class="text-warning">No buildings defined for this block. <a href="manazil.php?block_id=' + bid + '">Add buildings</a> first.</span>');
            return;
        }
        $sel.append($('<option>').val('').text('-- Select Building --'));
        for (var i = 0; i < list.length; i++) {
            var lbl = list[i].name;
            if (list[i].code) lbl += ' (' + list[i].code + ')';
            $sel.append($('<option>').val(list[i].id).text(lbl));
        }
        hint.html('<span class="text-muted">' + list.length + ' building(s)</span>');
    }
    $('#block_id').on('change', reloadManazil);
    reloadManazil();

    // ===== Category hint (finish level + parking) =====
    function categoryHint() {
        var cat = $('#category').val();
        var info = CAT_INFO[cat];
        $('#cat_hint').text(info ? (info.finish + ' — ' + info.parking) : '');
        $('#features_cat_label').text(info ? info.label : cat);
    }

    // ===== Dynamic per-category features (re-render on category change) =====
    var FEATURES_MAP = <?= json_encode(category_features_all($conn)) ?>;
    function renderFeatures(cat) {
        var $box = $('#features_box');
        var $hint = $('#features_hint');
        var list = FEATURES_MAP[cat] || [];
        $box.empty();
        $hint.text('');
        if (list.length === 0) {
            $hint.html('<span class="text-warning">No features defined for this category yet. ' +
                '<a href="category_features.php?cat=' + cat + '" target="_blank">Add features</a> first.</span>');
            return;
        }
        var keys = Object.keys(list);
        for (var i = 0; i < keys.length; i++) {
            var fid = keys[i];
            var html = '<div class="col-md-4 form-check ms-1">' +
                       '<input class="form-check-input" type="checkbox" name="features[]" value="' + fid + '" id="feat_' + fid + '" checked>' +
                       '<label class="form-check-label small" for="feat_' + fid + '">' + $('<span>').text(list[fid]).html() + '</label></div>';
            $box.append(html);
        }
    }
    // ===== Select All / Clear All for features =====
    $('#features_check_all').on('click', function () {
        $('#features_box input[type="checkbox"]').prop('checked', true);
    });
    $('#features_check_none').on('click', function () {
        $('#features_box input[type="checkbox"]').prop('checked', false);
    });
    $('#category').on('change', function () {
        categoryHint();
        renderFeatures($(this).val());
    });
    renderFeatures($('#category').val());
    categoryHint();
    </script>

    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>

    <!-- Plugins and scripts required by all views -->
    <script src="style/js/libs/Chart.min.js"></script>

    <!-- CoreUI main scripts -->

    <script src="style/js/app.js"></script>
    <script src="style/js/admin-modern.js"></script>

    <!-- Plugins and scripts required by this views -->
    <!-- Custom scripts required by this view -->
    <script src="style/js/views/main.js"></script>

    <!-- Grunt watch plugin -->
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>