<?php require_once __DIR__ . '/includes/auth_check.php'; ?>
<?php
include 'config/db.php';

$id = $_GET['id'] ?? null;
if (!$id) {
    header("Location: plots_510.php");
    exit;
}

// Get plot info
$stmt = $conn->prepare("SELECT * FROM plots_510 WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$plot = $stmt->get_result()->fetch_assoc();

if (!$plot) {
    die("Plot not found.");
}

// Do not allow sale if the plot is sold or reserved
if ($plot['status'] != 'available') {
    echo "<div class='alert alert-danger m-3'>
            This plot is already sold or reserved and cannot be sold!
          </div>
          <a href='plots_510.php' class='btn btn-primary m-3'>Back</a>";
    exit;
}

// Get the customer list
$customers = $conn->query("SELECT id, full_name, fathar_name, national_id FROM customers ORDER BY full_name ASC")->fetch_all(MYSQLI_ASSOC);

// Register the sale
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['sell_plot'])) {
    $customer_id = $_POST['customer_id'];

    // Check that the customer exists
    $check = $conn->prepare("SELECT id FROM customers WHERE id=?");
    $check->bind_param("i", $customer_id);
    $check->execute();
    $exists = $check->get_result()->num_rows > 0;

    if ($exists) {
        $update = $conn->prepare("UPDATE plots_510 SET status='sold', customer_id=? WHERE id=?");
        $update->bind_param("ii", $customer_id, $id);
        $update->execute();
        header("Location: plots_510.php");
        exit;
    } else {
        echo "<div class='alert alert-danger'>Selected customer is not valid!</div>";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Sell Plot</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Select2 for searching the customer list -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/js/select2.min.js"></script>
</head>
<body class="container mt-4" style="font-family: 'Inter', 'Segoe UI', Tahoma, Arial, sans-serif;">
  <h2 class="mb-4">Sell Plot (<?= htmlspecialchars($plot['plot_code']) ?>)</h2>
  <div class="card shadow-sm">
    <div class="card-body">
      <form method="post">
        <div class="mb-3">
          <label class="form-label">Select Customer</label>
          <select name="customer_id" class="form-select select2" required>
            <option value="">Select...</option>
            <?php foreach ($customers as $c): ?>
              <option value="<?= $c['id'] ?>">
                <?= htmlspecialchars($c['full_name']) ?> - 
                <?= htmlspecialchars($c['fathar_name']) ?> - 
                <?= htmlspecialchars($c['national_id']) ?>
              </option>
            <?php endforeach; ?>
          </select>
        </div>
        <button type="submit" name="sell_plot" class="btn btn-success">Confirm Sale</button>
        <a href="plots_200.php" class="btn btn-secondary">Back</a>
      </form>
    </div>
  </div>

  <script>
    $(document).ready(function() {
      $('.select2').select2({
        placeholder: "Search customer...",
        allowClear: true
      });
    });
  </script>
</body>
</html>
