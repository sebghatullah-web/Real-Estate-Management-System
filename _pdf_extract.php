<?php
$p = 'c:/Users/Wali Zadah/OneDrive/Documents/KCC_Residential_Collection_Natural_English.pdf';
$d = @file_get_contents($p);
if (!$d) { echo "cannot open\n"; exit; }
echo 'SIZE=' . strlen($d) . "\n";

function decode_ascii85($t) {
    // remove ASCII85 whitespace
    $t = str_replace("\r\n", '', $t);
    $t = str_replace("\n", '', $t);
    $t = str_replace("\r", '', $t);
    $t = str_replace(' ', '', $t);
    if (strpos($t, '<~') === 0) { $t = substr($t, 2); }
    if (str_ends_with($t, '~>')) { $t = substr($t, 0, -2); }
    $out = '';
    $i = 0;
    $n = strlen($t);
    while ($i < $n) {
        $c = $t[$i];
        if ($c === 'z') { $out .= "\x00\x00\x00\x00"; $i++; continue; }
        $chunk = substr($t, $i, 5);
        $len = strlen($chunk);
        if ($len === 0) break;
        $val = 0;
        for ($k = 0; $k < $len; $k++) { $val = $val * 85 + (ord($chunk[$k]) - 33); }
        for ($k = 0; $k < $len - 1; $k++) { $out .= chr(($val >> (24 - $k * 8)) & 0xFF); }
        $i += $len;
    }
    return $out;
}

function extract_text($raw) {
    $out = '';
    $i = 0;
    $len = strlen($raw);
    while ($i < $len) {
        $ch = $raw[$i];
        if ($ch === '(') {
            $j = $i + 1;
            $buf = '';
            while ($j < $len) {
                $c2 = $raw[$j];
                if ($c2 === '\\') {
                    $nxt = $raw[$j + 1];
                    if (is_numeric($nxt)) {
                        $oct = '';
                        $k = $j + 1;
                        while ($k < $len && strlen($oct) < 3 && is_numeric($raw[$k])) { $oct .= $raw[$k]; $k++; }
                        $buf .= chr(intval($oct, 8));
                        $j = $k;
                        continue;
                    }
                    switch ($nxt) {
                        case 'n': $buf .= "\n"; break;
                        case 'r': $buf .= "\r"; break;
                        case 't': $buf .= "\t"; break;
                        case 'b': $buf .= "\b"; break;
                        case 'f': $buf .= "\f"; break;
                        case '(': $buf .= '('; break;
                        case ')': $buf .= ')'; break;
                        case '\\': $buf .= '\\'; break;
                        default: $buf .= $nxt;
                    }
                    $j += 2;
                    continue;
                }
                if ($c2 === ')') break;
                $buf .= $c2;
                $j++;
            }
            $out .= $buf;
            $i = $j + 1;
        } else {
            $i++;
        }
    }
    return $out;
}

$pos = 0; $streamNo = 0; $pageNo = 0;
while (true) {
    $m = strpos($d, 'stream', $pos);
    if ($m === false) break;
    $beforeStart = max(0, $m - 600);
    $before = substr($d, $beforeStart, $m - $beforeStart);
    $streamStart = $m + 6;
    if (substr($d, $streamStart, 2) === "\r\n") $streamStart += 2;
    elseif (substr($d, $streamStart, 1) === "\n") $streamStart += 1;
    elseif (substr($d, $streamStart, 1) === "\r") $streamStart += 1;
    $e = strpos($d, 'endstream', $streamStart);
    if ($e === false) { echo "NO ENDSTREAM @ $streamStart\n"; break; }
    $raw = substr($d, $streamStart, $e - $streamStart);
    $isImageLike = strpos($before, '/Image') !== false || strpos($before, '/DCTDecode') !== false || strpos($before, '/JPXDecode') !== false;
    if (!$isImageLike) {
        $filters = '';
        if (strpos($before, '/ASCII85Decode') !== false) { $raw = decode_ascii85($raw); $filters .= 'A85 '; }
        if (strpos($before, '/FlateDecode') !== false) {
            $dec = @gzuncompress($raw);
            if ($dec) { $raw = $dec; $filters .= 'FLATE '; }
            else { $filters .= 'FLATE-FAIL '; }
        }
        $hasTxt = strstr($raw, 'Tj') !== false || strstr($raw, 'TJ') !== false || strpos($raw, 'Tf') !== false;
        echo 'STREAM#' . (++$streamNo) . ' filters=[' . $filters . '] len=' . strlen($raw) . ' hasText=' . ($hasTxt ? 'Y' : 'N') . "\n";
        if ($hasTxt) {
            $txt = extract_text($raw);
            $clean = trim($txt);
            if ($clean !== '') {
                echo "===== PAGE " . (++$pageNo) . " =====\n" . $clean . "\n";
            }
        }
    }
    $pos = $e + 9;
}
echo "===== DONE streams=$streamNo pages=$pageNo =====\n";