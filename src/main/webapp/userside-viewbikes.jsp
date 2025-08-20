<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - View Bikes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        /* Bike Card Styles */
        .bike-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
            border-left: 4px solid var(--honda-blue);
        }

        .bike-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .bike-image {
            height: 200px;
            width: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .bike-card:hover .bike-image {
            transform: scale(1.05);
        }

        .bike-card-body {
            padding: 20px;
        }

        .bike-title {
            font-weight: 700;
            color: var(--honda-blue);
            margin-bottom: 5px;
            font-size: 1.3rem;
        }

        .bike-model {
            color: #666;
            margin-bottom: 10px;
            font-size: 0.9rem;
        }

        .bike-spec {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }

        .bike-price {
            font-weight: 700;
            color: var(--honda-red);
            font-size: 1.2rem;
            margin: 15px 0;
        }

        .view-details-btn {
            background-color: var(--honda-blue);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            width: 100%;
            transition: all 0.3s;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .view-details-btn:hover {
            background-color: #002266;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 51, 153, 0.3);
        }

        /* Image Slider in Modal */
        .modal-slider {
            position: relative;
            height: 300px;
            overflow: hidden;
            border-radius: 8px;
            margin-bottom: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .slider-container {
            display: flex;
            height: 100%;
            transition: transform 0.5s ease;
        }

        .slider-slide {
            min-width: 100%;
            height: 100%;
        }

        .slider-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slider-nav {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            padding: 0 15px;
        }

        .slider-nav-btn {
            width: 40px;
            height: 40px;
            background-color: rgba(0,0,0,0.5);
            color: white;
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s;
        }

        .slider-nav-btn:hover {
            background-color: var(--honda-red);
            transform: scale(1.1);
        }

        .slider-dots {
            display: flex;
            justify-content: center;
            margin-top: 15px;
        }

        .slider-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: #ccc;
            margin: 0 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .slider-dot.active {
            background: var(--honda-blue);
            transform: scale(1.2);
        }

        /* Details Modal Styles */
        .details-modal .modal-header {
            background-color: var(--honda-blue);
            color: white;
            border-bottom: 2px solid var(--honda-red);
        }

        .details-modal .modal-title {
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .details-modal .modal-body {
            padding: 25px;
        }

        .bike-detail {
            display: flex;
            margin-bottom: 12px;
            padding-bottom: 8px;
            border-bottom: 1px dashed #eee;
        }

        .detail-label {
            font-weight: 600;
            min-width: 120px;
            color: var(--honda-blue);
        }

        .detail-value {
            flex: 1;
        }

        .modal-footer {
            border-top: 1px solid #eee;
        }

        footer {
            background-color: var(--honda-dark);
            color: var(--honda-light);
            border-top: 2px solid var(--honda-red);
            padding: 2rem 0;
            margin-top: auto;
        }

        .footer-content {
            position: relative;
            z-index: 1;
        }

        .footer-logo {
            height: 50px;
            margin-bottom: 1.5rem;
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

        .main-content {
            padding-top: 80px;
            padding-bottom: 40px;
            flex: 1;
        }

        .page-title {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-blue);
            font-size: 2.5rem;
            font-weight: 800;
            margin-bottom: 2rem;
            position: relative;
            display: inline-block;
        }

        .page-title::after {
            content: '';
            position: absolute;
            width: 50%;
            height: 4px;
            bottom: -10px;
            left: 0;
            background-color: var(--honda-red);
            border-radius: 2px;
        }

        .no-bikes {
            text-align: center;
            padding: 50px 0;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .no-bikes i {
            font-size: 3rem;
            color: var(--honda-red);
            margin-bottom: 20px;
        }

        .no-bikes h3 {
            color: var(--honda-blue);
            margin-bottom: 15px;
        }

        @media (max-width: 768px) {
            .modal-slider {
                height: 200px;
            }

            .page-title {
                font-size: 2rem;
            }

            .bike-card {
                margin-bottom: 20px;
            }
        }

        @media (max-width: 576px) {
            .navbar-brand img {
                height: 35px;
            }

            .footer-links {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="aboutUs.jsp">About us</a></li>
                    <li class="nav-item"><a class="nav-link" href="userlogin.jsp">User login</a></li>
                    <li class="nav-item"><a class="nav-link active" href="view-bikes.jsp">View Bikes</a></li>
                    <li class="nav-item"><a class="nav-link" href="adminLogin.jsp">Admin</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h1 class="page-title">Bike Collection</h1>

            <div class="row g-4">
                <c:choose>
                    <c:when test="${not empty bikelist}">
                        <c:forEach items="${bikelist}" var="bike">
                            <div class="col-md-6 col-lg-4">
                                <div class="bike-card">
                                    <c:choose>
                                        <c:when test="${not empty bike.rightimage}">
                                            <img src="/bikeshowroom_xworkz/getrightsideimage?image=${bike.rightimage}" alt="${bike.bikename}" class="bike-image">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="https://via.placeholder.com/400x300?text=Honda+${fn:replace(bike.bikename, ' ', '+')}" alt="${bike.bikename}" class="bike-image">
                                        </c:otherwise>
                                    </c:choose>

                                    <div class="bike-card-body">
                                        <h3 class="bike-title">${bike.bikename}</h3>
                                        <div class="bike-model">${bike.model}</div>

                                        <div class="bike-spec">
                                            <span>Engine</span>
                                            <span>${bike.engine}cc</span>
                                        </div>
                                        <div class="bike-spec">
                                            <span>Mileage</span>
                                            <span>${bike.milage} kmpl</span>
                                        </div>

                                        <div class="bike-price">₹${bike.price}</div>

                                        <button class="view-details-btn" data-bs-toggle="modal" data-bs-target="#bikeDetailsModal"
                                            data-bike-name="${bike.bikename}"
                                            data-bike-model="${bike.model}"
                                            data-bike-engine="${bike.engine}"
                                            data-bike-milage="${bike.milage}"
                                            data-bike-price="${bike.price}"
                                            data-bike-color="${bike.color}"
                                            data-bike-frontimage="${bike.frontimage}"
                                            data-bike-backimage="${bike.backimage}"
                                            data-bike-leftimage="${bike.leftimage}"
                                            data-bike-rightimage="${bike.rightimage}">
                                            <i class="fas fa-info-circle me-2"></i>View Details
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12">
                            <div class="no-bikes">
                                <i class="fas fa-bicycle"></i>
                                <h3>No Bikes Available</h3>
                                <p>Currently there are no bikes in our showroom. Please check back later.</p>
                                <a href="index.jsp" class="btn btn-primary mt-3">Return to Home</a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- Bike Details Modal with Image Slider -->
    <div class="modal fade details-modal" id="bikeDetailsModal" tabindex="-1" aria-labelledby="bikeDetailsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="bikeDetailsModalLabel">Bike Details</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <!-- Image Slider -->
                            <div class="modal-slider">
                                <div class="slider-container" id="bikeSlider">
                                    <div class="slider-slide">
                                        <img id="detailBikeFrontImage" src="" alt="Front View" class="img-fluid">
                                    </div>
                                    <div class="slider-slide">
                                        <img id="detailBikeBackImage" src="" alt="Back View" class="img-fluid">
                                    </div>
                                    <div class="slider-slide">
                                        <img id="detailBikeLeftImage" src="" alt="Left View" class="img-fluid">
                                    </div>
                                    <div class="slider-slide">
                                        <img id="detailBikeRightImage" src="" alt="Right View" class="img-fluid">
                                    </div>
                                </div>
                                <div class="slider-nav">
                                    <button class="slider-nav-btn" id="prevBtn"><i class="fas fa-chevron-left"></i></button>
                                    <button class="slider-nav-btn" id="nextBtn"><i class="fas fa-chevron-right"></i></button>
                                </div>
                            </div>
                            <div class="slider-dots" id="sliderDots">
                                <span class="slider-dot active" data-index="0"></span>
                                <span class="slider-dot" data-index="1"></span>
                                <span class="slider-dot" data-index="2"></span>
                                <span class="slider-dot" data-index="3"></span>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h3 id="detailBikeName" class="mb-3"></h3>
                            <p id="detailBikeModel" class="text-muted mb-4"></p>

                            <div class="bike-detail">
                                <span class="detail-label">Engine:</span>
                                <span class="detail-value" id="detailBikeEngine"></span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Mileage:</span>
                                <span class="detail-value" id="detailBikeMilage"></span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Price:</span>
                                <span class="detail-value" id="detailBikePrice"></span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Color:</span>
                                <span class="detail-value" id="detailBikeColor"></span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Fuel Type:</span>
                                <span class="detail-value">Petrol</span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Transmission:</span>
                                <span class="detail-value">Manual</span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Braking System:</span>
                                <span class="detail-value">Dual Channel ABS</span>
                            </div>
                            <div class="bike-detail">
                                <span class="detail-label">Warranty:</span>
                                <span class="detail-value">2 Years</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container text-center footer-content">
            <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo" class="footer-logo">
            <div class="footer-links">
                <a href="aboutUs.jsp">About Honda</a>
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
            <p class="copyright">
                © 2025 Honda Motor Co., Ltd. All Rights Reserved. |
                <i class="fas fa-bolt" style="color: var(--honda-red);"></i> Powered by Dreams
            </p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Navbar scroll effect
            window.addEventListener('scroll', function() {
                const navbar = document.querySelector('.navbar');
                navbar.classList.toggle('scrolled', window.scrollY > 50);
            });

            // Initialize slider when modal is shown
            const bikeDetailsModal = document.getElementById('bikeDetailsModal');
            if (bikeDetailsModal) {
                bikeDetailsModal.addEventListener('show.bs.modal', function(event) {
                    const button = event.relatedTarget;

                    // Set bike details
                    document.getElementById('detailBikeName').textContent = button.getAttribute('data-bike-name');
                    document.getElementById('detailBikeModel').textContent = button.getAttribute('data-bike-model');
                    document.getElementById('detailBikeEngine').textContent = button.getAttribute('data-bike-engine') + 'cc';
                    document.getElementById('detailBikeMilage').textContent = button.getAttribute('data-bike-milage') + ' kmpl';
                    document.getElementById('detailBikePrice').textContent = '₹' + button.getAttribute('data-bike-price');
                    document.getElementById('detailBikeColor').textContent = button.getAttribute('data-bike-color');
                    document.getElementById('bikeDetailsModalLabel').textContent = button.getAttribute('data-bike-name') + ' Details';

                    // Set image sources
                    const basePath = '/bikeshowroom_xworkz/';
                    const placeholderImage = 'https://via.placeholder.com/600x400?text=Honda+Bike';

                    const frontImage = document.getElementById('detailBikeFrontImage');
                    const backImage = document.getElementById('detailBikeBackImage');
                    const leftImage = document.getElementById('detailBikeLeftImage');
                    const rightImage = document.getElementById('detailBikeRightImage');

                    // Reset all images to placeholder first
                    frontImage.src = placeholderImage;
                    backImage.src = placeholderImage;
                    leftImage.src = placeholderImage;
                    rightImage.src = placeholderImage;

                    // Set actual images if available
                    const frontImageUrl = button.getAttribute('data-bike-frontimage');
                    const backImageUrl = button.getAttribute('data-bike-backimage');
                    const leftImageUrl = button.getAttribute('data-bike-leftimage');
                    const rightImageUrl = button.getAttribute('data-bike-rightimage');

                    if (frontImageUrl) {
                        frontImage.src = basePath + 'getfrontimage?image=' + frontImageUrl;
                    }
                    if (backImageUrl) {
                        backImage.src = basePath + 'getbacksideimage?image=' + backImageUrl;
                    }
                    if (leftImageUrl) {
                        leftImage.src = basePath + 'getleftsideimage?image=' + leftImageUrl;
                    }
                    if (rightImageUrl) {
                        rightImage.src = basePath + 'getrightsideimage?image=' + rightImageUrl;
                    }

                    // Initialize slider
                    initSlider();
                });
            }

            // Slider functionality
            let currentSlide = 0;
            const slides = document.querySelectorAll('.slider-slide');
            const dots = document.querySelectorAll('.slider-dot');
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const slider = document.getElementById('bikeSlider');

            function initSlider() {
                currentSlide = 0;
                updateSlider();
            }

            function updateSlider() {
                // Hide all slides first
                slides.forEach(slide => {
                    slide.style.display = 'none';
                });

                // Show current slide
                if (slides[currentSlide]) {
                    slides[currentSlide].style.display = 'block';
                }

                // Update dots
                dots.forEach((dot, index) => {
                    if (index === currentSlide) {
                        dot.classList.add('active');
                    } else {
                        dot.classList.remove('active');
                    }
                });
            }

            function goToSlide(index) {
                if (index >= 0 && index < slides.length) {
                    currentSlide = index;
                    updateSlider();
                }
            }

            function nextSlide() {
                currentSlide = (currentSlide + 1) % slides.length;
                updateSlider();
            }

            function prevSlide() {
                currentSlide = (currentSlide - 1 + slides.length) % slides.length;
                updateSlider();
            }

            // Event listeners
            if (prevBtn) prevBtn.addEventListener('click', prevSlide);
            if (nextBtn) nextBtn.addEventListener('click', nextSlide);

            dots.forEach(dot => {
                dot.addEventListener('click', function() {
                    const index = parseInt(this.getAttribute('data-index'));
                    goToSlide(index);
                });
            });

            // Auto-advance slider (optional)
            let slideInterval = setInterval(nextSlide, 5000);

            // Pause on hover
            const sliderContainer = document.querySelector('.modal-slider');
            if (sliderContainer) {
                sliderContainer.addEventListener('mouseenter', () => {
                    clearInterval(slideInterval);
                });

                sliderContainer.addEventListener('mouseleave', () => {
                    slideInterval = setInterval(nextSlide, 5000);
                });
            }

            // Reset interval when modal is closed
            if (bikeDetailsModal) {
                bikeDetailsModal.addEventListener('hidden.bs.modal', function() {
                    clearInterval(slideInterval);
                });
            }
        });
    </script>
</body>
</html>