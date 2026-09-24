<?php
include __DIR__ . '/admin/config/db.php';
$conn->query("DROP TABLE IF EXISTS manazil");
echo "dropped manazil\n";
$conn->close();