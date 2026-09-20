
<?php
$kwAdminName = trim((string) ($_SESSION['admin_full_name'] ?? $_SESSION['admin_username'] ?? 'Administrator'));
$kwInitials = '';
foreach (preg_split('/\s+/', $kwAdminName) as $kwNamePart) {
    $kwInitials .= strtoupper(substr($kwNamePart, 0, 1));
    if (strlen($kwInitials) >= 2) break;
}
$kwInitials = $kwInitials ?: 'AD';
?>
<header class="navbar kw-header" role="banner">
    <div class="kw-header-inner">
        <div class="kw-header-left">
            <button class="kw-icon-btn kw-sidebar-toggle" type="button" aria-label="Toggle navigation" aria-expanded="true" title="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i></button>
            <a class="kw-brand" href="index.php" aria-label="KHAWAR DB dashboard">
                <span class="kw-brand-logo"><i class="fa fa-building-o" aria-hidden="true"></i></span>
                <span class="kw-brand-text"><strong>KHAWAR DB</strong><small>Property Management</small></span>
            </a>
            <a class="kw-btn-primary hidden-sm-down" href="customers.php"><i class="fa fa-plus" aria-hidden="true"></i> New Customer</a>
        </div>
        <div class="kw-header-right">
            <label class="kw-search hidden-sm-down" for="kwMenuSearch"><i class="fa fa-search" aria-hidden="true"></i><input id="kwMenuSearch" class="kw-search-input" type="search" autocomplete="off" placeholder="Search menu..."></label>
            <div class="kw-posrel">
                <button class="kw-icon-btn kw-notification-toggle" type="button" aria-label="Open quick links" aria-expanded="false" title="Quick links"><i class="fa fa-bell-o" aria-hidden="true"></i><span class="kw-badge">3</span></button>
                <div class="kw-popover kw-notification-menu" hidden>
                    <div class="kw-popover-heading">Quick links</div>
                    <a href="customers.php"><i class="fa fa-users"></i><span>Customer management</span></a>
                    <a href="plots_200.php"><i class="fa fa-map-o"></i><span>Residential plots</span></a>
                    <a href="block_units.php"><i class="fa fa-th-large"></i><span>Apartment units</span></a>
                </div>
            </div>
            <div class="kw-posrel">
                <button class="kw-user kw-user-toggle" type="button" aria-label="Open user menu" aria-expanded="false">
                    <span class="kw-avatar" aria-hidden="true"><?php echo htmlspecialchars($kwInitials); ?></span>
                    <span class="kw-user-info hidden-sm-down"><strong><?php echo htmlspecialchars($kwAdminName); ?></strong><small><?php echo htmlspecialchars(ucfirst((string) ($_SESSION['admin_role'] ?? 'Administrator'))); ?></small></span>
                    <i class="fa fa-caret-down hidden-sm-down" aria-hidden="true"></i>
                </button>
                <div class="kw-popover kw-user-menu" hidden>
                    <div class="kw-user-menu-top"><span class="kw-avatar kw-avatar-lg" aria-hidden="true"><?php echo htmlspecialchars($kwInitials); ?></span><span><strong><?php echo htmlspecialchars($kwAdminName); ?></strong><small><?php echo htmlspecialchars((string) ($_SESSION['admin_email'] ?? 'Administrator account')); ?></small></span></div>
                    <a href="index.php"><i class="fa fa-tachometer"></i><span>Dashboard</span></a>
                    <a class="kw-logout-link" href="logout.php"><i class="fa fa-sign-out"></i><span>Log out</span></a>
                </div>
            </div>
        </div>
    </div>
</header>