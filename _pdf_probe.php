<?php
$p = 'c:/Users/Wali Zadah/OneDrive/Documents/KCC_Residential_Collection_Natural_English.pdf';
$d = file_get_contents($p);
echo 'SIZE=' . strlen($d) . "\n";
foreach (['FlateDecode','ASCIIHexDecode','ASCII85Decode','/Font','CIDFont','Type0','ToUnicode','Tj','TJ','BT','ET','/F1','/F2','/F3','/Image','/ObjStm'] as $k) {
    echo $k . '=' . substr_count($d, $k) . "\n";
}
echo "--- HEAD ---\n";
$h = substr($d, 0, 3000);
echo utf8_encode($h);
echo "\n--- TAIL ---\n";
echo utf8_encode(substr($d, -1500));