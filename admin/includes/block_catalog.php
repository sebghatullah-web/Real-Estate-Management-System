<?php
/* ============================================================
   KHAWARDB — Catalog of block amenities and unit features
   Used on all block management pages.
   ============================================================ */

// ---------- Block amenities (building / common areas) ----------
$BLOCK_AMENITIES = [
    'lobby'           => 'Lobby',
    'staircase'       => 'Staircase',
    'elevator'        => 'Elevator',
    'parking'         => 'Parking',
    'green_space'     => 'Green Space',
    'kids_play'       => "Children's Play Area",
    'security'        => 'Security / Guard',
    'cctv'            => 'CCTV System',
    'facilities_room' => 'Facilities Room',
    'water_tank'      => 'Water Tank',
    'generator'       => 'Generator / Emergency Power',
    'fire_fighting'   => 'Fire Fighting System',
    'garbage_area'    => 'Garbage Collection Area',
];

// ---------- Features/rooms of each unit (apartment) ----------
$UNIT_FEATURES = [
    'entrance_foyer'  => 'Entrance / Foyer',
    'living_room'     => 'Living Room / Reception',
    'dining_room'     => 'Dining Room',
    'kitchen'         => 'Kitchen',
    'master_bedroom'  => 'Master Bedroom',
    'bathroom'        => 'Bathroom',
    'toilet'          => 'Toilet',
    'master_bathroom' => 'Master Bedroom Private Bathroom',
    'balcony'         => 'Balcony / Terrace',
    'walkin_closet'   => 'Walk-in Closet / Wardrobe',
    'storage'         => 'Storage Room',
    'laundry'         => 'Laundry Area',
];

// ---------- Unit categories ----------
// Order matters: it defines the dropdown order (lowest -> highest tier).
$UNIT_CATEGORIES = [
    'standard',
    'premium',
    'vip',
    'vvip',
    'grand_residence',
    'grand_penthouse',
    'royal_penthouse',
];

// Extra info per category (finish level, parking, description).
// Source: KCC_Residential_Collection_Natural_English.pdf concept sheet.
$CATEGORY_INFO = [
    'standard' => [
        'label' => 'Standard',
        'finish' => 'Equipped apartment',
        'parking' => 'Shared outdoor parking',
        'desc'   => 'Fitted kitchen, built-in wardrobes and cabinets, sanitary ware, lighting, full kitchen appliances, washer and dryer.',
    ],
    'premium' => [
        'label' => 'Premium',
        'finish' => 'Semi-furnished apartment',
        'parking' => 'Dedicated indoor parking + shared outdoor parking',
        'desc'   => 'Standard inclusions plus upgraded finishes and selected bedroom and living furniture.',
    ],
    'vip' => [
        'label' => 'VIP',
        'finish' => 'Furnished apartment',
        'parking' => 'Private indoor parking + shared outdoor parking',
        'desc'   => 'Upgraded finishes, kitchen and appliances, bathrooms, lighting and a broader furniture package.',
    ],
    'vvip' => [
        'label' => 'VVIP',
        'finish' => 'Fully furnished',
        'parking' => 'Private indoor parking (multi) + shared outdoor parking',
        'desc'   => 'Higher tier of VIP: larger plan, extra rooms and upgraded furniture package.',
    ],
    'grand_residence' => [
        'label' => 'Grand Residence',
        'finish' => 'Fully furnished & equipped',
        'parking' => 'Private indoor parking + shared outdoor parking',
        'desc'   => 'Complete furniture, appliances, lighting and coordinated interior finishes for a move-in-ready apartment.',
    ],
    'grand_penthouse' => [
        'label' => 'Grand Penthouse',
        'finish' => 'Luxury penthouse',
        'parking' => 'Premium private indoor parking',
        'desc'   => 'Top-floor residence with the best exposure and privacy; upgraded finishes throughout.',
    ],
    'royal_penthouse' => [
        'label' => 'Royal Penthouse',
        'finish' => 'Signature royal penthouse',
        'parking' => 'Premium private indoor parking',
        'desc'   => 'Largest and most exclusive unit; premium furnishing, amenities and parking.',
    ],
];

/**
 * Convert category id to display label
 */
function unit_category_label($cat) {
    global $CATEGORY_INFO;
    $info = $CATEGORY_INFO[$cat] ?? null;
    if ($info != null) {
        return $info['label'];
    }
    switch ($cat) {
        case 'premium': return 'Premium';
        case 'vip':     return 'VIP';
        case 'vvip':    return 'VVIP';
        case 'grand_residence': return 'Grand Residence';
        case 'grand_penthouse': return 'Grand Penthouse';
        case 'royal_penthouse': return 'Royal Penthouse';
        case 'standard':
        default:        return 'Standard';
    }
}

/**
 * Color class for a category (for table display)
 */
function unit_category_class($cat) {
    switch ($cat) {
        case 'premium': return 'text-info';
        case 'vip':     return 'text-warning';
        case 'vvip':    return 'text-danger';
        case 'grand_residence': return 'text-primary';
        case 'grand_penthouse': return 'text-royal';
        case 'royal_penthouse': return 'text-danger fw-bold';
        default:        return 'text-secondary';
    }
}

/**
 * Parking line for a category (used in forms/info)
 */
function unit_category_parking($cat) {
    global $CATEGORY_INFO;
    $info = $CATEGORY_INFO[$cat] ?? null;
    if ($info != null) {
        return $info['parking'];
    }
    return '';
}

/**
 * Finish/description line for a category
 */
function unit_category_desc($cat) {
    global $CATEGORY_INFO;
    $info = $CATEGORY_INFO[$cat] ?? null;
    if ($info != null) {
        return $info['desc'];
    }
    return '';
}
?>
