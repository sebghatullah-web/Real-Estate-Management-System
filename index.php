<?php
require 'config/db.php';

// Get statistics
$tables = ["plots_200","plots_260","plots_300","plots_400","plots_510","plots_600","plots_1000","plots_vip"];
$total_plots = 0;
$sold_plots = 0;
$reserved_plots = 0;
$available_plots = 0;

foreach ($tables as $table) {
    $stmt = $pdo->query("SELECT COUNT(*) FROM $table");
    $total_plots += $stmt->fetchColumn();
    
    $stmt = $pdo->query("SELECT COUNT(*) FROM $table WHERE status='sold'");
    $sold_plots += $stmt->fetchColumn();
    
    $stmt = $pdo->query("SELECT COUNT(*) FROM $table WHERE status='reserved'");
    $reserved_plots += $stmt->fetchColumn();
    
    $stmt = $pdo->query("SELECT COUNT(*) FROM $table WHERE status='available'");
    $available_plots += $stmt->fetchColumn();
}

// Get total customers
$stmt = $pdo->query("SELECT COUNT(*) FROM customers");
$total_customers = $stmt->fetchColumn();

// Get latest sold plots with customer info
$recent_sales = [];
$sale_tables = [
    'plots_200' => 'pay_200',
    'plots_260' => 'pay_260',
    'plots_300' => 'pay_300',
    'plots_400' => 'pay_400',
    'plots_510' => 'pay_510',
    'plots_600' => 'pay_600',
    'plots_1000' => 'pay_1000',
    'plots_vip' => 'pay_vip'
];

// ========== Block / Apartment statistics ==========
$stmt = $pdo->query("SELECT COUNT(*) FROM blocks");
$total_blocks = (int)$stmt->fetchColumn();

