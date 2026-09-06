<?php
/* ============================================================
   KHAWARDB — توابع مشترک انوایس حرفه‌ای A4
   ============================================================ */

/**
 * تبدیل عدد به حروف فارسی (برای درج مبلغ به حروف در انوایس)
 */
function numToWordsFa($number) {
    $number = intval(round((float)$number));
    if ($number === 0) return 'صفر';

    $units = array('', 'یک', 'دو', 'سه', 'چهار', 'پنج', 'شش', 'هفت', 'هشت', 'نه',
                   'ده', 'یازده', 'دوازده', 'سیزده', 'چهارده', 'پانزده', 'شانزده', 'هفده', 'هجده', 'نوزده');
    $tens = array('', '', 'بیست', 'سی', 'چهل', 'پنجاه', 'شصت', 'هفتاد', 'هشتاد', 'نود');
    $hundreds = array('', 'صد', 'دویست', 'سیصد', 'چهارصد', 'پانصد', 'ششصد', 'هفتصد', 'هشتصد', 'نهصد');
    $scales = array('', 'هزار', 'میلیون', 'میلیارد', 'تریلیون');

    $three = function ($n) use ($units, $tens, $hundreds) {
        $text = '';
        $h = intdiv($n, 100);
        $r = $n % 100;
        if ($h > 0) { $text .= $hundreds[$h]; }
        if ($r > 0) {
            if ($text !== '') $text .= ' و ';
            if ($r < 20) {
                $text .= $units[$r];
            } else {
                $text .= $tens[intdiv($r, 10)];
                if ($r % 10 > 0) $text .= ' و ' . $units[$r % 10];
            }
        }
        return $text;
    };

    $parts = array();
    $i = 0;
    while ($number > 0) {
        $chunk = $number % 1000;
        if ($chunk > 0) {
            $chunkText = $three($chunk);
            if ($scales[$i] !== '') $chunkText .= ' ' . $scales[$i];
            $parts[] = $chunkText;
        }
        $number = intdiv($number, 1000);
        $i++;
    }
    return implode(' و ', array_reverse($parts));
}

/**
 * قالب‌بندی عدد با جداکننده هزارگان
 */
function invoice_fmt($num) {
    return number_format((float)$num, 2);
}

/**
 * هدر صفحه انوایس + لینک فونت و استایل
 */
function invoice_a4_head($title) {
    echo '<!DOCTYPE html>';
    echo '<html lang="IR-fa" dir="rtl">';
    echo '<head>';
    echo '<meta charset="utf-8">';
    echo '<meta name="viewport" content="width=device-width, initial-scale=1">';
    echo '<title>' . htmlspecialchars($title) . '</title>';
    echo '<link href="https://fonts.googleapis.com/css2?family=Vazirmatn:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">';
    echo '<link rel="stylesheet" href="includes/invoice_a4.css">';
    echo '</head>';
    echo '<body>';
}

/**
 * نوار ابزار (فقط برای صفحه نمایش — در چاپ پنهان می‌شود)
 */
function invoice_a4_toolbar($back_url, $back_label = 'بازگشت به لیست') {
    echo '<div class="invoice-toolbar no-print">';
    echo '<button type="button" class="btn-p btn-p-primary" onclick="window.print()">🖨 چاپ انوایس / PDF</button>';
    echo '<a href="' . htmlspecialchars($back_url) . '" class="btn-p btn-p-secondary">↩ ' . htmlspecialchars($back_label) . '</a>';
    echo '</div>';
}

/**
 * باز کردن ورق انوایس + سربرگ شرکت + شماره و تاریخ
 */
function invoice_a4_open($invoice_no, $date_str, $title_fa = 'انوایس پرداختی', $title_en = 'PAYMENT INVOICE') {
    echo '<div class="invoice-sheet">';
    echo '<div class="inv-header">';
    echo '<div class="inv-brand">';
    echo '<div class="brand-logo">KH</div>';
    echo '<div class="brand-text"><h1>KHAWAR</h1><p>شرکت ساختمانی خاور</p></div>';
    echo '</div>';
    echo '<div class="inv-title">';
    echo '<h2>' . htmlspecialchars($title_fa) . '</h2>';
    echo '<p>' . htmlspecialchars($title_en) . '</p>';
    echo '</div>';
    echo '</div>';
    echo '<div class="inv-meta">';
    echo '<div class="meta-item"><span>شماره انوایس</span><strong>' . htmlspecialchars($invoice_no) . '</strong></div>';
    echo '<div class="meta-item"><span>تاریخ صدور</span><strong>' . htmlspecialchars($date_str) . '</strong></div>';
    echo '</div>';
}

/**
 * بلاک فروشنده / خریدار
 */
function invoice_a4_billto($c) {
    echo '<div class="inv-parties">';
    echo '<div class="party party-seller">';
    echo '<h4><span class="dot"></span>فروشنده</h4>';
    echo '<p class="p-name">KHAWAR — شرکت ساختمانی خاور</p>';
    echo '<p>آدرس: سرک عمومی شیرپور، خانه نمبر27، کابل-افغانستان</p>';
    echo '<p>تلفن: 0745018168</p>';
    echo '</div>';
    echo '<div class="party party-buyer">';
    echo '<h4><span class="dot"></span>مشتری / خریدار</h4>';
    echo '<p class="p-name">' . htmlspecialchars($c['full_name'] ?? '-') . '</p>';
    if (!empty($c['fathar_name']))  echo '<p>ولد: ' . htmlspecialchars($c['fathar_name']) . '</p>';
    if (!empty($c['national_id']))  echo '<p>شماره تذکره: ' . htmlspecialchars($c['national_id']) . '</p>';
    if (!empty($c['phone']))        echo '<p>شماره تماس: ' . htmlspecialchars($c['phone']) . '</p>';
    echo '</div>';
    echo '</div>';
}

/**
 * عنوان بخش
 */
function invoice_a4_section($title) {
    echo '<div class="inv-section-title"><span class="bar"></span><h3>' . htmlspecialchars($title) . '</h3></div>';
}

/**
 * بستن ورق: یادداشت + امضاها + پاورقی
 */
function invoice_a4_close($note_html = '') {
    if ($note_html === '') {
        $note_html = '<b>نکته:</b> این سند به مثابه رسید وصول مبلغ فوق الذکر از جانب شرکت ساختمانی خاور صادر گردیده است. لطفاً در صورت هرگونه مغایرت، ظرف ۷۲ ساعت با دفتر فروشات تماس حاصل نمایید.';
    }
    echo '<div class="inv-note">' . $note_html . '</div>';
    echo '<div class="inv-signatures">';
    echo '<div class="sign-box"><span>امضا و شصت مشتری (خریدار)</span><div class="sig-line"></div></div>';
    echo '<div class="sign-box"><span>امضا و مهر مسئول فروشات</span><div class="sig-line"></div></div>';
    echo '</div>';
    echo '<div class="inv-footer-note">www.khawardb.com &nbsp;|&nbsp; <b>KHAWARDB</b> © 2026 | توسعه‌داده‌شده توسط BAHADORI</div>';
    echo '</div>'; // invoice-sheet
    echo '</body></html>';
}
?>