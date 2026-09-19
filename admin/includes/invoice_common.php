<?php
/* ============================================================
   KHAWARDB — Shared professional A4 invoice functions
   ============================================================ */

/**
 * Convert a number to English words (for writing amounts in words on invoices)
 */
function numToWordsEn($number) {
    $number = intval(round((float)$number));
    if ($number === 0) return 'Zero';

    $units = array('', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
                   'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen', 'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen');
    $tens = array('', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety');
    $hundreds = array('', 'One Hundred', 'Two Hundred', 'Three Hundred', 'Four Hundred', 'Five Hundred', 'Six Hundred', 'Seven Hundred', 'Eight Hundred', 'Nine Hundred');
    $scales = array('', 'Thousand', 'Million', 'Billion', 'Trillion');

    $three = function ($n) use ($units, $tens, $hundreds) {
        $text = '';
        $h = intdiv($n, 100);
        $r = $n % 100;
        if ($h > 0) { $text .= $hundreds[$h]; }
        if ($r > 0) {
            if ($text !== '') $text .= ' and ';
            if ($r < 20) {
                $text .= $units[$r];
            } else {
                $text .= $tens[intdiv($r, 10)];
                if ($r % 10 > 0) $text .= ' ' . $units[$r % 10];
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
    return implode(', ', array_reverse($parts));
}

/**
 * Format a number with thousand separators
 */
function invoice_fmt($num) {
    return number_format((float)$num, 2);
}

/**
 * Invoice page head + font & style links
 */
function invoice_a4_head($title) {
    echo '<!DOCTYPE html>';
    echo '<html lang="en" dir="ltr">';
    echo '<head>';
    echo '<meta charset="utf-8">';
    echo '<meta name="viewport" content="width=device-width, initial-scale=1">';
    echo '<title>' . htmlspecialchars($title) . '</title>';
    echo '<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">';
    echo '<link rel="stylesheet" href="includes/invoice_a4.css">';
    echo '</head>';
    echo '<body>';
}

/**
 * Toolbar (on-screen only — hidden when printing)
 */
function invoice_a4_toolbar($back_url, $back_label = 'Back to List') {
    echo '<div class="invoice-toolbar no-print">';
    echo '<button type="button" class="btn-p btn-p-primary" onclick="window.print()">🖨 Print Invoice / PDF</button>';
    echo '<a href="' . htmlspecialchars($back_url) . '" class="btn-p btn-p-secondary">↩ ' . htmlspecialchars($back_label) . '</a>';
    echo '</div>';
}

/**
 * Open the invoice sheet + company header + number & date
 */
function invoice_a4_open($invoice_no, $date_str, $title_fa = 'Payment Invoice', $title_en = 'PAYMENT INVOICE') {
    echo '<div class="invoice-sheet">';
    echo '<div class="inv-header">';
    echo '<div class="inv-brand">';
    echo '<div class="brand-logo">KH</div>';
    echo '<div class="brand-text"><h1>KHAWAR</h1><p>Khawar Construction Company</p></div>';
    echo '</div>';
    echo '<div class="inv-title">';
    echo '<h2>' . htmlspecialchars($title_fa) . '</h2>';
    echo '<p>' . htmlspecialchars($title_en) . '</p>';
    echo '</div>';
    echo '</div>';
    echo '<div class="inv-meta">';
    echo '<div class="meta-item"><span>Invoice No.</span><strong>' . htmlspecialchars($invoice_no) . '</strong></div>';
    echo '<div class="meta-item"><span>Issue Date</span><strong>' . htmlspecialchars($date_str) . '</strong></div>';
    echo '</div>';
}

/**
 * Seller / buyer block
 */
function invoice_a4_billto($c) {
    echo '<div class="inv-parties">';
    echo '<div class="party party-seller">';
    echo '<h4><span class="dot"></span>Seller</h4>';
    echo '<p class="p-name">KHAWAR — Khawar Construction Company</p>';
    echo '<p>Address: Sherpur Main Road, House No. 27, Kabul - Afghanistan</p>';
    echo '<p>Phone: 0745018168</p>';
    echo '</div>';
    echo '<div class="party party-buyer">';
    echo '<h4><span class="dot"></span>Customer / Buyer</h4>';
    echo '<p class="p-name">' . htmlspecialchars($c['full_name'] ?? '-') . '</p>';
    if (!empty($c['fathar_name']))  echo '<p>Son of: ' . htmlspecialchars($c['fathar_name']) . '</p>';
    if (!empty($c['national_id']))  echo '<p>National ID: ' . htmlspecialchars($c['national_id']) . '</p>';
    if (!empty($c['phone']))        echo '<p>Phone: ' . htmlspecialchars($c['phone']) . '</p>';
    echo '</div>';
    echo '</div>';
}

/**
 * Section title
 */
function invoice_a4_section($title) {
    echo '<div class="inv-section-title"><span class="bar"></span><h3>' . htmlspecialchars($title) . '</h3></div>';
}

/**
 * Close the sheet: note + signatures + footer
 */
function invoice_a4_close($note_html = '') {
    if ($note_html === '') {
        $note_html = '<b>Note:</b> This document is issued by Khawar Construction Company as a receipt for the above-mentioned amount. In case of any discrepancy, please contact our sales office within 72 hours.';
    }
    echo '<div class="inv-note">' . $note_html . '</div>';
    echo '<div class="inv-signatures">';
    echo '<div class="sign-box"><span>Customer (Buyer) Signature &amp; Thumb</span><div class="sig-line"></div></div>';
    echo '<div class="sign-box"><span>Sales Officer Signature &amp; Seal</span><div class="sig-line"></div></div>';
    echo '</div>';
    echo '<div class="inv-footer-note">www.khawardb.com &nbsp;|&nbsp; <b>KHAWARDB</b> © 2026 | Developed by BAHADORI</div>';
    echo '</div>'; // invoice-sheet
    echo '</body></html>';
}
?>
