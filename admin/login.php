<?php
session_start();
require_once __DIR__ . '/../config/db.php';

// If already logged in, redirect to dashboard
if (isset($_SESSION['admin_logged_in']) && $_SESSION['admin_logged_in'] === true) {
    header('Location: index.php');
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if (empty($username) || empty($password)) {
        $error = 'لطفا نام کاربری و رمز عبور را وارد کنید';
    } else {
        try {
            $stmt = $pdo->prepare("SELECT * FROM admins WHERE username = :username LIMIT 1");
            $stmt->execute(['username' => $username]);
            $admin = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($admin && password_verify($password, $admin['password'])) {
                // Login successful
                $_SESSION['admin_logged_in'] = true;
                $_SESSION['admin_id'] = $admin['id'];
                $_SESSION['admin_username'] = $admin['username'];
                $_SESSION['admin_full_name'] = $admin['full_name'];
                $_SESSION['admin_role'] = $admin['role'];
                $_SESSION['admin_email'] = $admin['email'];

                header('Location: index.php');
                exit;
            } else {
                $error = 'نام کاربری یا رمز عبور اشتباه است';
            }
        } catch (PDOException $e) {
            // Check if admins table doesn't exist yet
            if ($e->getCode() == '42S02') {
                $error = 'جدول مدیران وجود ندارد. لطفا ابتدا ثبت نام کنید.';
            } else {
                $error = 'خطا در اتصال به دیتابیس: ' . $e->getMessage();
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>ورود به سیستم - KHAWAR DB</title>
    <link href="style/css/font-awesome.min.css" rel="stylesheet">
    <link href="style/css/simple-line-icons.css" rel="stylesheet">
    <link href="style/dest/style.css" rel="stylesheet">
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
        .login-box {
            max-width: 420px;
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
            background: linear-gradient(135deg, #20a8d8, #1c8eb8);
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
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: 600;
            font-size: 13px;
            color: #555;
            margin-bottom: 6px;
            display: block;
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
            border-color: #20a8d8;
            box-shadow: 0 0 0 3px rgba(32, 168, 216, 0.15);
        }
        .btn-login {
            background: linear-gradient(135deg, #20a8d8, #1c8eb8);
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
        .btn-login:hover {
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
        .register-link {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #777;
        }
        .register-link a {
            color: #20a8d8;
            text-decoration: none;
            font-weight: 600;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        .brand-logo {
            font-size: 40px;
            margin-bottom: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <div class="card">
            <div class="card-header">
                <span class="brand-logo"><i class="icon-screen-desktop"></i></span>
                <h3>KHAWAR DB</h3>
                <p>به پنل مدیریت خوش آمدید</p>
            </div>
            <div class="card-body">
                <?php if ($error): ?>
                    <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
                <?php endif; ?>

                <form method="POST" action="">
                    <div class="form-group">
                        <label for="username"><i class="icon-user"></i> نام کاربری</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="نام کاربری خود را وارد کنید" required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="icon-lock"></i> رمز عبور</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="رمز عبور خود را وارد کنید" required>
                    </div>
                    <button type="submit" class="btn-login">
                        <i class="icon-login"></i> ورود به سیستم
                    </button>
                </form>

                <div class="register-link">
                    حساب کاربری ندارید؟ <a href="register.php">ثبت نام کنید</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>