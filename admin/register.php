<?php
session_start();
require_once __DIR__ . '/../config/db.php';

// If already logged in, redirect to dashboard
if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true) {
    header('Location: index.php');
    exit;
}

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username      = trim($_POST['username'] ?? '');
    $password      = $_POST['password'] ?? '';
    $confirm_pass  = $_POST['confirm_password'] ?? '';
    $full_name     = trim($_POST['full_name'] ?? '');
    $email         = trim($_POST['email'] ?? '');
    $phone         = trim($_POST['phone'] ?? '');
    $national_id   = trim($_POST['national_id'] ?? '');

    // Validation
    if (empty($username) || empty($password) || empty($full_name) || empty($email)) {
        $error = 'Please fill in all required fields';
    } elseif ($password !== $confirm_pass) {
        $error = 'Passwords do not match';
    } elseif (strlen($password) < 6) {
        $error = 'Password must be at least 6 characters';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'Please enter a valid email';
    } else {
        try {
            // Check if username already exists
            $check = $pdo->prepare("SELECT id FROM admins WHERE username = :username OR email = :email LIMIT 1");
            $check->execute(['username' => $username, 'email' => $email]);

            if ($check->fetch()) {
                $error = 'Username or email already registered';
            } else {
                // Hash password and insert
                $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

                $stmt = $pdo->prepare("
                    INSERT INTO admins (username, password, full_name, email, phone, national_id) 
                    VALUES (:username, :password, :full_name, :email, :phone, :national_id)
                ");
                $stmt->execute([
                    'username'    => $username,
                    'password'    => $hashedPassword,
                    'full_name'   => $full_name,
                    'email'       => $email,
                    'phone'       => $phone ?: null,
                    'national_id' => $national_id ?: null,
                ]);

                $success = 'Account created successfully. You can now log in.';
            }
        } catch (PDOException $e) {
            if ($e->getCode() == '42S02') {
                $error = 'Admins table does not exist. Please create the admins table first.';
            } else {
                $error = 'Error: ' . $e->getMessage();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register - KHAWAR DB</title>
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/css/style.css" rel="stylesheet">
    <style>
        body {
            background: #2a2a2a;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }
        .register-box {
            max-width: 520px;
            width: 100%;
            margin: auto;
        }
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .card-header {
            background: linear-gradient(135deg, #4dbd74, #3aa15a);
            color: white;
            text-align: center;
            padding: 25px 20px;
            border-bottom: none;
        }
        .card-header h3 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
        }
        .card-header p {
            margin: 8px 0 0;
            opacity: 0.85;
            font-size: 13px;
        }
        .card-body {
            padding: 30px;
            background: #fff;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            font-weight: 600;
            font-size: 13px;
            color: #555;
            margin-bottom: 6px;
            display: block;
        }
        .form-group .required::after {
            content: ' *';
            color: #e74c3c;
        }
        .form-control {
            border-radius: 6px;
            border: 1px solid #d1d3d7;
            padding: 10px 14px;
            font-size: 14px;
            height: auto;
            transition: border-color 0.2s;
        }
        .form-control:focus {
            border-color: #4dbd74;
            box-shadow: 0 0 0 3px rgba(77, 189, 116, 0.15);
        }
        .btn-register {
            background: linear-gradient(135deg, #4dbd74, #3aa15a);
            border: none;
            border-radius: 6px;
            padding: 12px;
            font-size: 15px;
            font-weight: 600;
            color: white;
            width: 100%;
            cursor: pointer;
            transition: opacity 0.2s;
        }
        .btn-register:hover {
            opacity: 0.9;
        }
        .alert {
            border-radius: 6px;
            padding: 12px 16px;
            margin-bottom: 20px;
            font-size: 13px;
        }
        .alert-danger {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #777;
        }
        .login-link a {
            color: #4dbd74;
            text-decoration: none;
            font-weight: 600;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
        .brand-logo {
            font-size: 40px;
            margin-bottom: 10px;
            display: block;
        }
        .row-tight {
            display: flex;
            gap: 15px;
        }
        .row-tight .form-group {
            flex: 1;
        }
        @media (max-width: 500px) {
            .row-tight {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
    <div class="register-box">
        <div class="card">
            <div class="card-header">
                <span class="brand-logo"><i class="icon-user-follow"></i></span>
                <h3>Admin Registration</h3>
                <p>Create a new admin account</p>
            </div>
            <div class="card-body">
                <?php if ($error): ?>
                    <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>

                <?php if ($success): ?>
                    <div class="alert alert-success">
                        <?php echo htmlspecialchars($success); ?>
                        <br><a href="login.php" style="font-weight:600;color:#155724;">Login</a>
                    </div>
                <?php endif; ?>

                <form method="POST" action="">
                    <div class="form-group">
                        <label for="username" class="required"><i class="icon-user"></i> Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Choose a username" value="<?php echo htmlspecialchars($_POST['username'] ?? ''); ?>" required>
                    </div>

                    <div class="row-tight">
                        <div class="form-group">
                            <label for="password" class="required"><i class="icon-lock"></i> Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Minimum 6 characters" required>
                        </div>
                        <div class="form-group">
                            <label for="confirm_password" class="required"><i class="icon-lock"></i> Confirm Password</label>
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Re-enter password" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="full_name" class="required"><i class="icon-people"></i> Full Name</label>
                        <input type="text" class="form-control" id="full_name" name="full_name" placeholder="Full name" value="<?php echo htmlspecialchars($_POST['full_name'] ?? ''); ?>" required>
                    </div>

                    <div class="form-group">
                        <label for="email" class="required"><i class="icon-envelope"></i> Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="example@domain.com" value="<?php echo htmlspecialchars($_POST['email'] ?? ''); ?>" required>
                    </div>

                    <div class="row-tight">
                        <div class="form-group">
                            <label for="phone"><i class="icon-phone"></i> Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Optional" value="<?php echo htmlspecialchars($_POST['phone'] ?? ''); ?>">
                        </div>
                        <div class="form-group">
                            <label for="national_id"><i class="icon-doc"></i> National ID</label>
                            <input type="text" class="form-control" id="national_id" name="national_id" placeholder="Optional" value="<?php echo htmlspecialchars($_POST['national_id'] ?? ''); ?>">
                        </div>
                    </div>

                    <button type="submit" class="btn-register">
                        <i class="icon-check"></i> Register
                    </button>
                </form>

                <div class="login-link">
                    Already registered? <a href="login.php">Login</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>