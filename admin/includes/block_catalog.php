<?php
/* ============================================================
   KHAWARDB — کاتالوگ امکانات بلاک‌ها و جزئیات واحدها
   این فایل در همه صفحات مدیریت بلاک‌ها به‌کار برده می‌شود.
   ============================================================ */

// ---------- امکانات بلاک (عمارت) ----------
$BLOCK_AMENITIES = [
    'lobby'           => 'لابی',
    'staircase'       => 'راه‌پله',
    'elevator'        => 'آسانسور',
    'parking'         => 'پارکینگ',
    'green_space'     => 'فضای سبز',
    'kids_play'       => 'محوطه بازی کودکان',
    'security'        => 'نگهبانی / امنیت',
    'cctv'            => 'سیستم CCTV',
    'facilities_room' => 'اتاق تأسیسات',
    'water_tank'      => 'مخزن آب',
    'generator'       => 'ژنراتور یا برق اضطراری',
    'fire_fighting'   => 'سیستم اطفای حریق',
    'garbage_area'    => 'محل جمع‌آوری زباله',
];

// ---------- جزئیات/اتاق‌های هر واحد (اپارتمان) ----------
$UNIT_FEATURES = [
    'entrance_foyer'  => 'دهلیز / ورودی',
    'living_room'     => 'سالون عمومی',
    'dining_room'     => 'اتاق غذاخوری',
    'kitchen'         => 'آشپزخانه',
    'master_bedroom'  => 'اتاق خواب اصلی',
    'bathroom'        => 'حمام',
    'toilet'          => 'توالت',
    'master_bathroom' => 'حمام و توالت اختصاصی اتاق خواب اصلی',
    'balcony'         => 'بالکن',
    'walkin_closet'   => 'اتاق لباس / کمد دیواری',
    'storage'         => 'انبار داخلی',
    'laundry'         => 'رخت‌شویی',
];

// ---------- کتگوری‌های واحد ----------
$UNIT_CATEGORIES = ['standard', 'premium', 'vip', 'vvip'];

/**
 * تبدیل شناسه کتگوری به برچسب فارسی
 */
function unit_category_label($cat) {
    switch ($cat) {
        case 'premium': return 'پریمیوم';
        case 'vip':     return 'وی‌آی‌پی';
        case 'vvip':    return 'وی‌وی‌آی‌پی';
        case 'standard':
        default:        return 'استاندارد';
    }
}

/**
 * کلاس رنگ برای کتگوری (برای نمایش در جدول‌ها)
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