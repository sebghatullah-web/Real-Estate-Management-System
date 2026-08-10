<?php include 'header.php'; ?>

<section class="page-banner">
    <div class="container">
        <h1><i class="bi bi-envelope me-2"></i>تماس با ما</h1>
        <p class="mb-0">با ما در ارتباط باشید</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4" style="color: #1a3a5c;">ارسال پیام</h4>
                    <form action="" method="POST">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">نام کامل</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">شماره تماس</label>
                                    <input type="text" name="phone" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">ایمیل</label>
                                    <input type="email" name="email" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">موضوع</label>
                                    <input type="text" name="subject" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">پیام شما</label>
                                    <textarea name="message" class="form-control" rows="5" required></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <button type="submit" name="send_message" class="btn btn-buy px-5">
                                    <i class="bi bi-send me-2"></i>ارسال پیام
                                </button>
                            </div>
                        </div>
                    </form>
                    <?php
                    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['send_message'])) {
                        $name = $_POST['name'];
                        $phone = $_POST['phone'];
                        $email = $_POST['email'] ?? '';
                        $subject = $_POST['subject'];
                        $message = $_POST['message'];
                        
                        $to = "info@khawardb.com";
                        $headers = "From: $email\r\n";
                        $headers .= "Reply-To: $email\r\n";
                        $headers .= "MIME-Version: 1.0\r\n";
                        $headers .= "Content-Type: text/html; charset=UTF-8\r\n";
                        
                        $body = "<h2>پیام جدید از وبسایت</h2>
                                <p><strong>نام:</strong> $name</p>
                                <p><strong>شماره تماس:</strong> $phone</p>
                                <p><strong>ایمیل:</strong> $email</p>
                                <p><strong>موضوع:</strong> $subject</p>
                                <p><strong>پیام:</strong><br>$message</p>";
                        
                        @mail($to, $subject, $body, $headers);
                        showToast("پیام شما با موفقیت ارسال شد! با شما تماس خواهیم گرفت.", "success");
                    }
                    ?>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-geo-alt me-2"></i>آدرس</h5>
                    <p class="text-muted mb-0"><span style="color: #ffc107;">دفتر مرکزی:</span> سرک عمومی شیرپور، خانه نمبر 27، کابل-افغانستان</p>
                    <p class="text-muted mb-0"><span style="color: #ffc107;">دفتر ساحوی:</span> ده سبز، ناحیه 19، شهرسبز، کابل-افغانستان</p>
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-telephone me-2"></i>شماره تماس</h5>
                    <div class="row">
                        <div class="col-lg-4"><p class="text-muted mb-0">8168 501 074 93+</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">4444 588 078 93+</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">0635 853 070 93+</p></div>
                    </div>
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-envelope me-2"></i>ایمیل</h5>
                    <div class="row">
                        <div class="col-lg-4"><p class="text-muted mb-0">info@kabulnewcity.com</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">properties@kabulnewcity.com</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">invest@kabulnewcity.com</p></div>
                    </div>
                    
                    
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-clock me-2"></i>ساعت کاری</h5>
                    <p class="text-muted mb-0">شنبه - پنجشنبه: 08:00 - 04:00</p>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>