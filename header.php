<?php
require 'config/db.php';
?>
<!DOCTYPE html>
<html lang="fa">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KHAWAR CONSTRACTION COMPANY DB</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Vazir+FD&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { direction: rtl; font-family: 'Vazir FD', Tahoma, Arial, sans-serif; background-color: #f8f9fa; overflow-x: hidden; }
        .navbar { background: linear-gradient(135deg, #1a3a5c 0%, #2c5f7c 100%); box-shadow: 0 2px 15px rgba(0,0,0,0.1); padding: 12px 0; }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; color: #fff !important; display: flex; align-items: center; gap: 10px; }
        .navbar-brand i { font-size: 2rem; }
        .nav-link { color: rgba(255,255,255,0.85) !important; font-size: 1rem; margin: 0 8px; padding: 8px 16px !important; border-radius: 8px; transition: all 0.3s ease; }
        .nav-link:hover { color: #fff !important; background: rgba(255,255,255,0.15); transform: translateY(-1px); }
        .nav-link.active { background: rgba(255,255,255,0.2); color: #fff !important; }
        .nav-link i { margin-left: 6px; }
        .btn-map { background: #ffc107; color: #1a3a5c; font-weight: bold; border-radius: 25px; padding: 8px 24px !important; transition: all 0.3s ease; }
        .btn-map:hover { background: #ffca2c; transform: scale(1.05); color: #1a3a5c !important; }
        .footer { background: linear-gradient(135deg, #1a3a5c 0%, #2c5f7c 100%); color: #fff; padding: 50px 0 20px; margin-top: 60px; }
        .footer h5 { color: #ffc107; margin-bottom: 20px; font-weight: bold; }
        .footer a { color: rgba(255,255,255,0.8); text-decoration: none; transition: color 0.3s; }
        .footer a:hover { color: #ffc107; }
        .footer .social-links a { display: inline-block; width: 40px; height: 40px; background: rgba(255,255,255,0.1); border-radius: 50%; text-align: center; line-height: 40px; margin-left: 8px; transition: all 0.3s; }
        .footer .social-links a:hover { background: #ffc107; color: #1a3a5c; }
        .hero-section { background: linear-gradient(135deg, #1a3a5c 0%, #2c5f7c 50%, #1a3a5c 100%); color: #fff; padding: 100px 0 80px; position: relative; overflow: hidden; }
        .hero-section::before { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.03)" d="M0,96L48,112C96,128,192,160,288,186.7C384,213,480,235,576,213.3C672,192,768,128,864,128C960,128,1056,192,1152,208C1248,224,1344,192,1392,176L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>'); background-repeat: no-repeat; background-position: bottom; background-size: cover; }
        .hero-section h1 { font-size: 2.8rem; font-weight: bold; margin-bottom: 20px; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); }
        .hero-section p { font-size: 1.2rem; opacity: 0.9; margin-bottom: 30px; }
        .hero-section .btn-hero { background: #ffc107; color: #1a3a5c; font-weight: bold; padding: 12px 40px; border-radius: 30px; font-size: 1.1rem; transition: all 0.3s; border: none; }
        .hero-section .btn-hero:hover { transform: translateY(-3px); box-shadow: 0 10px 30px rgba(255,193,7,0.3); }
        .section-title { text-align: center; margin-bottom: 50px; color: #1a3a5c; }
        .section-title h2 { font-weight: bold; font-size: 2.2rem; margin-bottom: 10px; }
        .section-title p { color: #6c757d; font-size: 1.1rem; }
        .section-title::after { content: ''; display: block; width: 80px; height: 4px; background: #ffc107; margin: 15px auto 0; border-radius: 2px; }
        .card-plot { border: none; border-radius: 15px; overflow: hidden; box-shadow: 0 5px 25px rgba(0,0,0,0.08); transition: all 0.3s ease; }
        .card-plot:hover { transform: translateY(-8px); box-shadow: 0 15px 40px rgba(0,0,0,0.15); }
        .card-plot .card-body { padding: 25px; }
        .badge-available { background: #28a745; color: #fff; padding: 5px 15px; border-radius: 20px; font-size: 0.85rem; }
        .badge-sold { background: #dc3545; color: #fff; padding: 5px 15px; border-radius: 20px; font-size: 0.85rem; }
        .btn-buy { background: linear-gradient(135deg, #28a745, #20c997); color: #fff; border: none; padding: 10px 30px; border-radius: 25px; font-weight: bold; transition: all 0.3s; }
        .btn-buy:hover { transform: translateY(-2px); box-shadow: 0 5px 20px rgba(40,167,69,0.3); color: #fff; }
        .btn-buy:disabled { background: #6c757d; cursor: not-allowed; }
        .feature-box { text-align: center; padding: 40px 20px; border-radius: 15px; background: #fff; box-shadow: 0 5px 25px rgba(0,0,0,0.06); transition: all 0.3s; }
        .feature-box:hover { transform: translateY(-5px); box-shadow: 0 10px 35px rgba(0,0,0,0.1); }
        .feature-box i { font-size: 3rem; color: #2c5f7c; margin-bottom: 20px; }
        .feature-box h5 { font-weight: bold; color: #1a3a5c; }
        .stats-box { background: linear-gradient(135deg, #1a3a5c, #2c5f7c); padding: 40px; border-radius: 15px; color: #fff; text-align: center; }
        .stats-box h3 { font-size: 2.5rem; font-weight: bold; color: #ffc107; }
        .stats-box p { opacity: 0.9; font-size: 1rem; }
        .whatsapp-float { position: fixed; bottom: 20px; left: 20px; z-index: 999; background: #25d366; color: #fff; width: 60px; height: 60px; border-radius: 50%; text-align: center; line-height: 60px; font-size: 30px; box-shadow: 0 5px 20px rgba(37,211,102,0.3); transition: all 0.3s; }
        .whatsapp-float:hover { transform: scale(1.1); color: #fff; }
        .toast-container { position: fixed; top: 20px; left: 20px; z-index: 9999; }
        .page-banner { background: linear-gradient(135deg, #1a3a5c, #2c5f7c); padding: 60px 0 40px; color: #fff; text-align: center; }
        .page-banner h1 { font-weight: bold; font-size: 2.2rem; }
        .page-banner p { opacity: 0.9; }
        @media (max-width: 768px) { .hero-section h1 { font-size: 2rem; } .hero-section p { font-size: 1rem; } .navbar-brand { font-size: 1.2rem; } }
    </style>
</head>
<body>

<!-- WhatsApp Float Button -->
<a href="https://wa.me/93708530635" target="_blank" class="whatsapp-float" title="ارتباط با ما در واتساپ">
    <i class="bi bi-whatsapp"></i>
</a>

<!-- Toast Container -->
<div class="toast-container" id="toastContainer"></div>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container">
        <a class="navbar-brand" href="index.php">
            <i class="bi bi-building"></i>
            شرکت ساختمانی خاور
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link <?= basename($_SERVER['PHP_SELF']) == 'index.php' ? 'active' : '' ?>" href="index.php"><i class="bi bi-house-door"></i> خانه</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?= basename($_SERVER['PHP_SELF']) == 'about.php' ? 'active' : '' ?>" href="about.php"><i class="bi bi-info-circle"></i> درباره ما</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?= basename($_SERVER['PHP_SELF']) == 'services.php' ? 'active' : '' ?>" href="services.php"><i class="bi bi-gear"></i> خدمات</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?= basename($_SERVER['PHP_SELF']) == 'gallery.php' ? 'active' : '' ?>" href="gallery.php"><i class="bi bi-images"></i> گالری</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <?= basename($_SERVER['PHP_SELF']) == 'contact.php' ? 'active' : '' ?>" href="contact.php"><i class="bi bi-envelope"></i> تماس با ما</a>
                </li>
            </ul>
            <a href="map.php" class="btn btn-map nav-link"><i class="bi bi-map"></i> نقشه نمرات</a>
        </div>
    </div>
</nav>

<?php
// Function to show toast messages
function showToast($message, $type = 'success') {
    $icon = $type == 'success' ? 'bi-check-circle-fill' : ($type == 'danger' ? 'bi-x-circle-fill' : 'bi-info-circle-fill');
    echo "<script>
        document.addEventListener('DOMContentLoaded', function() {
            var container = document.getElementById('toastContainer');
            var toast = document.createElement('div');
            toast.className = 'toast align-items-center text-white bg-{$type} border-0 show';
            toast.role = 'alert';
            toast.innerHTML = '<div class=\"d-flex\"><div class=\"toast-body\"><i class=\"bi {$icon} me-2\"></i>{$message}</div><button type=\"button\" class=\"btn-close btn-close-white me-2 m-auto\" data-bs-dismiss=\"toast\"></button></div>';
            container.appendChild(toast);
            setTimeout(function() { toast.remove(); }, 5000);
        });
    </script>";
}
?>