<?php
$p = 'c:/Users/Wali Zadah/OneDrive/Documents/KCC_Residential_Collection_Natural_English.pdf';
$d = file_get_contents($p);

function ascii85_decode($s) {
    $s = trim(preg_replace("/[\r\n]+/", '', $s));
    if (substr($s, 0, 2) === '<~') { $s = substr($s, 2); }
    if (substr($s, -2) === '~>') { $s = substr($s, 0, strlen($s) - 2); }
    $out = '';
    $i = 0;
    $len = strlen($s);
    while ($i < $len) {
        $c = $s[$i];
        if ($c === 'z' || $c === 'Z') {
            $out .= "\x00\x00\x00\x00";
            $i++;
            continue;
        }
        $chunk = '';
        while (strlen($chunk) < 5 && $i < $len) {
            $chunk .= $s[$i];
            $i++;
        }
        $pad = 0;
        while (strlen($chunk) < 5) {
            $chunk .= 'u';
            $pad++;
        }
        $n = 0;
        for ($j = 0; $j < 5; $j++) {
            $n = $n * 85 + (ord($chunk[$j]) - 33);
        }
        $bytes = chr(($n >> 24) & 0xFF) . chr(($n >> 16) & 0xFF) . chr(($n >> 8) & 0xFF) . chr($n & 0xFF);
        if ($pad > 0) {
            $out .= substr($bytes, 0, 4 - $pad);
        } else {
            $out .= $bytes;
        }
    }
    return $out;
}

$text = '';
$searchFrom = 0;
while (true) {
    $sIdx = strpos($d, 'stream', $searchFrom);
    if ($sIdx === false) break;
    $nl = strpos($d, "\n", $sIdx);
    if ($nl === false) break;
    $dataStart = $nl + 1;
    $eIdx = strpos($d, 'endstream', $dataStart);
    if ($eIdx === false) break;
    $raw = substr($d, $dataStart, $eIdx - $dataStart);
    while (strlen($raw) > 0 && (substr($raw, -1) === "\n" || substr($raw, -1) === "\r")) {
        $raw = substr($raw, 0, strlen($raw) - 1);
    }
    $searchFrom = $eIdx + 9;

    $before = substr($d, max(0, $sIdx - 150), 150);
    $decoded = $raw;

    if (strpos($before, 'ASCII85Decode') !== false) {
        $decoded = ascii85_decode($decoded);
    }
    $unz = @gzuncompress($decoded);
    if ($unz !== null) {
        $decoded = $unz;
    }

    $text .= "===== STREAM =====\n" . $decoded . "\n\n";
}

$f = fopen('_pdf_content.txt', 'wb');
fwrite($f, $text);
fclose($f);
echo 'Wrote _pdf_content.txt len=' . strlen($text) . "\n";
echo strpos($text, '===== STREAM =====') . "\n";