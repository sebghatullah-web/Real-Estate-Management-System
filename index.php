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

include 'header.php';
?>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container position-relative" style="z-index: 1;">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <h1>به <span style="color: #ffc107;">شرکت ساختمانی خاور</span> خوش آمدید</h1>
                <p>شرکت ساختمانی و انکشافی خاور - مرجع معتبر خرید و فروش نمرات مسکونی، تجارتی و اپارتمان ها در کابل جدید</p>
                <a href="map.php" class="btn btn-hero">
                    <i class="bi bi-map me-2"></i>مشاهده نقشه نمرات
                </a>
                <a href="contact.php" class="btn btn-outline-light btn-lg ms-3 px-4" style="border-radius: 30px;">
                    <i class="bi bi-telephone me-2"></i>تماس با ما
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
        <div class="row g-4">
            <div class="col-md-3 col-6">
                <div class="stats-box">
                    <h3><?= number_format($total_plots) ?></h3>
                    <p><i class="bi bi-grid-3x3-gap-fill me-1"></i>تعداد نمرات</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #28a745, #20c997);">
                    <h3><?= number_format($available_plots) ?></h3>
                    <p><i class="bi bi-check-circle me-1"></i>نمرات قابل فروش</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #dc3545, #e74c3c);">
                    <h3><?= number_format($sold_plots) ?></h3>
                    <p><i class="bi bi-cart-check me-1"></i>نمرات فروخته شده</p>
                </div>
            </div>
            <div class="col-md-3 col-6">
                <div class="stats-box" style="background: linear-gradient(135deg, #6f42c1, #8e44ad);">
                    <h3><?= number_format($total_customers) ?></h3>
                    <p><i class="bi bi-people me-1"></i>مشتریان</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-white">
    <div class="container">
        <div class="section-title">
            <h2>چرا خاور را انتخاب کنید؟</h2>
            <p>ما بهترین گزینه‌ها را برای سرمایه‌گذاری شما فراهم کرده‌ایم</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-map"></i>
                    <h5>نقشه تعاملی</h5>
                    <p class="text-muted small">مشاهده تمام نمرات روی نقشه با امکان خرید آنلاین</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-shield-check"></i>
                    <h5>اسناد معتبر</h5>
                    <p class="text-muted small">تمام نمرات دارای اسناد رسمی و قانونی می‌باشند</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-cash-coin"></i>
                    <h5>قیمت منصفانه</h5>
                    <p class="text-muted small">قیمت‌های رقابتی با امکان پرداخت قسطی</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="feature-box">
                    <i class="bi bi-headset"></i>
                    <h5>پشتیبانی ۲۴/۷</h5>
                    <p class="text-muted small">تیم پشتیبانی ما همیشه آماده پاسخ‌گویی است</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Plot Types Section -->
<section class="py-5">
    <div class="container">
        <div class="section-title">
            <h2>انواع نمرات</h2>
            <p>طیف گسترده‌ای از نمرات در اندازه‌های مختلف</p>
        </div>
        <div class="row g-4">
            <?php
            $plot_types = [
                ['code' => 'p_2_', 'name' => 'دو بسوه‌ای', 'area' => '۲۰۰ متر مربع', 'price' => '۳,۰۰۰', 'color' => '#ff7b00', 'icon' => 'bi-house'],
                ['code' => 'p_2.6_', 'name' => 'دونیم بسوه‌ای', 'area' => '۲۶۰ متر مربع', 'price' => '۴,۰۰۰', 'color' => '#fd5826', 'icon' => 'bi-house-door'],
                ['code' => 'p_3_', 'name' => 'سه بسوه‌ای', 'area' => '۳۰۰ متر مربع', 'price' => '۵,۰۰۰', 'color' => '#0515ee', 'icon' => 'bi-building'],
                ['code' => 'p_4_', 'name' => 'چهار بسوه‌ای', 'area' => '۴۰۰ متر مربع', 'price' => '۱۰,۰۰۰', 'color' => '#fcb724', 'icon' => 'bi-buildings'],
                ['code' => 'p_5_', 'name' => 'پنج بسوه‌ای', 'area' => '۵۱۰ متر مربع', 'price' => '۱۵,۰۰۰', 'color' => '#ff9100', 'icon' => 'bi-building-fill'],
                ['code' => 'p_6_', 'name' => 'شش بسوه‌ای', 'area' => '۶۰۰ متر مربع', 'price' => '۲۰,۰۰۰', 'color' => '#03af2e', 'icon' => 'bi-buildings-fill'],
                ['code' => 'p_10_', 'name' => 'ده بسوه‌ای', 'area' => '۱۰۰۰ متر مربع', 'price' => '۳۰,۰۰۰', 'color' => '#ff0000', 'icon' => 'bi-bank'],
                ['code' => 'p_vip_', 'name' => 'VIP', 'area' => 'ویژه', 'price' => 'توافقی', 'color' => '#00d9ff', 'icon' => 'bi-star'],
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
                        <p class="text-muted mb-1"><i class="bi bi-cash me-1"></i>از <?= $type['price'] ?> دالر</p>
                        <a href="map.php" class="btn btn-outline-primary btn-sm mt-2" style="border-radius: 20px;">
                            <i class="bi bi-eye me-1"></i>مشاهده
                        </a>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-5 bg-white">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="fw-bold" style="color: #1a3a5c;">برای خرید نمره مورد نظر خود آماده‌اید؟</h2>
                <p class="text-muted mb-4">با مراجعه به نقشه تعاملی ما، نمره مورد نظر خود را انتخاب کرده و خرید کنید</p>
                <a href="map.php" class="btn btn-lg btn-buy px-5">
                    <i class="bi bi-map me-2"></i>رفتن به نقشه نمرات
                </a>
                <a href="contact.php" class="btn btn-lg btn-outline-secondary ms-3 px-5" style="border-radius: 25px;">
                    <i class="bi bi-telephone me-2"></i>مشاوره رایگان
                </a>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>