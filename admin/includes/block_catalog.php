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
$UNIT_CATEGORIES = ['standard', 'premium', 'vip', 'vvip'];

/**
 * Convert category id to display label
 */
function unit_category_label($cat) {
    switch ($cat) {
        case 'premium': return 'Premium';
        case 'vip':     return 'VIP';
        case 'vvip':    return 'VVIP';
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
        default:        return 'text-secondary';
    }
}
?>