$unitStats = $pdo->query("SELECT
    COUNT(*) AS total,
    COALESCE(SUM(status='sold'), 0) AS sold,
    COALESCE(SUM(status='reserved'), 0) AS reserved,
    COALESCE(SUM(status='available'), 0) AS available
FROM block_units")->fetch(PDO::FETCH_ASSOC);
$total_units      = (int)$unitStats['total'];
$sold_units       = (int)$unitStats['sold'];
$reserved_units   = (int)$unitStats['reserved'];
$available_units  = (int)$unitStats['available'];

// ========== Block types (grouped by size code e.g. b_114_97 -> 114) ==========
$block_types = [];
$btStmt = $pdo->query("SELECT block_code, size, floors_count FROM blocks ORDER BY block_code ASC");
while ($bt = $btStmt->fetch(PDO::FETCH_ASSOC)) {
    $parts = explode('_', $bt['block_code']); // e.g. ['b','114','97']
    $key = isset($parts[1]) ? $parts[1] : '';
    if ($key === '') { continue; }
    if (!isset($block_types[$key])) {
        $block_types[$key] = array(
            'key'     => $key,
            'count'   => 0,
            'size'    => (int)$bt['size'],
            'floors'  => (int)$bt['floors_count'],
            'units'   => 0,
            'sold'    => 0,
            'avail'   => 0,
            'reserved'=> 0
        );
    }
    $block_types[$key]['count']++;
}
if (count($block_types) > 0) {
    $btKeys = array_keys($block_types);
    $inList = "'" . implode("', '", $btKeys) . "'";
    $uRes = $pdo->query("SELECT
        SUBSTRING_INDEX(SUBSTRING_INDEX(unit_code, '_', 2), '_', -1) AS grp,
        COUNT(*) AS total,
        COALESCE(SUM(status='sold'), 0) AS sold,
        COALESCE(SUM(status='available'), 0) AS avail,
        COALESCE(SUM(status='reserved'), 0) AS reserved
        FROM block_units GROUP BY grp");
    while ($u = $uRes->fetch(PDO::FETCH_ASSOC)) {
        $gk = $u['grp'];
        if (isset($block_types[$gk])) {
            $block_types[$gk]['units']    = (int)$u['total'];
            $block_types[$gk]['sold']     = (int)$u['sold'];
            $block_types[$gk]['avail']    = (int)$u['avail'];
            $block_types[$gk]['reserved'] = (int)$u['reserved'];
        }
    }
}

include 'header.php';
?>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container position-relative" style="z-index: 1;">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <h1>Welcome to <span style="color: #ffc107;">Khawar Construction Company</span></h1>
                <p>Khawar Construction & Development Company - trusted source for buying and selling residential, commercial plots and apartments in New Kabul</p>
                <a href="map.php" class="btn btn-hero" target="_blank">
                    <i class="bi bi-map me-2"></i>View Plots Map
                </a>
                <a href="contact.php" class="btn btn-outline-light btn-lg ms-3 px-4" style="border-radius: 30px;">
                    <i class="bi bi-telephone me-2"></i>Contact Us
                </a>
            </div>
            <div class="col-lg-5 text-center mt-4 mt-lg-0">
                <img src="img/kkkk.png" alt="KhawarDB Logo" class="img-fluid" style="max-width: 80%;">
            </div>
        </div>
    </div>
</section>

<!-- Statistics Section -->
<section class="py-5">
    <div class="container">
        <div class="text-center mb-4 mt-5">
            <h4 class="fw-bold" style="color:#1a3a5c;">
                <i class="bi bi-buildings me-2"></i>Residential Plots Statistics
            </h4>
            <p class="text-muted">Status of residential plots</p>
        </div>
        <div class="row g-4">
            <div class="col-md-3 col-6">
                <div class="stats-box">
                    <h3><?= number_format($total_plots) ?></h3>
                    <p><i class="bi bi-grid-3x3-gap-fill me-1"></i>Total Plots</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #28a745, #20c997);">
                    <h3><?= number_format($available_plots) ?></h3>
                    <p><i class="bi bi-check-circle me-1"></i>Available Plots</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #dc3545, #e74c3c);">
                    <h3><?= number_format($sold_plots) ?></h3>
                    <p><i class="bi bi-cart-check me-1"></i>Sold Plots</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #6f42c1, #8e44ad);">
                    <h3><?= number_format($total_customers) ?></h3>
                    <p><i class="bi bi-people me-1"></i>Customers</p>
                </div>
            </div>
        </div>

        <!-- Block & Apartment Stats -->
        <div class="text-center mb-4 mt-5">
            <h4 class="fw-bold" style="color:#1a3a5c;">
                <i class="bi bi-buildings me-2"></i>Blocks & Apartments Statistics
            </h4>
            <p class="text-muted">Status of our blocks and apartment units</p>
        </div>
        <div class="row g-4">
            <div class="col-md-3 col-6">
                <div class="stats-box">
                    <h3><?= number_format($total_blocks) ?></h3>
                    <p><i class="bi bi-building me-1"></i>Total Blocks</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #17a2b8, #0e7c9e);">
                    <h3><?= number_format($total_units) ?></h3>
                    <p><i class="bi bi-door-closed me-1"></i>Total Apartment Units</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #28a745, #20c997);">
                    <h3><?= number_format($available_units) ?></h3>
                    <p><i class="bi bi-check-circle me-1"></i>Available Units</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #dc3545, #e74c3c);">
                    <h3><?= number_format($sold_units) ?></h3>
                    <p><i class="bi bi-cart-check me-1"></i>Sold Units</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-white">
    <div class="container">
        <div class="section-title">
            <h2>Why Choose Khawar?</h2>
            <p>We have provided the best options for your investment</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-map"></i>
                    <h5>Interactive Map</h5>
                    <p class="text-muted small">View all plots on the map with online purchasing option</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-shield-check"></i>
                    <h5>Valid Documents</h5>
                    <p class="text-muted small">All plots come with official and legal documents</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-cash-coin"></i>
                    <h5>Fair Pricing</h5>
                    <p class="text-muted small">Competitive prices with installment payment options</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-headset"></i>
                    <h5>24/7 Support</h5>
                    <p class="text-muted small">Our support team is always ready to help</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Plot Types Section -->
<section class="py-5">
    <div class="container">
        <div class="section-title">
            <h2>Plot Types</h2>
            <p>A wide range of plots in different sizes</p>
        </div>
        <div class="row g-4">
            <?php
            $plot_types = [
                ['code' => 'p_2_', 'name' => 'Two Jiribs', 'area' => '200 Square Meters', 'price' => '3,000', 'color' => '#ff7b00', 'icon' => 'bi-house'],
                ['code' => 'p_2.6_', 'name' => 'Two and a Half Jiribs', 'area' => '260 Square Meters', 'price' => '4,000', 'color' => '#fd5826', 'icon' => 'bi-house-door'],
                ['code' => 'p_3_', 'name' => 'Three Jiribs', 'area' => '300 Square Meters', 'price' => '5,000', 'color' => '#0515ee', 'icon' => 'bi-building'],
                ['code' => 'p_4_', 'name' => 'Four Jiribs', 'area' => '400 Square Meters', 'price' => '10,000', 'color' => '#fcb724', 'icon' => 'bi-buildings'],
                ['code' => 'p_5_', 'name' => 'Five Jiribs', 'area' => '510 Square Meters', 'price' => '15,000', 'color' => '#ff9100', 'icon' => 'bi-building-fill'],
                ['code' => 'p_6_', 'name' => 'Six Jiribs', 'area' => '600 Square Meters', 'price' => '20,000', 'color' => '#03af2e', 'icon' => 'bi-buildings-fill'],
                ['code' => 'p_10_', 'name' => 'Ten Jiribs', 'area' => '1000 Square Meters', 'price' => '30,000', 'color' => '#ff0000', 'icon' => 'bi-bank'],
                ['code' => 'p_vip_', 'name' => 'VIP', 'area' => 'Special', 'price' => 'Negotiable', 'color' => '#00d9ff', 'icon' => 'bi-star'],
            ];
            foreach ($plot_types as $type): ?>
            <div class="col-lg-3 col-md-6">
                <div class="card card-plot h-100">
                    <div class="card-body text-center">
                        <div style="width: 70px; height: 70px; background: <?= $type['color'] ?>22; border-radius: 50%; margin: 0 auto 15px; display: flex; align-items: center; justify-content: center;">
                            <i class="bi <?= $type['icon'] ?>" style="font-size: 2rem; color: <?= $type['color'] ?>;"></i>
                        </div>
                        <h5 class="fw-bold"><?= $type['name'] ?></h5>
                        <p class="text-muted mb-1"><i class="bi bi-rulers me-1"></i><?= $type['area'] ?></p>
                        <p class="text-muted mb-1"><i class="bi bi-cash me-1"></i>From <?= $type['price'] ?> USD</p>
                        <a href="map.php" class="btn btn-outline-primary btn-sm mt-2" style="border-radius: 20px;" target="_blank">
                            <i class="bi bi-eye me-1"></i>View
                        </a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- Block Types Section -->
<section class="py-5">
    <div class="container">
        <div class="section-title">
            <h2>Apartment Block Types</h2>
            <p>Modern apartments in various blocks with full facilities</p>
        </div>
        <div class="row g-4">
            <?php if (count($block_types) > 0): ?>
                <?php foreach ($block_types as $bt): ?>
                <div class="col-lg-3 col-md-6">
                    <div class="card card-plot h-100">
                        <div class="card-body text-center">
                            <div style="width: 70px; height: 70px; background: #2c5f7c22; border-radius: 50%; margin: 0 auto 15px; display: flex; align-items: center; justify-content: center;">
                                <i class="bi bi-buildings" style="font-size: 2rem; color: #2c5f7c;"></i>
                            </div>
                            <h5 class="fw-bold"><?= htmlspecialchars($bt['key']) ?> Meter Block</h5>
                            <p class="text-muted mb-1"><i class="bi bi-rulers me-1"></i>Size <?= number_format($bt['size']) ?> Square Meters</p>
                            <p class="text-muted mb-1"><i class="bi bi-layers me-1"></i><?= htmlspecialchars($bt['floors']) ?> Floor(s)</p>
                            <p class="text-muted mb-1"><i class="bi bi-grid me-1"></i><?= number_format($bt['count']) ?> Blocks | <?= number_format($bt['units']) ?> Units</p>
                            <p class="mb-2">
                                <span class="badge badge-available"><?= number_format($bt['avail']) ?> Available</span>
                                <span class="badge badge-sold me-1"><?= number_format($bt['sold']) ?> Sold</span>
                            </p>
                            <a href="map.php" class="btn btn-outline-primary btn-sm mt-2" style="border-radius: 20px;" target="_blank">
                                <i class="bi bi-eye me-1"></i>View on Map
                            </a>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="col-12 text-center text-muted py-4">
                    <i class="bi bi-building d-block mb-2" style="font-size: 3rem;"></i>
                    No apartment blocks have been registered yet
                </div>
            <?php endif; ?>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-5 bg-white">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="fw-bold" style="color: #1a3a5c;">Ready to buy your desired plot or apartment?</h2>
                <p class="text-muted mb-4">Visit our interactive map, choose your desired plot or apartment and buy it</p>
                <a href="map.php" class="btn btn-lg btn-buy px-5" target="_blank">
                    <i class="bi bi-map me-2"></i>Go to Plots & Apartments Map
                </a>
                <a href="contact.php" class="btn btn-lg btn-outline-secondary ms-3 px-5" style="border-radius: 25px;">
                    <i class="bi bi-telephone me-2"></i>Free Consultation
                </a>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>