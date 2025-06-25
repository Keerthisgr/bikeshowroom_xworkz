<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | Admin Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500;700&family=Kanit:wght@700;800&display=swap" rel="stylesheet">
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
            background: linear-gradient(rgba(42, 42, 42, 0.95), rgba(42, 42, 42, 0.95)),
                        url('https://images.unsplash.com/photo-1558980394-4c7c9299fe96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--honda-light);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 70px;
        }

        .navbar {
            background-color: rgba(42, 42, 42, 0.95) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
        }

        .navbar-brand img {
            height: 45px;
        }

        .nav-link {
            color: var(--honda-light) !important;
            font-weight: 500;
            margin: 0 12px;
            position: relative;
            padding: 8px 0 !important;
            letter-spacing: 0.5px;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            width: 0;
            height: 3px;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background-color: var(--honda-red);
            transition: width 0.3s, height 0.3s;
        }

        .nav-link:hover::before,
        .nav-link.active::before {
            width: 100%;
            height: 3px;
        }

        .login-container {
            background-color: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            padding: 40px;
            max-width: 500px;
            margin: 50px auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            border-top: 3px solid var(--honda-blue);
            border-bottom: 3px solid var(--honda-red);
            backdrop-filter: blur(10px);
        }

        .login-title {
            color: var(--honda-light);
            font-family: 'Kanit', sans-serif;
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
            position: relative;
            padding-bottom: 15px;
        }

        .login-title::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 4px;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(90deg, var(--honda-blue), var(--honda-red));
            border-radius: 2px;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: var(--honda-light);
            padding: 12px 15px;
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: var(--honda-blue);
            color: var(--honda-light);
            box-shadow: 0 0 0 0.25rem rgba(0, 51, 153, 0.25);
        }

        .form-label {
            color: var(--honda-light);
            font-weight: 500;
            margin-bottom: 8px;
        }

        .btn-login {
            background: linear-gradient(135deg, var(--honda-blue), var(--honda-red));
            color: var(--honda-light);
            font-weight: 600;
            padding: 12px 30px;
            border: none;
            border-radius: 30px;
            width: 100%;
            margin-top: 10px;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, var(--honda-red), var(--honda-blue));
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        .btn-otp {
            background: linear-gradient(135deg, #00a86b, #007a4d);
            color: var(--honda-light);
            font-weight: 600;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-otp:hover {
            background: linear-gradient(135deg, #007a4d, #00a86b);
            transform: translateY(-2px);
        }

        .btn-verify {
            background: linear-gradient(135deg, var(--honda-blue), #0044cc);
            color: var(--honda-light);
            font-weight: 600;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 15px;
        }

        .btn-verify:hover {
            background: linear-gradient(135deg, #0044cc, var(--honda-blue));
            transform: translateY(-2px);
        }

        .otp-container {
            display: none;
            margin-top: 20px;
        }

        .otp-timer {
            color: var(--honda-red);
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

        .resend-otp {
            color: #aaa;
            text-align: center;
            display: block;
            margin-top: 15px;
            cursor: pointer;
            transition: all 0.3s;
            display: none;
        }

        .resend-otp:hover {
            color: var(--honda-blue);
            text-decoration: underline;
        }

        .error-message {
            color: #ff6b6b;
            font-size: 14px;
            margin-top: 5px;
            text-align: center;
        }

        .success-message {
            color: #00a86b;
            font-size: 14px;
            margin-top: 5px;
            text-align: center;
        }

        .result-message {
            color: var(--honda-light);
            background-color: var(--honda-red);
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 500;
        }

        .admin-icon {
            font-size: 2.5rem;
            color: var(--honda-blue);
            margin-bottom: 20px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .login-container {
                padding: 30px 20px;
                margin: 30px auto;
            }

            .login-title {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo">
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
                        <a class="nav-link active" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="login-container">
            <div class="admin-icon">
                <i class="fas fa-user-shield"></i>
            </div>
            <h1 class="login-title">ADMIN LOGIN</h1>

            <c:if test="${not empty result}">
                <div class="result-message">${result}</div>
            </c:if>

            <form id="loginForm" action="adminLogin" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Admin Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter registered admin email" required>
                    <div id="emailError" class="error-message"></div>
                </div>

                <button type="button" id="getOtpBtn" class="btn btn-otp" onclick="otp()">Get OTP</button>

                <div id="otpContainer" class="otp-container">
                    <div class="mb-3">
                        <label for="otp" class="form-label">Enter OTP</label>
                        <input type="text" class="form-control" id="otp" name="otp" placeholder="Enter 6-digit OTP" maxlength="6" required disabled>
                        <div id="otpError" class="error-message"></div>
                        <div id="otpSuccess" class="success-message"></div>
                        <div id="otpTimer" class="otp-timer"></div>
                        <span id="resendOtp" class="resend-otp">Resend OTP</span>
                    </div>

                    <button type="submit" id="verifyBtn" class="btn btn-verify" disabled>Verify & Login</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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

        // OTP functionality
        let otpTimer;
        let timeLeft = 120;

        function getOtp() {
            const email = document.getElementById('email').value;
            const emailError = document.getElementById('emailError');

            if (!email || !email.includes('@') || !email.includes('.')) {
                emailError.textContent = 'Please enter a valid email address';
                return;
            }

            emailError.textContent = '';
            sendotp();

            document.getElementById('otpSuccess').textContent = 'OTP sent to your email';
            document.getElementById('otpContainer').style.display = 'block';
            document.getElementById('otp').disabled = false;
            document.getElementById('verifyBtn').disabled = false;
            document.getElementById('getOtpBtn').disabled = true;

            startOtpTimer();
        }

        function sendotp() {
            const email = document.getElementById('email').value;
            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/bikeshowroom_xworkz/email?email=" + email, true);
            xhttp.send();
            xhttp.onload = function() {
                document.getElementById("emailError").innerHTML = this.responseText;
            }
        }

        document.getElementById('resendOtp').addEventListener('click', function() {
            clearInterval(otpTimer);
            sendotp();
            timeLeft = 120;
            document.getElementById('otpSuccess').textContent = 'New OTP sent to your email';
            document.getElementById('resendOtp').style.display = 'none';
            startOtpTimer();
        });

        function startOtpTimer() {
            updateOtpTimerDisplay();
            otpTimer = setInterval(updateOtpTimer, 1000);
        }

        function updateOtpTimer() {
            timeLeft--;
            updateOtpTimerDisplay();

            if (timeLeft <= 0) {
                clearInterval(otpTimer);
                document.getElementById('otpTimer').textContent = 'OTP expired!';
                document.getElementById('verifyBtn').disabled = true;
                document.getElementById('resendOtp').style.display = 'block';
                document.getElementById('otpSuccess').textContent = '';
            }
        }

        function updateOtpTimerDisplay() {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            document.getElementById('otpTimer').textContent =
                `OTP valid for: ${minutes}:${seconds < 10 ? '0' + seconds : seconds}`;
        }

        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const otp = document.getElementById('otp').value;
            const otpError = document.getElementById('otpError');

            if (!otp || otp.length !== 6 || isNaN(otp)) {
                e.preventDefault();
                otpError.textContent = 'Please enter a valid 6-digit OTP';
                return;
            }
        });

        // Update the button to use the new function
        document.getElementById('getOtpBtn').addEventListener('click', getOtp);
    </script>
</body>
</html>