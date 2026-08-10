<?php
// Secure authentication check - include at the TOP of every admin page
session_start();

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header('Location: login.php');
    exit;
}

// Optional: update last activity time
$_SESSION['admin_last_activity'] = time();
?>