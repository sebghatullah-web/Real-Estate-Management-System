<?php
require 'config/db.php';

$plot_code = $_GET['id'] ?? null;
$plot = null;
$table = null;

if ($plot_code) {
    if (strpos($plot_code, "p_2_") === 0) {
        $table = "plots_200";
    } elseif (strpos($plot_code, "p_2.6_") === 0) {
        $table = "plots_260";
    } elseif (strpos($plot_code, "p_3_") === 0) {
        $table = "plots_300";
    } elseif (strpos($plot_code, "p_4_") === 0) {
        $table = "plots_400";
    } elseif (strpos($plot_code, "p_5_") === 0) {
        $table = "plots_510";
    } elseif (strpos($plot_code, "p_6_") === 0) {
        $table = "plots_600";
    } elseif (strpos($plot_code, "p_10_") === 0) {
        $table = "plots_1000";
    } elseif (strpos($plot_code, "p_vip_") === 0) {
        $table = "plots_vip";
    }

    if ($table) {
        $stmt = $pdo->prepare("SELECT * FROM $table WHERE plot_code = ?");
        $stmt->execute([$plot_code]);
        $plot = $stmt->fetch(PDO::FETCH_ASSOC);
    }
}
?>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>جزئیات نمره <?= htmlspecialchars($plot_code) ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            direction: rtl;
            font-family: 'Vazirmatn', Tahoma, Arial, sans-serif;
            background: #f0f2f5;
        }
        .nav-bar {
            background: linear-gradient(135deg, #1a3a5c 0%, #2c5f7c 100%);
            padding: 15px 0;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        .nav-bar a {
            color: #fff;
            text-decoration: none;
        }
        .nav-bar .brand {
            font-weight: bold;
            font-size: 1.3rem;
        }
        .detail-card {
            border: none;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            margin-top: -30px;
        }
        .detail-card .card-header {
            background: linear-gradient(135deg, #1a3a5c, #2c5f7c);
            color: #fff;
            padding: 20px 25px;
            border: none;
        }
        .detail-card .card-body {
            padding: 30px;
        }
        .detail-table th {
            background: #f8f9fa;
            width: 40%;
            font-weight: 600;
            color: #1a3a5c;
        }
        .detail-table td {
            font-weight: 500;
        }
        .btn-buy {
            background: linear-gradient(135deg, #28a745, #20c997);
            color: #fff;
            border: none;
            padding: 14px 40px;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.1rem;
            transition: all 0.3s;
            box-shadow: 0 5px 20px rgba(40,167,69,0.2);
        }
        .btn-buy:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(40,167,69,0.3);
            color: #fff;
        }
        .btn-map-link {
            background: rgba(255,255,255,0.15);
            color: #fff;
            border-radius: 50px;
            padding: 8px 20px;
            transition: all 0.3s;
        }
        .btn-map-link:hover {
            background: rgba(255,255,255,0.25);
            color: #fff;
        }
        .status-badge {
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 0.95rem;
            font-weight: 600;
        }
        .map-wrapper {
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
        }
        .whatsapp-float {
            position: fixed;
            bottom: 20px;
            left: 20px;
            z-index: 999;
            background: #25d366;
            color: #fff;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            text-align: center;
            line-height: 60px;
            font-size: 30px;
            box-shadow: 0 5px 20px rgba(37,211,102,0.3);
            transition: all 0.3s;
        }
        .whatsapp-float:hover { transform: scale(1.1); color: #fff; }
    </style>
</head>
<body>

<!-- WhatsApp Float -->
<a href="https://wa.me/9379349150" target="_blank" class="whatsapp-float" title="ارتباط با ما در واتساپ">
    <i class="bi bi-whatsapp"></i>
</a>

<!-- Top Navigation Bar -->
<div class="nav-bar">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="index.php" class="brand">
            <i class="bi bi-building me-2"></i>KhawarDB
        </a>
        <div>
            <a href="map.php" class="btn-map-link me-2">
                <i class="bi bi-map me-1"></i>بازگشت به نقشه
            </a>
            <a href="index.php" class="btn-map-link">
                <i class="bi bi-house me-1"></i>خانه
            </a>
        </div>
    </div>
</div>

<div class="container py-4">
    <?php if ($plot): ?>
        <!-- Header -->
        <div class="text-center mb-4 pt-3">
            <h1 class="fw-bold" style="color: #1a3a5c;">
                <i class="bi bi-pin-map me-2"></i>نمره <?= htmlspecialchars($plot['plot_code']) ?>
            </h1>
            <p class="text-muted"><?= htmlspecialchars($plot['type']) ?> | <?= htmlspecialchars($plot['area']) ?> متر مربع</p>
        </div>

        <div class="row g-4">
            <!-- Details Card -->
            <div class="col-lg-7">
                <div class="detail-card card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h4 class="mb-0"><i class="bi bi-info-circle me-2"></i>جزئیات نمره</h4>
                        <span class="status-badge badge 
                            <?= $plot['status'] === 'available' ? 'bg-success' : ($plot['status'] === 'reserved' ? 'bg-warning text-dark' : 'bg-danger') ?>">
                            <?= $plot['status'] === 'available' ? 'قابل فروش' : ($plot['status'] === 'reserved' ? 'رزرو شده' : 'فروخته شده') ?>
                        </span>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered detail-table mb-0">
                            <tr>
                                <th><i class="bi bi-hash me-1"></i>کد نمره</th>
                                <td><?= htmlspecialchars($plot['plot_code']) ?></td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-house me-1"></i>نوع</th>
                                <td><?= htmlspecialchars($plot['type']) ?></td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-rulers me-1"></i>مساحت</th>
                                <td><?= htmlspecialchars($plot['area']) ?> متر مربع</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-cash me-1"></i>قیمت نمره</th>
                                <td><?= htmlspecialchars($plot['base_price']) ?> دالر</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-tools me-1"></i>هزینه خدمات زیربنایی</th>
                                <td><?= htmlspecialchars($plot['infra_cost']) ?> دالر</td>
                            </tr>
                            <tr>
                                <th><i class="bi bi-building me-1"></i>هزینه خدمات دولت</th>
                                <td><?= htmlspecialchars($plot['gov_cost']) ?> دالر</td>
                            </tr>
                            <tr class="table-success">
                                <th class="fw-bold"><i class="bi bi-currency-dollar me-1"></i>قیمت مجموعی</th>
                                <td class="fw-bold fs-5"><?= htmlspecialchars($plot['total_price']) ?> دالر</td>
                            </tr>
                        </table>

                        <!-- Buy Section -->
                        <div class="mt-4 p-4 rounded-4" style="background: #f8f9fa;">
                            <?php if ($plot['status'] === 'available'): ?>
                                <div class="text-center">
                                    <p class="mb-3"><i class="bi bi-check-circle-fill text-success me-2"></i>این نمره برای خرید آماده است</p>
                                    <a href="buy_plot.php?id=<?= urlencode($plot['plot_code']) ?>" class="btn btn-buy">
                                        <i class="bi bi-cart-check me-2"></i>خرید این نمره
                                    </a>
                                    <p class="text-muted small mt-3">
                                        <i class="bi bi-info-circle me-1"></i>
                                        با خرید این نمره، اطلاعات شما ثبت شده و نمره به نام شما می‌شود
                                    </p>
                                </div>
                            <?php elseif ($plot['status'] === 'sold'): ?>
                                <div class="text-center">
                                    <i class="bi bi-x-circle-fill text-danger" style="font-size: 3rem;"></i>
                                    <h5 class="text-danger mt-2">این نمره قبلاً فروخته شده است</h5>
                                    <p class="text-muted">لطفاً نمره دیگری را از نقشه انتخاب کنید</p>
                                    <a href="map.php" class="btn btn-outline-primary">
                                        <i class="bi bi-map me-1"></i>مشاهده نقشه
                                    </a>
                                </div>
                            <?php else: ?>
                                <div class="text-center">
                                    <i class="bi bi-clock-fill text-warning" style="font-size: 3rem;"></i>
                                    <h5 class="text-warning mt-2">این نمره رزرو شده است</h5>
                                    <p class="text-muted">لطفاً نمره دیگری را از نقشه انتخاب کنید</p>
                                    <a href="map.php" class="btn btn-outline-primary">
                                        <i class="bi bi-map me-1"></i>مشاهده نقشه
                                    </a>
                                </div>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Map Section -->
            <div class="col-lg-5">
                <?php if ($plot['latitude'] && $plot['longitude']): ?>
                    <div class="map-wrapper">
                        <div id="map" style="width:100%; height:450px;"></div>
                    </div>
                    <div class="mt-3 text-center">
                        <small class="text-muted">
                            <i class="bi bi-geo-alt me-1"></i>
                            موقعیت نمره روی نقشه
                        </small>
                    </div>
                <?php else: ?>
                    <div class="card border-0 shadow-sm rounded-4 p-5 text-center">
                        <i class="bi bi-map text-muted" style="font-size: 4rem;"></i>
                        <p class="text-muted mt-3">موقعیت جغرافیایی برای این نمره ثبت نشده است</p>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    <?php else: ?>
        <div class="text-center py-5">
            <i class="bi bi-exclamation-triangle text-warning" style="font-size: 4rem;"></i>
            <h3 class="mt-3">نمره مورد نظر یافت نشد</h3>
            <p class="text-muted">این نمره در دیتابیس ثبت نشده است</p>
            <a href="map.php" class="btn btn-primary mt-3">
                <i class="bi bi-map me-2"></i>بازگشت به نقشه
            </a>
        </div>
    <?php endif; ?>
</div>

<!-- Leaflet -->
<link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<?php if ($plot && $plot['latitude'] && $plot['longitude']): ?>
<script>
    var map = L.map('map').setView([<?= $plot['latitude'] ?>, <?= $plot['longitude'] ?>], 17);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    var markerColor = "blue";
    var statusText = "قابل فروش";
    <?php if ($plot['status'] === 'reserved'): ?>
        markerColor = "orange";
        statusText = "رزرو شده";
    <?php elseif ($plot['status'] === 'sold'): ?>
        markerColor = "red";
        statusText = "فروخته شده";
    <?php endif; ?>

    L.circleMarker([<?= $plot['latitude'] ?>, <?= $plot['longitude'] ?>], {
        radius: 12,
        color: markerColor,
        fillColor: markerColor,
        fillOpacity: 0.8,
        weight: 3
    }).addTo(map).bindPopup(`
        <b><?= htmlspecialchars($plot['plot_code']) ?></b><br>
        <?= htmlspecialchars($plot['type']) ?><br>
        <span style="color:${markerColor}">${statusText}</span>
    `);
</script>
<?php endif; ?>

</body>
</html>