<?php
$dec = file_get_contents('_a85.bin');
$out2 = @zlib_decode($dec);
echo "zlib_decode: " . (($out2 === null) ? 'NULL(fail)' : ('len=' . strlen($out2))) . "\n";
if ($out2 !== null && strlen($out2) > 0) {
    $f = fopen('_stream0.txt', 'wb'); fwrite($f, $out2); fclose($f);
    echo "wrote _stream0.txt\n";
    echo substr($out2, 0, 500) . "\n";
}