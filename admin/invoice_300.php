<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$plot_table = 'plots_300';
$pay_table  = 'pay_300';

include __DIR__ . '/includes/invoice_plot_render.php';
?>
