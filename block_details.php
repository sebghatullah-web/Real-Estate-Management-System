<?php
require 'config/db.php';

$block_code = $_GET['id'] ?? null;
$block = null;

if ($block_code) {
    $stmt = $pdo->prepare("SELECT * FROM blocks WHERE block_code = ?");
    $stmt->execute([$block_code]);
    $block = $stmt->fetch(PDO::FETCH_ASSOC);
}

// ----- جزئیات واحدها (برای مودال) -----
$unitFeatures = [];   // unit_id => [ [key,label], ... ]
$unitPayments = [];   // unit_id => مبلغ مجموعی پرداخت شده

if ($block) {
    // امکانات بلاک
    $amenities = [];
    $amStmt = $pdo->prepare("SELECT amenity_key, amenity_label FROM block_amenities WHERE block_id = ? ORDER BY id ASC");
    $amStmt->execute([$block['id']]);
    while ($a = $amStmt->fetch(PDO::FETCH_ASSOC)) {
        $amenities[] = $a;
    }
    $block['amenities'] = $amenities;

    // واحدها
    $units = [];
    $uStmt = $pdo->prepare("SELECT bu.*, c.full_name, c.fathar_name, c.phone
                            FROM block_units bu
                            LEFT JOIN customers c ON bu.customer_id = c.id
                            WHERE bu.block_id = ?
                            ORDER BY bu.floor_number ASC, bu.unit_number ASC");
    $uStmt->execute([$block['id']]);
    while ($u = $uStmt->fetch(PDO::FETCH_ASSOC)) {
        $units[] = $u;
    }
    $block['units'] = $units;

    // جزئیات هر واحد
    $fStmt = $pdo->prepare("SELECT unit_id, feature_key, feature_label FROM block_unit_features ORDER BY id ASC");
    $fStmt->execute();
    while ($f = $fStmt->fetch(PDO::FETCH_ASSOC)) {
        if (!isset($unitFeatures[$f['unit_id']])) {
            $unitFeatures[$f['unit_id']] = [];
        }
        $unitFeatures[$f['unit_id']][] = array($f['feature_key'], $f['feature_label']);
    }

    // پرداخت های هر واحد
    $pStmt = $pdo->prepare("SELECT unit_id, COALESCE(SUM(amount), 0) AS paid FROM pay_block_units GROUP BY unit_id");
    $pStmt->execute();
    while ($p = $pStmt->fetch(PDO::FETCH_ASSOC)) {
        $unitPayments[$p['unit_id']] = $p['paid'];
    }
}
?>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>جزئیات بلاک <?= htmlspecialchars($block_code) ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { direction: rtl; font-family: 'Vazirmatn', Tahoma, Arial, sans-serif; background: #f0f2f5; }
        .nav-bar { background: linear-gradient(135deg, #1a3a5c 0%, #2c5f7c 100%); padding: 15px 0; box-shadow: 0 2px 15px rgba(0,0,0,0.1); }
        .nav-bar a { color: #fff; text-decoration: none; }
        .nav-bar .brand { font-weight: bold; font-size: 1.3rem; }
        .nav-bar .btn-map-link { background: rgba(255,255,255,0.15); color: #fff; border-radius: 50px; padding: 8px 20px; transition: all 0.3s; }
        .nav-bar .btn-map-link:hover { background: rgba(255,255,255,0.25); color: #fff; }
        .detail-card { border: none; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        .detail-card .card-header { background: linear-gradient(135deg, #1a3a5c, #2c5f7c); color: #fff; padding: 20px 25px; border: none; }
        .detail-card .card-body { padding: 30px; }
        .detail-table th { background: #f8f9fa; width: 40%; font-weight: 600; color: #1a3a5c; }
        .detail-table td { font-weight: 500; }
        .status-badge { padding: 8px 20px; border-radius: 50px; font-size: 0.95rem; font-weight: 600; }
        .block-img { width: 100%; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 40px rgba(0,0,0,0.08); }
        .block-img img { width: 100%; height: 380px; object-fit: cover; display: block; }
        .block-img .placeholder { background: linear-gradient(135deg, #1a3a5c, #2c5f7c); color: #fff; height: 380px; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; }
        .block-img .placeholder i { font-size: 6rem; opacity: 0.5; }
        .block-img .placeholder span { font-size: 1.2rem; margin-top: 15px; }
        .amenity-badge { background: #e9f2fb; color: #1a3a5c; border: 1px solid #cddbf0; border-radius: 50px; padding: 7px 18px; font-size: 0.9rem; }
        .floor-title { background: #1a3a5c; color: #fff; padding: 10px 18px; border-radius: 12px; font-weight: bold; }
        .unit-cell { border: 2px solid #dee2e6; border-radius: 12px; padding: 10px; text-align: center; cursor: pointer; transition: all 0.2s; height: 100%; background: #fff; }
        .unit-cell:hover { border-color: #2c5f7c; box-shadow: 0 5px 15px rgba(44,95,124,0.2); transform: translateY(-2px); }
        .unit-cell .u-no { font-weight: bold; font-size: 1.05rem; color: #1a3a5c; }
        .unit-cell .u-status { font-size: 0.78rem; }
        .unit-cell .u-rooms { font-size: 0.78rem; color: #6c757d; }
        .unit-sold { border-color: #dc3545; background: #fdecee; }
        .unit-reserved { border-color: #ffc107; background: #fff8e1; }
        .unit-available { border-color: #28a745; background: #e9f7ef; }
        .whatsapp-float { position: fixed; bottom: 20px; left: 20px; z-index: 999; background: #25d366; color: #fff; width: 60px; height: 60px; border-radius: 50%; text-align: center; line-height: 60px; font-size: 30px; box-shadow: 0 5px 20px rgba(37,211,102,0.3); }
        .whatsapp-float:hover { transform: scale(1.1); color: #fff; }
        .bg-soft { background: #eef4fa; }
    </style>
</head>
<body>

<!-- WhatsApp Float -->
<a href="https://wa.me/9379349150" target="_blank" class="whatsapp-float" title="ارتباط با ما در واتساپ">
    <i class="bi bi-whatsapp"></i>
</a>

<div class="nav-bar">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="index.php" class="brand"><i class="bi bi-building me-2"></i>KhawarDB</a>
        <div>
            <a href="new_map.php" class="btn-map-link me-2"><i class="bi bi-map me-1"></i>بازگشت به نقشه</a>
            <a href="index.php" class="btn-map-link"><i class="bi bi-house me-1"></i>خانه</a>
        </div>
    </div>
</div>

<div class="container py-4">
    <?php if ($block): ?>
<div class="text-center mb-4 pt-3">
            <h1 class="fw-bold" style="color: #1a3a5c;">
                <i class="bi bi-building me-2"></i>بلاک <?= htmlspecialchars($block['block_code']) ?>
            </h1>
            <p class="text-muted"><?= htmlspecialchars($block['block_name'] ?? '') ?> | سایز: <?= htmlspecialchars($block['size']) ?> متر مربع</p>
        </div>

        <div class="row g-4">
            <div class="col-lg-7">
                <div class="detail-card card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="bi bi-info-circle me-2"></i>جزئیات بلاک</h4>
                        <span class="status-badge badge <?= $block['status'] === 'active' ? 'bg-success' : 'bg-secondary' ?>">
                            <?= $block['status'] === 'active' ? 'فعال' : 'غیرفعال' ?>
                        </span>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered detail-table mb-0">
                            <tr>
                                <th><i class="bi bi-hash me-1"></i>کد بلاک</th>
                                <td><?= htmlspecialchars($block['block_code']) ?></td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-tag me-1"></i>نام بلاک</th>
                                <td><?= htmlspecialchars($block['block_name'] ?? '—') ?></td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-arrows-fullscreen me-1"></i>سایز بلاک (متر مربع)</th>
                                <td><?= htmlspecialchars($block['size']) ?> متر مربع</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-stairs me-1"></i>راه‌پله (متر مربع)</th>
                                <td><?= htmlspecialchars($block['staircase_size']) ?> متر مربع</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-layers me-1"></i>تعداد منزل / طبقه</th>
                                <td><?= htmlspecialchars($block['floors_count']) ?> منزل</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-building me-1"></i>تعداد واحد</th>
                                <td><?php $tc = 0; foreach ($block['units'] as $uu) { $tc++; } echo $tc . ' واحد'; ?></td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-calendar3 me-1"></i>تاریخ ثبت</th>
                                <td><?= date('Y-m-d', strtotime($block['created_at'])) ?></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="detail-card card mt-3">
                    <div class="card-header">
                        <h4 class="mb-0"><i class="bi bi-stars me-2"></i>امکانات بلاک</h4>
                    </div>
                    <div class="card-body">
                        <?php if (count($block['amenities']) > 0): ?>
                            <div class="d-flex flex-wrap gap-2">
                                <?php foreach ($block['amenities'] as $am): ?>
                                    <span class="amenity-badge">
                                        <i class="bi bi-check-circle-fill me-1"></i><?= htmlspecialchars($am['amenity_label']) ?>
                                    </span>
                                <?php endforeach; ?>
                            </div>
                        <?php else: ?>
                            <p class="text-muted text-center py-3">امکاناتی برای این بلاک ثبت نشده است</p>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
<div class="col-lg-5">
                <div class="block-img">
                    <?php
                    $imgFound = null;
                    foreach (array('jpg', 'jpeg', 'png', 'webp') as $ext) {
                        $candidate = __DIR__ . '/img/blocks/' . $block['block_code'] . '.' . $ext;
                        if (file_exists($candidate)) {
                            $imgFound = 'img/blocks/' . $block['block_code'] . '.' . $ext;
                            break;
                        }
                    }
                    ?>
                    <?php if ($imgFound): ?>
                        <img src="<?= htmlspecialchars($imgFound) ?>" alt="عکس بلاک <?= htmlspecialchars($block['block_code']) ?>">
                    <?php else: ?>
                        <div class="placeholder">
                            <i class="bi bi-building"></i>
                            <span>عکس بلاک <?= htmlspecialchars($block['block_code']) ?></span>
                            <small style="opacity:0.7">تصویر در img/blocks/ ثبت نشده است</small>
                        </div>
                    <?php endif; ?>
                </div>

                <div class="detail-card card mt-3">
                    <div class="card-header">
                        <h4 class="mb-0"><i class="bi bi-graph-up me-2"></i>آمار واحدها</h4>
                    </div>
                    <div class="card-body">
                        <?php
                        $cnt_available = 0; $cnt_reserved = 0; $cnt_sold = 0;
                        foreach ($block['units'] as $u) {
                            if ($u['status'] === 'sold') { $cnt_sold++; }
                            elseif ($u['status'] === 'reserved') { $cnt_reserved++; }
                            else { $cnt_available++; }
                        }
                        ?>
                        <div class="row text-center g-2">
                            <div class="col-4">
                                <div class="border rounded-3 p-3 bg-success-subtle">
                                    <h4 class="mb-0 text-success"><?php echo $cnt_available; ?></h4>
                                    <small class="text-muted">موجود</small>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="border rounded-3 p-3 bg-warning-subtle">
                                    <h4 class="mb-0 text-warning"><?php echo $cnt_reserved; ?></h4>
                                    <small class="text-muted">رزرو</small>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="border rounded-3 p-3 bg-danger-subtle">
                                    <h4 class="mb-0 text-danger"><?php echo $cnt_sold; ?></h4>
                                    <small class="text-muted">فروخته</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<div class="row mt-4">
            <div class="col-12">
                <div class="detail-card card">
                    <div class="card-header">
                        <h4 class="mb-0"><i class="bi bi-layers me-2"></i>منزل‌ها و واحدهای بلاک</h4>
                        <small class="ms-2 text-white-50">برای دیدن جزئیات هر واحد، روی آن کلیک کنید</small>
                    </div>
                    <div class="card-body">
                        <?php if (count($block['units']) > 0): ?>
                            <?php
                            $floors = [];
                            foreach ($block['units'] as $u) {
                                $fn = intval($u['floor_number']);
                                if (!isset($floors[$fn])) { $floors[$fn] = []; }
                                $floors[$fn][] = $u;
                            }
                            $maxUnitsPerFloor = 1;
                            foreach ($floors as $fn => $list) {
                                $n = count($list);
                                if ($n > $maxUnitsPerFloor) { $maxUnitsPerFloor = $n; }
                            }
                            ?>
                            <?php foreach ($floors as $fn => $unitList): ?>
                                <div class="floor-title mb-3">
                                    <i class="bi bi-layers me-1"></i>منزل / طبقه شماره <?= $fn ?>
                                    <span class="badge bg-light text-dark ms-2"><?= count($unitList) ?> واحد</span>
                                </div>
                                <div class="row g-3 mb-4">
                                    <?php foreach ($unitList as $u): ?>
                                        <div class="col-6 col-md-3" style="max-width: <?= $maxUnitsPerFloor > 1 ? round(100 / $maxUnitsPerFloor) : 25 ?>%;">
                                            <div class="unit-cell unit-<?= $u['status'] ?>" data-unit-id="<?= $u['id'] ?>" data-bs-toggle="modal" data-bs-target="#unitModal">
                                                <div class="u-no"><i class="bi bi-door-closed me-1"></i>واحد <?= htmlspecialchars($u['unit_number']) ?></div>
                                                <div class="u-rooms">
                                                    <?= $u['rooms'] == 2 ? '۲ اتاقه' : ($u['rooms'] == 3 ? '۳ اتاقه' : '۱ اتاقه') ?>
                                                    | <?= htmlspecialchars($u['unit_size']) ?> m²
                                                </div>
                                                <div class="u-status">
                                                    <?= $u['status'] === 'sold' ? '<span class="text-danger">فروخته شده</span>' : ($u['status'] === 'reserved' ? '<span class="text-warning">رزرو شده</span>' : '<span class="text-success">قابل فروش</span>') ?>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <div class="text-center py-5">
                                <i class="bi bi-door-closed text-muted" style="font-size: 3rem;"></i>
                                <h5 class="mt-3 text-muted">هنوز واحدی برای این بلاک ثبت نشده است</h5>
                                <p class="text-muted">به زودی واحدهای این بلاک اضافه خواهد شد</p>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
<?php else: ?>
        <div class="text-center py-5">
            <i class="bi bi-exclamation-triangle text-warning" style="font-size: 4rem;"></i>
            <h3 class="mt-3">بلاک مورد نظر یافت نشد</h3>
            <p class="text-muted">این بلاک در دیتابیس ثبت نشده است</p>
            <a href="new_map.php" class="btn btn-primary mt-3">
                <i class="bi bi-map me-2"></i>بازگشت به نقشه
            </a>
        </div>
    <?php endif; ?>
</div>

<!-- Modal جزئیات واحد -->
<div class="modal fade" id="unitModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content rounded-4">
            <div class="modal-header bg-soft">
                <h5 class="modal-title fw-bold" id="unitModalTitle" style="color:#1a3a5c;">
                    <i class="bi bi-door-closed me-2"></i>جزئیات واحد
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="بستن"></button>
            </div>
            <div class="modal-body">
                <div id="unitModalBody"><p class="text-muted text-center py-4">در حال بارگذاری...</p></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">بستن</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
var blockUnits = <?= json_encode($block['units'] ?? []) ?>;
var unitFeatures = <?= json_encode($unitFeatures) ?>;
var unitPayments = <?= json_encode($unitPayments) ?>;

function faRooms(n) {
    if (n == 2) return '۲ اتاقه';
    if (n == 3) return '۳ اتاقه';
    return '۱ اتاقه';
}
function faStatus(s) {
    if (s === 'sold') return '<span class="badge bg-danger">فروخته شده</span>';
    if (s === 'reserved') return '<span class="badge bg-warning text-dark">رزرو شده</span>';
    return '<span class="badge bg-success">قابل فروش</span>';
}
function money(n) {
    var v = parseFloat(n || 0);
    return v.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll(".unit-cell").forEach(el => {
        el.addEventListener("click", function() {
            var id = this.getAttribute("data-unit-id");
            var u = null;
            for (var i = 0; i < blockUnits.length; i++) {
                if (String(blockUnits[i].id) === String(id)) { u = blockUnits[i]; break; }
            }
            if (!u) return;

            document.getElementById("unitModalTitle").innerHTML =
                '<i class="bi bi-door-closed me-2"></i>جزئیات واحد ' + String(u.unit_number) +
                ' — منزل ' + String(u.floor_number);

            var feats = unitFeatures[id] || [];
            var featsHtml = '';
            if (feats.length > 0) {
                featsHtml = '<div class="mt-3"><div class="fw-bold mb-2"><i class="bi bi-stars me-1"></i>جزئیات واحد:</div><div class="d-flex flex-wrap gap-2">';
                for (var k = 0; k < feats.length; k++) {
                    featsHtml += '<span class="badge rounded-pill bg-info-subtle text-info-emphasis p-2"><i class="bi bi-check2-square me-1"></i>' + feats[k][1] + '</span>';
                }
                featsHtml += '</div></div>';
            } else {
                featsHtml = '<div class="mt-3"><div class="fw-bold mb-2"><i class="bi bi-stars me-1"></i>جزئیات واحد:</div><p class="text-muted">جزئیاتی ثبت نشده است</p></div>';
            }

            var paid = unitPayments[id] || 0;
            var remaining = (parseFloat(u.total_price) || 0) - parseFloat(paid);

            var html = '' +
            '<table class="table table-bordered detail-table mb-2">' +
                '<tr><th><i class="bi bi-hash me-1"></i>کد واحد</th><td>' + String(u.unit_code) + '</td></tr>' +
                '<tr><th><i class="bi bi-layers me-1"></i>منزل / طبقه</th><td>' + String(u.floor_number) + '</td></tr>' +
                '<tr><th><i class="bi bi-door-closed me-1"></i>شماره واحد</th><td>' + String(u.unit_number) + '</td></tr>' +
                '<tr><th><i class="bi bi-grid me-1"></i>تعداد واحد در منزل</th><td>' + String(u.units_per_floor) + '</td></tr>' +
                '<tr><th><i class="bi bi-tags me-1"></i>کتگوری</th><td>' + String(u.category || 'standard') + '</td></tr>' +
                '<tr><th><i class="bi bi-door-open me-1"></i>تعداد اتاق</th><td>' + faRooms(u.rooms) + '</td></tr>' +
                '<tr><th><i class="bi bi-rulers me-1"></i>متراژ</th><td>' + money(u.unit_size) + ' متر مربع</td></tr>' +
                '<tr><th><i class="bi bi-flag me-1"></i>وضعیت</th><td>' + faStatus(u.status) + '</td></tr>';
            if (u.customer_id) {
                html += '<tr><th><i class="bi bi-person me-1"></i>مشتری</th><td>' + String(u.full_name || '') + (u.fathar_name ? ' (ولد: ' + String(u.fathar_name) + ')' : '') + '</td></tr>';
            }
            if (u.total_price) {
                html += '<tr><th><i class="bi bi-currency-dollar me-1"></i>قیمت مجموعی</th><td>' + money(u.total_price) + ' دالر</td></tr>';
                html += '<tr><th><i class="bi bi-cash-coin me-1"></i>پرداخت‌شده</th><td>' + money(paid) + ' افغانی</td></tr>';
                html += '<tr><th><i class="bi bi-hourglass-split me-1"></i>باقی‌مانده</th><td class="text-danger">' + money(remaining) + ' دالر</td></tr>';
            }
            html += '</table>' + featsHtml;

            document.getElementById("unitModalBody").innerHTML = html;
        });
    });
});
</script>

</body>
</html>