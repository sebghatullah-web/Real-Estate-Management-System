<?php
require_once __DIR__ . '/../../config/db.php';

// ========== Helper function to get all plot tables ==========
function getPlotTables() {
    return ['plots_200', 'plots_260', 'plots_300', 'plots_400', 'plots_510', 'plots_600', 'plots_1000', 'plots_vip'];
}

function getPayTables() {
    return ['pay_200', 'pay_260', 'pay_300', 'pay_400', 'pay_510', 'pay_600', 'pay_1000', 'pay_vip'];
}

// ========== 1. Total Customers ==========
$totalCustomers = $pdo->query("SELECT COUNT(*) FROM customers")->fetchColumn();

// ========== 2. Total Plots, Sold, Available, Reserved ==========
$totalPlots = 0;
$totalSold = 0;
$totalAvailable = 0;
$totalReserved = 0;
$totalSoldValue = 0;

foreach (getPlotTables() as $table) {
    $row = $pdo->query("SELECT 
        COUNT(*) as total,
        SUM(CASE WHEN status='sold' THEN 1 ELSE 0 END) as sold,
        SUM(CASE WHEN status='available' THEN 1 ELSE 0 END) as available,
        SUM(CASE WHEN status='reserved' THEN 1 ELSE 0 END) as reserved,
        COALESCE(SUM(CASE WHEN status='sold' THEN total_price ELSE 0 END), 0) as sold_value
    FROM `$table`")->fetch(PDO::FETCH_ASSOC);
    
    $totalPlots += $row['total'];
    $totalSold += $row['sold'];
    $totalAvailable += $row['available'];
    $totalReserved += $row['reserved'];
    $totalSoldValue += $row['sold_value'];
}

// ========== 3. Total Revenue from Payments ==========
$totalRevenue = 0;
foreach (getPayTables() as $table) {
    $amount = $pdo->query("SELECT COALESCE(SUM(amount), 0) FROM `$table`")->fetchColumn();
    $totalRevenue += $amount;
}

// ========== 4. Recent Payments (last 10) ==========
$recentPayments = [];
foreach (getPayTables() as $table) {
    // Extract plot type from table name (e.g., 'pay_200' -> '200')
    $plotType = str_replace('pay_', '', $table);
    $correspondingPlotTable = 'plots_' . $plotType;
    
    $stmt = $pdo->prepare("
        SELECT p.id, p.amount, p.payment_date, p.plot_id, p.customer_id,
               c.full_name,
               pl.plot_code
        FROM `$table` p
        LEFT JOIN customers c ON p.customer_id = c.id
        LEFT JOIN `$correspondingPlotTable` pl ON p.plot_id = pl.id
        ORDER BY p.payment_date DESC
        LIMIT 10
    ");
    $stmt->execute();
    while ($payRow = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $payRow['plot_type'] = $plotType;
        $recentPayments[] = $payRow;
    }
}

// Sort recent payments by date and take top 10
usort($recentPayments, function($a, $b) {
    return strtotime($b['payment_date']) - strtotime($a['payment_date']);
});
$recentPayments = array_slice($recentPayments, 0, 10);

// ========== 5. Recent Customers (last 10) ==========
$recentCustomers = $pdo->query("SELECT id, full_name, phone, created_at FROM customers ORDER BY created_at DESC LIMIT 10")->fetchAll(PDO::FETCH_ASSOC);

// ========== 6. Plot Type Stats ==========
$plotTypeStats = [];
foreach (getPlotTables() as $table) {
    $plotType = str_replace('plots_', '', $table);
    $row = $pdo->query("SELECT 
        COUNT(*) as total,
        SUM(CASE WHEN status='sold' THEN 1 ELSE 0 END) as sold,
        SUM(CASE WHEN status='available' THEN 1 ELSE 0 END) as available,
        SUM(CASE WHEN status='reserved' THEN 1 ELSE 0 END) as reserved
    FROM `$table`")->fetch(PDO::FETCH_ASSOC);
    $row['type_label'] = $plotType;
    $plotTypeStats[$plotType] = $row;
}

// ========== 7. Block / Apartment Stats ==========
$totalBlocks = $pdo->query("SELECT COUNT(*) FROM blocks")->fetchColumn();

$unitStats = $pdo->query("SELECT
    COUNT(*) as total,
    SUM(CASE WHEN status='sold' THEN 1 ELSE 0 END) as sold,
    SUM(CASE WHEN status='available' THEN 1 ELSE 0 END) as available,
    SUM(CASE WHEN status='reserved' THEN 1 ELSE 0 END) as reserved,
    COALESCE(SUM(CASE WHEN status='sold' THEN total_price ELSE 0 END), 0) as sold_value
FROM block_units")->fetch(PDO::FETCH_ASSOC);

$totalUnits = $unitStats['total'] ?? 0;
$totalUnitsSold = $unitStats['sold'] ?? 0;
$totalUnitsAvailable = $unitStats['available'] ?? 0;
$totalUnitsReserved = $unitStats['reserved'] ?? 0;
$totalUnitSoldValue = $unitStats['sold_value'] ?? 0;

$totalUnitRevenue = $pdo->query("SELECT COALESCE(SUM(amount), 0) FROM pay_block_units")->fetchColumn();

// ========== 8. Block Type Stats (per block) ==========
$blockStats = [];
$blocksRes = $pdo->query("SELECT
    b.id,
    b.block_code,
    b.block_name,
    b.size,
    COUNT(u.id) as total,
    SUM(CASE WHEN u.status='sold' THEN 1 ELSE 0 END) as sold,
    SUM(CASE WHEN u.status='available' THEN 1 ELSE 0 END) as available,
    SUM(CASE WHEN u.status='reserved' THEN 1 ELSE 0 END) as reserved
FROM blocks b
LEFT JOIN block_units u ON u.block_id = b.id
GROUP BY b.id, b.block_code, b.block_name, b.size
ORDER BY b.block_code ASC");
while ($blk = $blocksRes->fetch(PDO::FETCH_ASSOC)) {
    $blockStats[] = $blk;
}

// ========== 9. Recent Block Unit Payments (last 10) ==========
$recentUnitPayments = [];
$unitPayStmt = $pdo->prepare("
    SELECT p.id, p.amount, p.payment_date, p.unit_id, p.customer_id,
           c.full_name,
           u.unit_code,
           b.block_code
    FROM pay_block_units p
    LEFT JOIN customers c ON p.customer_id = c.id
    LEFT JOIN block_units u ON p.unit_id = u.id
    LEFT JOIN blocks b ON u.block_id = b.id
    ORDER BY p.payment_date DESC
    LIMIT 10");
$unitPayStmt->execute();
while ($payRow = $unitPayStmt->fetch(PDO::FETCH_ASSOC)) {
    $recentUnitPayments[] = $payRow;
}
?>
<!-- Main content -->
<main class="main">

    <!-- Breadcrumb -->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Home</li>
        <li class="breadcrumb-item"><a href="#">Management</a></li>
        <li class="breadcrumb-item active">Dashboard</li>
        <li class="breadcrumb-menu">
            <div class="btn-group" role="group" aria-label="Button group with nested dropdown">
                <a class="btn btn-secondary" href="#"><i class="icon-speech"></i></a>
                <a class="btn btn-secondary" href="./"><i class="icon-graph"></i> &nbsp;Dashboard</a>
                <a class="btn btn-secondary" href="#"><i class="icon-settings"></i> &nbsp;Settings</a>
            </div>
        </li>
    </ol>

    <div class="container-fluid">
        <div class="animated fadeIn">
            
            <!-- ========== Top Stats Cards Row 1 ========== -->
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-primary">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalCustomers); ?></h4>
                            <p>Total Customers</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart1" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-info">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalPlots); ?></h4>
                            <p>Total Plots</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart2" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-success">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalAvailable); ?></h4>
                            <p>Available Plots</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart3" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-danger">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalSold); ?></h4>
                            <p>Sold Plots</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart4" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->
            </div>
            <!--/row-->

            <!-- ========== Top Stats Cards Row 2 ========== -->
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-warning">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalReserved); ?></h4>
                            <p>Reserved Plots</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart5" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-primary">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalRevenue); ?></h4>
                            <p>Total Received (AFN)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart6" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-info">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalSoldValue); ?></h4>
                            <p>Sold Plots Value (USD)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart7" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-success">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalPlots - $totalAvailable - $totalSold - $totalReserved); ?></h4>
                            <p>Other (Undefined)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart8" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->
            </div>
            <!--/row-->

            <!-- ========== Plot Type Stats Table ========== -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Plot Statistics by Type</strong>
                        </div>
                        <div class="card-block">
                            <table class="table table-bordered table-striped table-responsive">
                                <thead>
                                    <tr>
                                        <th>Plot Type</th>
                                        <th>Total</th>
                                        <th>Available</th>
                                        <th>Sold</th>
                                        <th>Reserved</th>
                                        <th style="width:200px;">Chart</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $colors = ['primary', 'info', 'warning', 'danger', 'success', 'secondary', 'dark', 'light']; ?>
                                    <?php $i = 0; ?>
                                    <?php foreach ($plotTypeStats as $type => $stats): ?>
                                    <tr>
                                        <td><strong>Plot <?php echo $type; ?></strong></td>
                                        <td><?php echo number_format($stats['total']); ?></td>
                                        <td class="text-success"><?php echo number_format($stats['available']); ?></td>
                                        <td class="text-danger"><?php echo number_format($stats['sold']); ?></td>
                                        <td class="text-warning"><?php echo number_format($stats['reserved']); ?></td>
                                        <td>
                                            <div class="progress" style="height:22px;">
                                                <?php 
                                                $total = $stats['total'] > 0 ? $stats['total'] : 1;
                                                $availPercent = round(($stats['available'] / $total) * 100);
                                                $soldPercent = round(($stats['sold'] / $total) * 100);
                                                $reservedPercent = round(($stats['reserved'] / $total) * 100);
                                                ?>
                                                <div class="progress-bar progress-bar-striped bg-success" style="width: <?php echo $availPercent; ?>%">Available <?php echo $availPercent; ?>%</div>
                                                <div class="progress-bar progress-bar-striped bg-danger" style="width: <?php echo $soldPercent; ?>%">Sold <?php echo $soldPercent; ?>%</div>
                                                <div class="progress-bar progress-bar-striped bg-warning" style="width: <?php echo $reservedPercent; ?>%">Reserved <?php echo $reservedPercent; ?>%</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php $i++; ?>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== Block / Apartment Stats Cards Row 1 ========== -->
            <div class="row mt-4">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-primary">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalBlocks); ?></h4>
                            <p>Total Blocks</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart9" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-info">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnits); ?></h4>
                            <p>Total Units (Apartments)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart10" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-success">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnitsAvailable); ?></h4>
                            <p>Available Units</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart11" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-danger">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnitsSold); ?></h4>
                            <p>Sold Units</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart12" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->
            </div>
            <!--/row-->

            <!-- ========== Block / Apartment Stats Cards Row 2 ========== -->
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-warning">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnitsReserved); ?></h4>
                            <p>Reserved Units</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart13" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-primary">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnitRevenue); ?></h4>
                            <p>Units Total Received (AFN)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart14" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-info">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnitSoldValue); ?></h4>
                            <p>Sold Units Value (USD)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart15" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->

                <div class="col-sm-6 col-lg-3">
                    <div class="card card-inverse card-success">
                        <div class="card-block p-b-0">
                            <h4 class="m-b-0"><?php echo number_format($totalUnits - $totalUnitsAvailable - $totalUnitsSold - $totalUnitsReserved); ?></h4>
                            <p>Other Units (Undefined)</p>
                        </div>
                        <div class="chart-wrapper p-x-1" style="height:70px;">
                            <canvas id="card-chart16" class="chart" height="70"></canvas>
                        </div>
                    </div>
                </div>
                <!--/col-->
            </div>
            <!--/row-->

            <!-- ========== Block Stats Table ========== -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Blocks &amp; Apartments Statistics</strong>
                        </div>
                        <div class="card-block">
                            <table class="table table-bordered table-striped table-responsive">
                                <thead>
                                    <tr>
                                        <th>Block</th>
                                        <th>Total Units</th>
                                        <th>Available</th>
                                        <th>Sold</th>
                                        <th>Reserved</th>
                                        <th style="width:200px;">Chart</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($blockStats as $blk): ?>
                                    <tr>
                                        <td>
                                            <strong><?php echo htmlspecialchars($blk['block_code']); ?></strong>
                                            <?php if (!empty($blk['block_name'])): ?> <small class="text-muted">(<?php echo htmlspecialchars($blk['block_name']); ?>)</small><?php endif; ?>
                                            <span class="badge badge-secondary"><?php echo number_format($blk['size']); ?> m²</span>
                                        </td>
                                        <td><?php echo number_format($blk['total']); ?></td>
                                        <td class="text-success"><?php echo number_format($blk['available']); ?></td>
                                        <td class="text-danger"><?php echo number_format($blk['sold']); ?></td>
                                        <td class="text-warning"><?php echo number_format($blk['reserved']); ?></td>
                                        <td>
                                            <div class="progress" style="height:22px;">
                                                <?php
                                                $total = $blk['total'] > 0 ? $blk['total'] : 1;
                                                $availPercent = round(($blk['available'] / $total) * 100);
                                                $soldPercent = round(($blk['sold'] / $total) * 100);
                                                $reservedPercent = round(($blk['reserved'] / $total) * 100);
                                                ?>
                                                <div class="progress-bar progress-bar-striped bg-success" style="width: <?php echo $availPercent; ?>%">Available <?php echo $availPercent; ?>%</div>
                                                <div class="progress-bar progress-bar-striped bg-danger" style="width: <?php echo $soldPercent; ?>%">Sold <?php echo $soldPercent; ?>%</div>
                                                <div class="progress-bar progress-bar-striped bg-warning" style="width: <?php echo $reservedPercent; ?>%">Reserved <?php echo $reservedPercent; ?>%</div>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== Recent Block Unit Payments ========== -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Recent Apartment / Unit Payments</strong>
                        </div>
                        <div class="card-block">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Customer</th>
                                        <th>Unit</th>
                                        <th>Block</th>
                                        <th>Amount (AFN)</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (count($recentUnitPayments) > 0): ?>
                                        <?php $mp = 1; ?>
                                        <?php foreach ($recentUnitPayments as $payment): ?>
                                        <tr>
                                            <td><?php echo $mp++; ?></td>
                                            <td><?php echo htmlspecialchars($payment['full_name'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($payment['unit_code'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($payment['block_code'] ?? 'N/A'); ?></td>
                                            <td><?php echo number_format($payment['amount']); ?></td>
                                            <td><?php echo date('Y-m-d H:i', strtotime($payment['payment_date'])); ?></td>
                                        </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr><td colspan="6" class="text-center">No payments recorded for apartments</td></tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== Recent Customers & Payments ========== -->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Recently Registered Customers</strong>
                        </div>
                        <div class="card-block">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Customer Name</th>
                                        <th>Phone</th>
                                        <th>Registered</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (count($recentCustomers) > 0): ?>
                                        <?php $j = 1; ?>
                                        <?php foreach ($recentCustomers as $customer): ?>
                                        <tr>
                                            <td><?php echo $j++; ?></td>
                                            <td><?php echo htmlspecialchars($customer['full_name']); ?></td>
                                            <td><?php echo htmlspecialchars($customer['phone']); ?></td>
                                            <td><?php echo date('Y-m-d H:i', strtotime($customer['created_at'])); ?></td>
                                        </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr><td colspan="4" class="text-center">No customers registered</td></tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Recent Payments</strong>
                        </div>
                        <div class="card-block">
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Customer</th>
                                        <th>Plot Type</th>
                                        <th>Amount (AFN)</th>
                                        <th>Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (count($recentPayments) > 0): ?>
                                        <?php $k = 1; ?>
                                        <?php foreach ($recentPayments as $payment): ?>
                                        <tr>
                                            <td><?php echo $k++; ?></td>
                                            <td><?php echo htmlspecialchars($payment['full_name'] ?? 'N/A'); ?></td>
                                            <td><?php echo htmlspecialchars($payment['plot_code'] ?? 'N/A'); ?> (<?php echo $payment['plot_type']; ?>)</td>
                                            <td><?php echo number_format($payment['amount']); ?></td>
                                            <td><?php echo date('Y-m-d H:i', strtotime($payment['payment_date'])); ?></td>
                                        </tr>
                                        <?php endforeach; ?>
                                    <?php else: ?>
                                        <tr><td colspan="5" class="text-center">No payments recorded</td></tr>
                                    <?php endif; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--/.container-fluid-->
</main>