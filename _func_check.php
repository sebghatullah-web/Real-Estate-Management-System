<?php
foreach (['str_find','str_find_last','str_contains','str_starts_with','str_ends_with','str_replace_all','str_trim','str_slice','str_split','str_to_lower'] as $f) {
    echo $f . '=' . (function_exists($f) ? 'Y' : 'N') . '  ';
}
echo "\n";