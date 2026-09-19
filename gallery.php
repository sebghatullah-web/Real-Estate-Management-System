<?php include 'header.php'; ?>

<section class="page-banner">
    <div class="container">
        <h1><i class="bi bi-images me-2"></i>Image Gallery</h1>
        <p class="mb-0">Images of our projects and plots</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <?php
            $gallery_images = [
                ['icon' => 'bi-house', 'title' => 'Residential Plots Samples', 'color' => '#1a3a5c'],
                ['icon' => 'bi-building', 'title' => 'Commercial Projects', 'color' => '#2c5f7c'],
                ['icon' => 'bi-map', 'title' => 'Comprehensive Plots Map', 'color' => '#28a745'],
                ['icon' => 'bi-tree', 'title' => 'Green & Peaceful Environment', 'color' => '#20c997'],
                ['icon' => 'bi-water', 'title' => 'Natural Scenery', 'color' => '#0dcaf0'],
                ['icon' => 'bi-sun', 'title' => 'Modern Lighting', 'color' => '#ffc107'],
            ];
            foreach ($gallery_images as $img): ?>
            <div class="col-lg-4 col-md-6">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                    <div style="height: 250px; background: linear-gradient(135deg, <?= $img['color'] ?>22, <?= $img['color'] ?>44); display: flex; align-items: center; justify-content: center;">
                        <i class="bi <?= $img['icon'] ?>" style="font-size: 5rem; color: <?= $img['color'] ?>;"></i>
                    </div>
                    <div class="card-body text-center">
                        <h5 class="fw-bold"><?= $img['title'] ?></h5>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
        
        <div class="text-center mt-5">
            <p class="text-muted">Click to view the interactive map and choose your desired plot</p>
            <a href="map.php" class="btn btn-buy btn-lg px-5">
                <i class="bi bi-map me-2"></i>Go to Plots Map
            </a>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>