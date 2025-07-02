<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - View Bikes</title>
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
        .bike-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            overflow: hidden;
            transition: transform 0.3s;
            border-left: 4px solid var(--honda-blue);
        }

        .bike-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .bike-card-header {
            background-color: var(--honda-blue);
            color: white;
            padding: 15px;
            font-weight: 600;
        }

        .bike-card-body {
            padding: 20px;
        }

        /* Image Slider Styles */
        .bike-slider {
            position: relative;
            margin-bottom: 15px;
            border-radius: 8px;
            overflow: hidden;
            height: 200px;
        }

        .bike-slider-container {
            display: flex;
            transition: transform 0.5s ease;
            height: 100%;
        }

        .bike-slide {
            min-width: 100%;
            height: 100%;
        }

        .bike-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slider-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0,0,0,0.5);
            color: white;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s;
        }

        .slider-arrow:hover {
            background: rgba(0,0,0,0.8);
        }

        .slider-arrow.left {
            left: 10px;
        }

        .slider-arrow.right {
            right: 10px;
        }

        .slider-dots {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .slider-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: #ccc;
            margin: 0 5px;
            cursor: pointer;
        }

        .slider-dot.active {
            background: var(--honda-blue);
        }

        /* Bike Details */
        .bike-details {
            margin-top: 15px;
        }

        .bike-detail {
            display: flex;
            margin-bottom: 8px;
        }

        .bike-detail-label {
            font-weight: 600;
            min-width: 100px;
            color: var(--honda-blue);
        }

        /* Delete Confirmation Modal Styles */
        .delete-modal .modal-header {
            background-color: var(--honda-red);
            color: white;
        }

        .delete-modal .modal-title {
            font-weight: 600;
        }

        .delete-modal .btn-confirm {
            background-color: var(--honda-red);
            border-color: var(--honda-red);
        }

        .delete-modal .btn-confirm:hover {
            background-color: #c0041c;
            border-color: #c0041c;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .bike-slider {
                height: 150px;
            }

            .bike-detail {
                flex-direction: column;
            }

            .bike-detail-label {
                margin-bottom: 3px;
            }
        }

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
                        <a class="nav-link active" href="view-bikes.jsp">View Bikes</a>
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
        <div class="container mt-4">
            <h2 class="page-title"><i class="fas fa-motorcycle me-2"></i>All Bikes</h2>

            <div class="row">
                <c:forEach items="${bikelist}" var="bike">
                    <div class="col-md-6 col-lg-4 mb-4">
                        <div class="bike-card">
                            <div class="bike-card-header">
                                ${bike.bikename} - ${bike.model}
                            </div>
                            <div class="bike-card-body">


                                <!-- Bike Details -->
                                <div class="bike-details">
                                    <div class="bike-detail">
                                        <span class="bike-detail-label">Engine:</span>
                                        <span>${bike.engine}cc</span>
                                    </div>
                                    <div class="bike-detail">
                                        <span class="bike-detail-label">Mileage:</span>
                                        <span>${bike.milage} kmpl</span>
                                    </div>
                                    <div class="bike-detail">
                                        <span class="bike-detail-label">Price:</span>
                                        <span>&#8377;${bike.price}</span>

                                    </div>
                                    <div class="bike-detail">
                                        <span class="bike-detail-label">Colors:</span>
                                        <span>${bike.color}</span>
                                    </div>
                                </div>

                                <!-- Actions -->
                                <div class="d-flex justify-content-between mt-3">
                                    <a href="editbikes.jsp?id=${bike.id}" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit me-1"></i> Edit
                                    </a>
                                    <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal" data-bike-id="${bike.id}">
                                        <i class="fas fa-trash me-1"></i> Delete
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade delete-modal" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this bike?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a id="confirmDeleteBtn" href="#" class="btn btn-danger">Delete</a>
                </div>
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

        // Initialize sliders for each bike
        document.addEventListener('DOMContentLoaded', function() {
            // Set up each bike's slider
            <c:forEach items="${bikelist}" var="bike">
                setupSlider('slider-${bike.id}', 'dots-${bike.id}');
            </c:forEach>

            // Set up delete confirmation modal
            const deleteModal = document.getElementById('deleteConfirmationModal');
            if (deleteModal) {
                deleteModal.addEventListener('show.bs.modal', function(event) {
                    const button = event.relatedTarget;
                    const bikeId = button.getAttribute('data-bike-id');
                    const confirmBtn = document.getElementById('confirmDeleteBtn');
                    confirmBtn.href = 'deletebike?id=' + bikeId;
                });
            }
        });

        function setupSlider(sliderId, dotsId) {
            const slider = document.getElementById(sliderId);
            const dots = document.getElementById(dotsId).children;
            let currentSlide = 0;

            // Update slider position and dots
            function updateSlider() {
                slider.style.transform = `translateX(-${currentSlide * 100}%)`;

                // Update dots
                for (let i = 0; i < dots.length; i++) {
                    dots[i].classList.toggle('active', i === currentSlide);
                }
            }

            // Initial setup
            updateSlider();
        }

        function moveSlide(sliderId, direction) {
            const slider = document.getElementById(sliderId);
            const dots = document.getElementById(sliderId.replace('slider-', 'dots-')).children;
            const totalSlides = slider.children.length;
            let currentSlide = parseInt(slider.dataset.currentSlide || 0);

            currentSlide += direction;

            // Handle wrap-around
            if (currentSlide >= totalSlides) currentSlide = 0;
            if (currentSlide < 0) currentSlide = totalSlides - 1;

            // Update slider
            slider.style.transform = `translateX(-${currentSlide * 100}%)`;
            slider.dataset.currentSlide = currentSlide;

            // Update dots
            for (let i = 0; i < dots.length; i++) {
                dots[i].classList.toggle('active', i === currentSlide);
            }
        }

        function goToSlide(sliderId, slideIndex) {
            const slider = document.getElementById(sliderId);
            const dots = document.getElementById(sliderId.replace('slider-', 'dots-')).children;

            // Update slider
            slider.style.transform = `translateX(-${slideIndex * 100}%)`;
            slider.dataset.currentSlide = slideIndex;

            // Update dots
            for (let i = 0; i < dots.length; i++) {
                dots[i].classList.toggle('active', i === slideIndex);
            }
        }
    </script>
</body>
</html>