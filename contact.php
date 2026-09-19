<?php include 'header.php'; ?>

<section class="page-banner">
    <div class="container">
        <h1><i class="bi bi-envelope me-2"></i>Contact Us</h1>
        <p class="mb-0">Get in touch with us</p>
    </div>
</section>

<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h4 class="fw-bold mb-4" style="color: #1a3a5c;">Send Message</h4>
                    <form action="" method="POST">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Full Name</label>
                                    <input type="text" name="name" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="form-label">Phone Number</label>
                                    <input type="text" name="phone" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">Subject</label>
                                    <input type="text" name="subject" class="form-control" required>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-label">Your Message</label>
                                    <textarea name="message" class="form-control" rows="5" required></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <button type="submit" name="send_message" class="btn btn-buy px-5">
                                    <i class="bi bi-send me-2"></i>Send Message
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
                        
                        $body = "<h2>New message from the website</h2>
                                <p><strong>Name:</strong> $name</p>
                                <p><strong>Phone:</strong> $phone</p>
                                <p><strong>Email:</strong> $email</p>
                                <p><strong>Subject:</strong> $subject</p>
                                <p><strong>Message:</strong><br>$message</p>";
                        
                        @mail($to, $subject, $body, $headers);
                        showToast("Your message was sent successfully! We will contact you soon.", "success");
                    }
                    ?>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-geo-alt me-2"></i>Address</h5>
                    <p class="text-muted mb-0"><span style="color: #ffc107;">Head Office:</span> Sherpur Main Road, House No. 27, Kabul - Afghanistan</p>
                    <p class="text-muted mb-0"><span style="color: #ffc107;">Field Office:</span> Dehsabz, District 19, Shahsabz, Kabul - Afghanistan</p>
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-telephone me-2"></i>Phone Numbers</h5>
                    <div class="row">
                        <div class="col-lg-4"><p class="text-muted mb-0">+93 074 501 6818</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">+93 078 588 4444</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">+93 070 853 0635</p></div>
                    </div>
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-envelope me-2"></i>Email</h5>
                    <div class="row">
                        <div class="col-lg-4"><p class="text-muted mb-0">info@kabulnewcity.com</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">properties@kabulnewcity.com</p></div>
                        <div class="col-lg-4"><p class="text-muted mb-0">invest@kabulnewcity.com</p></div>
                    </div>
                    
                    
                </div>
                <div class="card border-0 shadow-sm rounded-4 p-4">
                    <h5 class="fw-bold" style="color: #1a3a5c;"><i class="bi bi-clock me-2"></i>Working Hours</h5>
                    <p class="text-muted mb-0">Saturday - Thursday: 08:00 - 16:00</p>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>