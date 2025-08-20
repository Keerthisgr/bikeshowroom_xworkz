<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - View Branches</title>
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
            background-color: var(--honda-silver);
            color: var(--honda-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: rgba(42, 42, 42, 0.95) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        .navbar.scrolled {
            padding: 8px 0;
            background-color: rgba(42, 42, 42, 0.98) !important;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
        }

        .navbar-brand img {
            height: 45px;
            transition: all 0.3s;
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

        /* Card Styles */
        .branch-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            overflow: hidden;
            transition: transform 0.3s;
            border-left: 4px solid var(--honda-blue);
        }

        .branch-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .branch-card-header {
            background-color: var(--honda-blue);
            color: white;
            padding: 15px;
            font-weight: 600;
        }

        .branch-card-body {
            padding: 20px;
        }

        /* Image Display */
        .branch-image-container {
            position: relative;
            margin-bottom: 15px;
            border-radius: 8px;
            overflow: hidden;
            height: 200px;
        }

        .branch-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .branch-image:hover {
            transform: scale(1.05);
        }

        /* Branch Details */
        .branch-details {
            margin-top: 15px;
        }

        .branch-detail {
            display: flex;
            margin-bottom: 8px;
        }

        .branch-detail-label {
            font-weight: 600;
            min-width: 100px;
            color: var(--honda-blue);
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .bg-success { background-color: #28a745 !important; }
        .bg-secondary { background-color: #6c757d !important; }
        .bg-warning { background-color: #ffc107 !important; color: #212529; }

        /* Footer Styles */
        footer {
            background-color: var(--honda-dark);
            color: var(--honda-light);
            border-top: 2px solid var(--honda-red);
            padding: 3rem 0;
            margin-top: auto;
        }

        .footer-content {
            position: relative;
            z-index: 1;
        }

        .footer-logo {
            height: 60px;
            margin-bottom: 2rem;
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
            margin-bottom: 2.5rem;
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
            margin-bottom: 2.5rem;
        }

        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            margin: 0 10px;
            transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            font-size: 1.1rem;
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
            margin-top: 2rem;
        }

        .main-content {
            padding-top: 80px;
            padding-bottom: 40px;
            flex: 1;
        }

        .page-title {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-blue);
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 2rem;
            position: relative;
        }

        .page-title::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 4px;
            bottom: -10px;
            left: 0;
            background: linear-gradient(90deg, var(--honda-blue), var(--honda-red));
            border-radius: 2px;
        }

        /* Additional styles for the new functionality */
        .basic-details {
            display: block;
        }

        .full-details {
            display: none;
        }

        .view-details-btn {
            margin-top: 15px;
            width: 100%;
            background-color: var(--honda-blue);
            border: none;
        }

        .view-details-btn:hover {
            background-color: var(--honda-red);
        }

        .detail-icon {
            margin-right: 8px;
            color: var(--honda-blue);
            width: 20px;
            text-align: center;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .branch-image-container {
                height: 150px;
            }

            .branch-detail {
                flex-direction: column;
            }

            .branch-detail-label {
                margin-bottom: 3px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
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
                        <a class="nav-link" href="aboutUs.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userlogin.jsp">User login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="view-branches.jsp">View Branches</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2 class="page-title"><i class="fas fa-map-marker-alt me-2"></i>All Branches</h2>

            <div class="row">
                <c:forEach items="${showroomlist}" var="branch">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="branch-card">
                            <div class="branch-card-header">
                                ${branch.branchName}
                            </div>
                            <div class="branch-card-body">
                                <div class="branch-image-container">
                                    <img src="getbranchimage?image=${branch.branchImage}" alt="Branch Image" class="branch-image">
                                </div>

                                <!-- Basic Details (always visible) -->
                                <div class="basic-details">
                                    <div class="branch-detail">
                                        <span class="detail-icon"><i class="fas fa-map-marker-alt"></i></span>
                                        <span>${branch.location}</span>
                                    </div>
                                    <div class="branch-detail">
                                        <span class="detail-icon"><i class="fas fa-phone"></i></span>
                                        <span>${branch.number}</span>
                                    </div>
                                    <div class="branch-detail">
                                        <span class="detail-icon"><i class="fas fa-envelope"></i></span>
                                        <span>${branch.email}</span>
                                    </div>
                                    <button class="btn btn-primary view-details-btn" onclick="toggleDetails(this)">
                                        <i class="fas fa-eye me-2"></i>View Details
                                    </button>
                                </div>

                                <!-- Full Details (hidden by default) -->
                                <div class="full-details">
                                    <div class="branch-details">
                                        <div class="branch-detail">
                                            <span class="branch-detail-label">Manager:</span>
                                            <span>${branch.managerName}</span>
                                        </div>

                                        <div class="branch-detail">
                                            <span class="branch-detail-label">Address:</span>
                                            <span>${branch.location}</span>
                                        </div>
                                        <div class="branch-detail">
                                            <span class="branch-detail-label">Contact:</span>
                                            <span>${branch.number}</span>
                                        </div>
                                        <div class="branch-detail">
                                            <span class="branch-detail-label">Email:</span>
                                            <span>${branch.email}</span>
                                        </div>
                                        <div class="branch-detail">
                                            <span class="branch-detail-label">Status:</span>
                                            <span class="status-badge ${branch.status == 'active' ? 'bg-success' : branch.status == 'inactive' ? 'bg-secondary' : 'bg-warning'}">
                                                ${branch.status}
                                            </span>
                                        </div>
                                    </div>
                                    <button class="btn btn-secondary view-details-btn" onclick="toggleDetails(this)">
                                        <i class="fas fa-eye-slash me-2"></i>Hide Details
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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

        // Toggle branch details visibility
        function toggleDetails(button) {
            const cardBody = button.closest('.branch-card-body');
            const basicDetails = cardBody.querySelector('.basic-details');
            const fullDetails = cardBody.querySelector('.full-details');

            if (basicDetails.style.display !== 'none') {
                basicDetails.style.display = 'none';
                fullDetails.style.display = 'block';
            } else {
                basicDetails.style.display = 'block';
                fullDetails.style.display = 'none';
            }
        }
    </script>
</body>
</html>