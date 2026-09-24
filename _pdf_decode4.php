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

echo 'gzuncompress exists: ' . var_export(function_exists('gzuncompress')) . "\n";
echo 'gzdecompress exists: ' . var_export(function_exists('gzdecompress')) . "\n";
echo 'zlib_uncompress exists: ' . var_export(function_exists('zlib_uncompress')) . "\n";
echo 'zlib_decompress exists: ' . var_export(function_exists('zlib_decompress')) . "\n";
echo 'zlib_decode exists: ' . var_export(function_exists('zlib_decode')) . "\n";

$sIdx = strpos($d, 'stream');
$nl = strpos($d, "\n", $sIdx);
$dataStart = $nl + 1;
$eIdx = strpos($d, 'endstream', $dataStart);
$raw = substr($d, $dataStart, $eIdx - $dataStart);
while (substr($raw, -1) === "\n" || substr($raw, -1) === "\r") {
    $raw = substr($raw, 0, strlen($raw) - 1);
}
$dec = ascii85_decode($raw);

$f = fopen('_a85.bin', 'wb'); fwrite($f, $dec); fclose($f);
echo "wrote _a85.bin\n";

$out1 = @gzuncompress($dec);
echo "gzuncompress: " . (($out1 === null) ? 'NULL(fail)' : ('len=' . strlen($out1))) . "\n";