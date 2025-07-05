<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | User Login</title>
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
            --honda-light: #ffffff;
            --honda-dark: #333333;
            --honda-gray: #f5f5f5;
        }

        body {
            font-family: 'Rubik', sans-serif;
            color: var(--honda-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('https://cdn.pixabay.com/photo/2021/01/06/19/44/honda-5895474_1280.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: -1;
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
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        .nav-link {
            color: white !important;
            font-weight: 500;
            margin: 0 10px;
            position: relative;
            padding: 8px 0 !important;
            letter-spacing: 0.5px;
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

        /* Login Section */
        .login-container {
            padding: 40px 0;
            margin-top: 70px;
            flex: 1;
            display: flex;
            align-items: flex-start;
        }

        .login-card {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            padding: 30px;
            width: 400px;
            margin-left: 50px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border: none;
            position: relative;
            overflow: hidden;
            border-top: 5px solid var(--honda-red);
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--honda-blue), var(--honda-red));
        }

        .login-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .login-header img {
            height: 50px;
            margin-bottom: 15px;
        }

        .login-header h1 {
            font-family: 'Rubik', sans-serif;
            color: var(--honda-dark);
            font-size: 2rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
            font-weight: 700;
        }

        .login-header h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: linear-gradient(to right, var(--honda-blue), var(--honda-red));
        }

        .login-header p {
            color: var(--honda-dark);
            font-size: 1rem;
            margin-top: 15px;
        }

        .form-control {
            border: 1px solid #ddd;
            padding: 10px 15px;
            border-radius: 4px;
            margin-bottom: 15px;
            background-color: var(--honda-gray);
            transition: all 0.3s;
            font-size: 0.9rem;
        }

        .form-control:focus {
            border-color: var(--honda-blue);
            box-shadow: 0 0 0 0.25rem rgba(0, 51, 153, 0.25);
        }

        .login-btn {
            background: linear-gradient(to right, var(--honda-blue), var(--honda-red));
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
            width: 100%;
            margin-top: 15px;
            border-radius: 4px;
            font-size: 0.9rem;
        }

        .login-btn:hover {
            background: linear-gradient(to right, #00257a, #c0041c);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .form-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            font-size: 0.85rem;
        }

        .forgot-password a,
        .register-link a {
            color: var(--honda-blue);
            text-decoration: none;
            transition: color 0.3s;
            font-weight: 500;
        }

        .forgot-password a:hover,
        .register-link a:hover {
            color: var(--honda-red);
            text-decoration: underline;
        }

        /* Footer Styles */
        footer {
            background-color: var(--honda-dark);
            color: white;
            border-top: 2px solid var(--honda-red);
            padding: 20px 0;
        }

        .footer-logo {
            margin-bottom: 15px;
        }

        .footer-logo img {
            height: 40px;
            filter: brightness(0) invert(1);
        }

        .footer-links a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--honda-red);
        }

        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.2rem;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: var(--honda-red);
        }

        .copyright {
            margin-top: 20px;
            font-size: 0.9rem;
            color: #aaa;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .login-container {
                padding: 30px 20px;
                margin-top: 60px;
                justify-content: center;
            }

            .login-card {
                width: 100%;
                margin-left: 0;
                padding: 25px;
            }

            .login-header h1 {
                font-size: 1.8rem;
            }

            .form-footer {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
        }

        #emailerror {
            color: var(--honda-red);
            font-size: 0.8rem;
            margin-top: 5px;
            display: block;
        }

        #header {
            display: block;
            text-align: center;
            margin-bottom: 15px;
            color: var(--honda-red);
            font-weight: 500;
            font-size: 0.9rem;
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

    <!-- Login Form -->
    <div class="login-container">
        <div class="container">
            <div class="login-card">
                <div class="login-header">
                    <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo">
                    <h1>Rider Login</h1>
                </div>
                <span id="header">${result}</span>
                <form action="userLogin" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" onChange="loginemail()" required placeholder="Enter Registered email">
                        <span id="emailerror"></span>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required placeholder="Enter Password">
                    </div>

                    <button type="submit" class="btn login-btn">Sign In</button>
                    <div class="form-footer">
                        <div class="forgot-password">
                            <a href="forgotPassword.jsp">Forgot Password?</a>
                        </div>
                        <div class="register-link">
                            <a href="register.jsp">Create Account</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <div class="footer-logo">
                <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo">
            </div>
            <div class="footer-links mb-3">
                <a href="#">About Us</a>
                <a href="#">Technology</a>
                <a href="#">Racing</a>
                <a href="#">Sustainability</a>
                <a href="#">Careers</a>
                <a href="#">Contact</a>
            </div>
            <div class="social-icons mb-3">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
            <p class="copyright mb-0">© 2025 Honda Motor Co., Ltd. All Rights Reserved. | <i class="fas fa-bolt" style="color: var(--honda-red);"></i> Powered by Dreams</p>
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

        function loginemail() {
            const email = document.getElementById('email').value;
            if (email !== "") {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8090/project_main/loginemail?email=" + email);
                xhttp.send();

                xhttp.onload = function() {
                    document.getElementById("emailerror").innerHTML = this.responseText;
                }
            }
        }
    </script>
</body>
</html>