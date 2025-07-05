<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | Reset Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --honda-blue: #003399;
            --honda-red: #e40521;
            --honda-silver: #f5f5f5;
            --honda-dark: #333333;
            --honda-light: #ffffff;
            --honda-gray-bg: #2a2a2a;
        }

        body {
            font-family: 'Rubik', sans-serif;
            color: var(--honda-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background-color: var(--honda-silver);
            position: relative;
        }

        /* Navbar Styles */
        .navbar {
            background-color: var(--honda-dark) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
            transition: all 0.3s;
        }

        .navbar.scrolled {
            padding: 10px 0;
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            margin: 0 10px;
            position: relative;
            padding: 8px 0 !important;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--honda-red);
            transition: width 0.3s;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        /* Reset Password Section - Honda Theme */
        .reset-container {
            padding: 80px 0;
            margin-top: 70px;
            flex: 1;
            display: flex;
            align-items: center;
            background: linear-gradient(135deg, rgba(248,248,248,1) 0%, rgba(255,255,255,1) 100%);
        }

        .reset-card {
            background-color: white;
            border-radius: 8px;
            padding: 40px;
            max-width: 500px;
            width: 100%;
            margin: 0 auto;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.08);
            border: none;
            position: relative;
            overflow: hidden;
            border-top: 4px solid var(--honda-red);
        }

        .reset-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .reset-header img {
            height: 50px;
            margin-bottom: 15px;
        }

        .reset-header h1 {
            font-family: 'Rubik', sans-serif;
            color: var(--honda-dark);
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            font-weight: 700;
        }

        .reset-header p {
            color: var(--honda-gray-bg);
            font-size: 1rem;
            margin-top: 10px;
        }

        .form-control {
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
            border-radius: 4px;
            margin-bottom: 10px;
            background-color: white;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--honda-blue);
            box-shadow: 0 0 0 0.2rem rgba(0, 51, 153, 0.15);
        }

        .password-input {
            position: relative;
            margin-bottom: 5px;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 42px;
            cursor: pointer;
            color: var(--honda-gray-bg);
            opacity: 0.6;
            transition: all 0.3s;
            z-index: 2;
        }

        .password-toggle:hover {
            opacity: 1;
            color: var(--honda-red);
        }

        .reset-btn {
            background-color: var(--honda-red);
            color: white;
            border: none;
            padding: 12px 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
            border-radius: 4px;
        }

        .reset-btn:hover {
            background-color: #c0041c;
            transform: translateY(-2px);
        }

        .back-to-login {
            text-align: center;
            margin-top: 20px;
        }

        .back-to-login a {
            color: var(--honda-red);
            text-decoration: none;
            font-size: 0.9rem;
            transition: color 0.3s;
            font-weight: 500;
        }

        .back-to-login a:hover {
            color: var(--honda-blue);
            text-decoration: underline;
        }

        /* Password Requirements */
        .password-rules {
            background-color: rgba(248, 248, 248, 0.8);
            border-radius: 4px;
            padding: 10px 15px;
            margin-bottom: 15px;
            border-left: 3px solid var(--honda-blue);
        }

        .password-rules small {
            display: block;
            margin-bottom: 5px;
            color: var(--honda-gray-bg);
            font-weight: 500;
        }

        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 3px;
            font-size: 0.85rem;
        }

        .requirement i {
            margin-right: 8px;
            font-size: 0.8rem;
            width: 16px;
            text-align: center;
        }

        /* Password Status Message */
        .password-status {
            padding: 8px 12px;
            border-radius: 4px;
            margin: 5px 0 15px 0;
            font-weight: 500;
            font-size: 0.9rem;
            display: none;
        }

        .password-status.weak {
            background-color: #ffebee;
            color: #d32f2f;
            border-left: 3px solid #d32f2f;
            display: block;
        }

        .password-status.strong {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left: 3px solid #2e7d32;
            display: block;
        }

                footer {
            background-color: var(--honda-dark);
            color: var(--honda-light);
            border-top: 2px solid var(--honda-red);
            padding: 1.5rem 0;
            margin-top: auto;
        }

        .footer-content {
            position: relative;
            z-index: 1;
        }

        .footer-logo {
            height: 50px;
            margin-bottom: 1rem;
            filter: brightness(0) invert(1);
            transition: transform 0.3s;
        }

        .footer-logo:hover {
            transform: scale(1.05);
        }

        .footer-links {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 1.5rem;
            gap: 20px;
        }

        .footer-links a {
            color: #aaa;
            text-decoration: none;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
            position: relative;
            padding: 5px 0;
        }

        .footer-links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--honda-red);
            transition: width 0.3s;
        }

        .footer-links a:hover {
            color: var(--honda-light);
        }

        .footer-links a:hover::after {
            width: 100%;
        }

        .social-icons {
            margin-bottom: 1.5rem;
        }

        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            margin: 0 10px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-size: 1rem;
        }

        .social-icons a:hover {
            background-color: var(--honda-red);
            color: var(--honda-light);
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 5px 15px rgba(228, 5, 33, 0.4);
        }

        .copyright {
            color: #777;
            font-size: 0.9rem;
            margin-top: 1rem;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .reset-container {
                padding: 40px 20px;
                margin-top: 60px;
            }

            .reset-card {
                padding: 30px;
            }

            .reset-header h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">
            <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo" style="height: 45px;">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminLogin.jsp">Admin</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Reset Password Form -->
<div class="reset-container">
    <div class="container">
        <div class="reset-card">
            <div class="reset-header">
                <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo">
                <h1>Reset Your Password</h1>
            </div>
            <form action="updatepassword" method="post">
                <span>${result}</span>
                <input type="text" name="email" hidden value="${email}" />

                <!-- Password Requirements (moved above password field) -->
                <div class="password-rules">
                    <small>Password must contain:</small>
                    <div class="requirement">
                        <i class="fas fa-check-circle text-muted" id="lengthCheck"></i>
                        <small>At least 8 characters</small>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-check-circle text-muted" id="uppercaseCheck"></i>
                        <small>One uppercase letter</small>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-check-circle text-muted" id="numberCheck"></i>
                        <small>One number</small>
                    </div>
                    <div class="requirement">
                        <i class="fas fa-check-circle text-muted" id="specialCheck"></i>
                        <small>One special character</small>
                    </div>
                </div>

                <!-- Password Status Message -->
                <div id="passwordStatus" class="password-status"></div>

                <div class="mb-3 password-input">
                    <label for="password" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="password" name="password" required placeholder="Create new password">
                    <i class="far fa-eye-slash password-toggle" id="togglePassword"></i>
                </div>

                <div class="mb-3 password-input">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required placeholder="Re-enter your password">
                    <i class="far fa-eye-slash password-toggle" id="toggleConfirmPassword"></i>
                </div>

                <button type="submit" class="btn reset-btn" id="submitBtn" disabled>Update Now</button>
                <div class="back-to-login">
                    <a href="login.jsp"><i class="fas fa-arrow-left me-2"></i>Login with new password</a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
    <footer>
        <div class="container text-center footer-content">
            <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo" class="footer-logo">
            <div class="footer-links">
                <a href="#">About Honda</a>
                <a href="#">Technology</a>
                <a href="#">Racing</a>
                <a href="#">Sustainability</a>
                <a href="#">Careers</a>
                <a href="#">Contact Us</a>
            </div>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="copyright">© 2025 Honda Motor Co., Ltd. All Rights Reserved. | <i class="fas fa-bolt" style="color: var(--honda-red);"></i> Powered by Dreams</p>
        </div>
    </footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });

    // Password toggle visibility
    const togglePassword = document.querySelector('#togglePassword');
    const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
    const password = document.querySelector('#password');
    const confirmPassword = document.querySelector('#confirmPassword');
    const submitBtn = document.querySelector('#submitBtn');
    const passwordStatus = document.querySelector('#passwordStatus');

    // Initialize with eye-slash icon (password hidden)
    togglePassword.classList.add('fa-eye-slash');
    toggleConfirmPassword.classList.add('fa-eye-slash');

    togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);
        this.classList.toggle('fa-eye-slash');
        this.classList.toggle('fa-eye');
    });

    toggleConfirmPassword.addEventListener('click', function() {
        const type = confirmPassword.getAttribute('type') === 'password' ? 'text' : 'password';
        confirmPassword.setAttribute('type', type);
        this.classList.toggle('fa-eye-slash');
        this.classList.toggle('fa-eye');
    });

    // Password validation
    password.addEventListener('input', function() {
        const passwordValue = this.value;
        const hasLength = passwordValue.length >= 8;
        const hasUppercase = /[A-Z]/.test(passwordValue);
        const hasNumber = /[0-9]/.test(passwordValue);
        const hasSpecial = /[^A-Za-z0-9]/.test(passwordValue);

        // Update requirement checks with colors
        updateRequirement('lengthCheck', hasLength);
        updateRequirement('uppercaseCheck', hasUppercase);
        updateRequirement('numberCheck', hasNumber);
        updateRequirement('specialCheck', hasSpecial);

        // Update password status message
        updatePasswordStatus(hasLength, hasUppercase, hasNumber, hasSpecial);

        // Enable/disable submit button based on password match and strength
        checkPasswordsMatch();
    });

    confirmPassword.addEventListener('input', checkPasswordsMatch);

    function updateRequirement(id, isValid) {
        const icon = document.getElementById(id);
        if (isValid) {
            icon.classList.remove('text-muted', 'fa-times-circle', 'text-danger');
            icon.classList.add('fa-check-circle', 'text-success');
        } else {
            icon.classList.remove('text-muted', 'fa-check-circle', 'text-success');
            icon.classList.add('fa-times-circle', 'text-danger');
        }
    }

    function updatePasswordStatus(hasLength, hasUppercase, hasNumber, hasSpecial) {
        const allValid = hasLength && hasUppercase && hasNumber && hasSpecial;

        if (password.value.length === 0) {
            passwordStatus.style.display = 'none';
            passwordStatus.className = 'password-status';
            return;
        }

        if (allValid) {
            passwordStatus.textContent = '✓ Your password meets all requirements.';
            passwordStatus.className = 'password-status strong';
        } else {
            passwordStatus.textContent = 'Please ensure your password meets all the requirements above.';
            passwordStatus.className = 'password-status weak';
        }
    }

    function checkPasswordsMatch() {
        const passwordValid = password.value.length >= 8 &&
                            /[A-Z]/.test(password.value) &&
                            /[0-9]/.test(password.value) &&
                            /[^A-Za-z0-9]/.test(password.value);

        const passwordsMatch = password.value &&
                             confirmPassword.value &&
                             password.value === confirmPassword.value;

        submitBtn.disabled = !(passwordValid && passwordsMatch);

        // Visual feedback for password match
        if (confirmPassword.value.length > 0) {
            if (passwordsMatch && passwordValid) {
                confirmPassword.style.borderColor = '#2e7d32';
            } else {
                confirmPassword.style.borderColor = '#d32f2f';
            }
        } else {
            confirmPassword.style.borderColor = '#e0e0e0';
        }
    }
</script>
</body>
</html>