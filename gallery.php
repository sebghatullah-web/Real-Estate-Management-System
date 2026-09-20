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
                    [
                        'image' => 'img/gallery/residential-plots.jpg',
                        'title' => 'Residential Plots Samples'
                    ],
                    [
                        'image' => 'img/gallery/commercial-projects.jpg',
                        'title' => 'Commercial Projects'
                    ],
                    [
                        'image' => 'img/gallery/apartments.jpg',
                        'title' => 'Modern Apartments'
                        
                    ],
                    [
                        'image' => 'img/gallery/plots-map.jpg',
                        'title' => 'Comprehensive Plots Map'
                    ],
                    [
                        'image' => 'img/gallery/natural-scenery.jpg',
                        'title' => 'Natural Scenery'
                    ],
                    [
                        'image' => 'img/gallery/modern-mosque.jpg',
                        'title' => 'Modern Mosque Designs'
                    ],
                ];
            ?>
            <div class="row g-4">

                <?php foreach ($gallery_images as $img): ?>

                    <div class="col-lg-4 col-md-6">
                        <div class="card border-0 shadow-sm rounded-4 overflow-hidden">

                            <div style="height: 250px;">
                                <img 
                                    src="<?= $img['image'] ?>" 
                                    alt="<?= htmlspecialchars($img['title']) ?>"
                                    class="w-100 h-100"
                                    style="object-fit: cover;"
                                >
                            </div>

                            <div class="card-body text-center">
                                <h5 class="fw-bold">
                                    <?= $img['title'] ?>
                                </h5>
                            </div>

                        </div>
                    </div>

                <?php endforeach; ?>

            </div>
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