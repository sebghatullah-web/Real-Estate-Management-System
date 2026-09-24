<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = intval($_GET['id'] ?? 0);
$result = $conn->query("SELECT m.*, b.block_code FROM manazil m JOIN blocks b ON m.block_id = b.id WHERE m.id = $id");
$manzel = $result->fetch_assoc();

if (!$manzel) {
    header("Location: manazil.php");
    exit;
}

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == 'POST') {

    $block_id = intval($_POST['block_id'] ?? 0);
    $name     = trim($_POST['name'] ?? '');
    $code     = trim($_POST['code'] ?? '');
    $floors   = intval($_POST['floors_count'] ?? 1);
    $notes    = trim($_POST['notes'] ?? '');

    if ($floors < 1) $floors = 1;

    if ($block_id <= 0 || $name === '') {
        header("Location: edit_manzel.php?id=$id&error=invalid");
        exit;
    }

    $stmt = $conn->prepare("UPDATE manazil SET block_id=?, name=?, code=?, floors_count=?, notes=? WHERE id=?");
    $stmt->bind_param("issisi", $block_id, $name, $code, $floors, $notes, $id);
    $stmt->execute();
    $stmt->close();

    header("Location: manazil.php?block_id=$block_id&updated=1");
    exit;
}

$blocksResult = $conn->query("SELECT id, block_code FROM blocks ORDER BY block_code ASC");
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Manzel / Building</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/css/style.css" rel="stylesheet">
    <link href="style/css/admin-modern.css" rel="stylesheet">
</head>


<body class="navbar-fixed sidebar-nav fixed-nav">
    <?php require_once 'includes/header.php'; ?>
    <?php require_once 'includes/sidebar.php'; ?>

    <main class="main">

        <ol class="breadcrumb">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="blocks.php">Blocks</a></li>
            <li class="breadcrumb-item"><a href="manazil.php?block_id=<?= $manzel['block_id'] ?>">Buildings / Manazil</a></li>
            <li class="breadcrumb-item active">Edit Building</li>
        </ol>

        <div class="container-fluid">

            <?php if (isset($_GET['error']) && $_GET['error'] == 'invalid'): ?>
                <div class="alert alert-danger mt-3">Invalid input. Building name is required.</div>
            <?php endif; ?>

            <h2 class="mb-4">Edit Building: <?= htmlspecialchars($manzel['name']) ?> <small class="text-muted">(<?= htmlspecialchars($manzel['block_code']) ?>)</small></h2>

            <div class="card">
                <div class="card-body">
                    <form method="POST" class="row g-3">
                        <div class="col-md-3">
                            <label class="form-label">Block <span class="text-danger">*</span></label>
                            <select name="block_id" class="form-select" required>
                                <?php while ($b = $blocksResult->fetch_assoc()): ?>
                                <option value="<?= $b['id'] ?>" <?= $manzel['block_id'] == $b['id'] ? 'selected' : '' ?>><?= htmlspecialchars($b['block_code']) ?></option>
                                <?php endwhile; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Building Name <span class="text-danger">*</span></label>
                            <input type="text" name="name" class="form-control" value="<?= htmlspecialchars($manzel['name']) ?>" placeholder="e.g. منزل 1 / Building 1" required>
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Short Code</label>
                            <input type="text" name="code" class="form-control" value="<?= htmlspecialchars($manzel['code'] ?? '') ?>" placeholder="e.g. MZ1">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Floors Count</label>
                            <input type="number" name="floors_count" class="form-control" min="1" value="<?= htmlspecialchars($manzel['floors_count']) ?>">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Notes</label>
                            <input type="text" name="notes" class="form-control" value="<?= htmlspecialchars($manzel['notes'] ?? '') ?>">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                            <a href="manazil.php?block_id=<?= $manzel['block_id'] ?>" class="btn btn-secondary">Back</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--/.container-fluid-->
    </main>

    <?php require_once 'includes/footer.php'; ?>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap and necessary plugins -->
    <script src="style/js/libs/tether.min.js"></script>
    <script src="style/js/libs/bootstrap.min.js"></script>
    <script src="style/js/libs/pace.min.js"></script>
    <script src="style/js/libs/Chart.min.js"></script>
    <script src="style/js/app.js"></script>
    <script src="style/js/admin-modern.js"></script>
    <script src="style/js/views/main.js"></script>
    <script src="//localhost:35729/livereload.js"></script>
</body>

</html>