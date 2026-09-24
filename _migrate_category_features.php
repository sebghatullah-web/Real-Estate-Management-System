<?php
/* ============================================================
   Migration: per-category unit features (dynamic amenities)
   Creates:
     - unit_category_features table (category, feature, sort_order)
       seeded with default features for all 7 unit categories
     - widens block_unit_features.feature_label so longer feature
       texts (added by the manager) always fit
   Idempotent: safe to run multiple times.
   ============================================================ */
include __DIR__ . '/admin/config/db.php';

function cf_table_exists($conn, $table) {
    $r = $conn->query("SELECT COUNT(*) AS c FROM information_schema.TABLES WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = '$table'");
    $row = $r->fetch_assoc();
    return intval($row['c']) > 0;
}

// ---------- 1. unit_category_features table ----------
if (!cf_table_exists($conn, 'unit_category_features')) {
    $sql = "CREATE TABLE unit_category_features (
        id INT(11) NOT NULL AUTO_INCREMENT,
        category VARCHAR(50) NOT NULL,
        feature VARCHAR(255) NOT NULL,
        sort_order INT(11) NOT NULL DEFAULT 0,
        created_at TIMESTAMP NOT NULL DEFAULT current_timestamp(),
        PRIMARY KEY (id),
        UNIQUE KEY uq_cat_feature (category, feature)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci";
    if ($conn->query($sql)) {
        echo "Created table unit_category_features\n";
    } else {
        echo "ERROR creating unit_category_features: " . $conn->error . "\n";
        $conn->close();
        exit(1);
    }
} else {
    echo "unit_category_features table already exists\n";
}

// ---------- 2. widen block_unit_features.feature_label ----------
$conn->query("ALTER TABLE block_unit_features MODIFY feature_label VARCHAR(255) NOT NULL");
echo "block_unit_features.feature_label widened to VARCHAR(255)\n";

// ---------- 3. Seed defaults per category (missing categories get filled) ----------
$seed = [
    'standard' => [
        '1 master bedroom + 1 additional bedroom',
        '1 living hall',
        '1-2 bathrooms',
        'Fitted kitchen with full kitchen appliances',
        'Built-in wardrobes and cabinets',
        'Sanitary ware and lighting',
        'Washer and dryer',
        'Balcony',
        'Shared lift',
        'Shared outdoor parking',
    ],
    'premium' => [
        '1 master bedroom + 2 additional bedrooms',
        '1-2 living halls',
        '2 bathrooms',
        'Fully equipped kitchen',
        'Selected bedroom and living furniture (semi-furnished)',
        'Upgraded finishes',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Balcony',
        'Dedicated indoor parking + shared outdoor parking',
        'Shared lift',
    ],
    'vip' => [
        '1 master bedroom + 2-3 additional bedrooms',
        '1-2 living halls',
        '2-3 bathrooms',
        'Fully furnished',
        'Upgraded kitchen and appliances',
        'Upgraded finishes and lighting',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Balcony / terrace',
        'Private indoor parking + shared outdoor parking',
        'Shared lift',
    ],
    'vvip' => [
        '1 master bedroom + 2-3 additional bedrooms',
        '1-2 living halls',
        '3 bathrooms',
        'Private laundry',
        'Fully equipped kitchen',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Fireplace and balcony',
        'Shared lift',
        'Fully furnished and equipped',
        'Dedicated parking space(s), plus access to shared parking',
        'No private lift, sauna or separate guest apartment',
    ],
    'grand_residence' => [
        '1 master bedroom + 2-3 additional bedrooms',
        '2 living halls',
        '3 bathrooms',
        'Fully furnished & equipped',
        'Complete furniture, appliances and lighting',
        'Coordinated interior finishes',
        'Fully equipped kitchen',
        'Private laundry',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Balcony / terrace',
        'Private indoor parking + shared outdoor parking',
        'Shared lift',
    ],
    'grand_penthouse' => [
        '1 master bedroom + 2 additional bedrooms',
        '2 living halls',
        '3 bathrooms',
        'Luxury penthouse finishes',
        'Fully furnished & equipped',
        'Fully equipped kitchen',
        'Private laundry',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Balcony / terrace with best exposure',
        'Premium private indoor parking',
        'Private lift access',
    ],
    'royal_penthouse' => [
        '2 master bedrooms + 2-3 additional bedrooms',
        '2-3 living halls',
        '3-4 bathrooms',
        'Signature royal penthouse finishing',
        'Fully furnished and equipped',
        'Fully equipped gourmet kitchen',
        'Private laundry / maid room',
        'Washer and dryer',
        'Built-in cabinets and wardrobes',
        'Fireplace and large balcony / terrace',
        'Private lift',
        'Sauna and separate guest apartment',
        'Premium private indoor parking',
        '24/7 security and concierge',
    ],
];

$stmt = $conn->prepare("INSERT INTO unit_category_features (category, feature, sort_order) VALUES (?, ?, ?)");
$totalInserted = 0;
foreach ($seed as $cat => $features) {
    $cntRes = $conn->query("SELECT COUNT(*) AS c FROM unit_category_features WHERE category = '" . $conn->real_escape_string($cat) . "'");
    $has = intval($cntRes->fetch_assoc()['c']) > 0;
    if ($has) {
        echo "  $cat: already seeded, skipped\n";
        continue;
    }
    $i = 1;
    foreach ($features as $feat) {
        $stmt->bind_param("ssi", $cat, $feat, $i);
        $stmt->execute();
        $i++;
        $totalInserted++;
    }
    echo "  $cat: seeded " . count($features) . " features\n";
}
$stmt->close();
echo "Migration done. Inserted $totalInserted features.\n";
$conn->close();