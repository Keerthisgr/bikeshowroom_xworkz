<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | Bike Showroom</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
            background-color: #f8f9fa;
            color: var(--honda-dark);
            min-height: 100vh;
        }

        /* Navbar Styles */
        .navbar {
            background-color: var(--honda-dark) !important;
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

        /* Main Content */
        .main-content {
            margin-top: 80px;
        }

        /* Hero Banner Slider */
        .hero-banner {
            height: 500px;
            overflow: hidden;
            position: relative;
            border-radius: 10px;
            margin-bottom: 3rem;
        }

        .banner-slide {
            position: absolute;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .banner-slide.active {
            opacity: 1;
        }

        .banner-content {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0,0,0,0.8));
            color: white;
            padding: 2rem;
        }

        .banner-indicators {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
            z-index: 10;
        }

        .banner-indicator {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: rgba(255,255,255,0.5);
            cursor: pointer;
            transition: all 0.3s;
        }

        .banner-indicator.active {
            background-color: var(--honda-red);
            transform: scale(1.2);
        }

        /* Bike Categories */
        .category-section {
            margin: 4rem 0;
        }

        .category-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--honda-red);
        }

        .category-title {
            font-family: 'Kanit', sans-serif;
            font-size: 2rem;
            color: var(--honda-dark);
            margin: 0;
        }

        .bike-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s;
            margin-bottom: 2rem;
            height: 100%;
        }

        .bike-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .bike-img-container {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .bike-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .bike-card:hover .bike-img {
            transform: scale(1.05);
        }

        .bike-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--honda-red);
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .bike-details {
            padding: 1.5rem;
        }

        .bike-title {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: var(--honda-dark);
        }

        .bike-price {
            color: var(--honda-red);
            font-weight: 700;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        .bike-specs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .spec-item {
            text-align: center;
            flex: 1;
        }

        .spec-icon {
            color: var(--honda-blue);
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .spec-value {
            font-weight: bold;
            font-size: 0.9rem;
        }

        .spec-label {
            font-size: 0.8rem;
            color: #6c757d;
        }
        /* Back to Top Button */
        .back-to-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background-color: var(--honda-red);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s;
            opacity: 0;
            visibility: hidden;
            z-index: 999;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .back-to-top:hover {
            background-color: var(--honda-blue);
            transform: translateY(-5px);
        }

        .back-to-top.active {
            opacity: 1;
            visibility: visible;
        }

        /* Reviews Section */
        .reviews-section {
            background-color: var(--honda-silver);
            padding: 4rem 0;
            margin: 4rem 0;
            border-top: 2px solid var(--honda-red);
            border-bottom: 2px solid var(--honda-red);
        }

        .review-card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            margin-bottom: 2rem;
            height: 100%;
        }

        .review-header {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .review-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 1rem;
            border: 3px solid var(--honda-blue);
        }

        .review-user {
            flex: 1;
        }

        .review-name {
            font-weight: 700;
            margin-bottom: 0.2rem;
        }

        .review-date {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .review-stars {
            color: #ffc107;
            font-size: 1.2rem;
        }

        .review-text {
            line-height: 1.6;
            color: #555;
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

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .hero-banner {
                height: 350px;
            }

            .banner-content {
                padding: 1rem;
            }

            .category-title {
                font-size: 1.5rem;
            }

            .bike-img-container {
                height: 150px;
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
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="viewpage.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userside-viewbikes">Bikes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userside-viewshowrooms">Showrooms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <!-- Hero Banner Slider -->
            <section id="home" class="hero-banner">
                <div class="banner-slide active" style="background-image: url('https://www.honda2wheelersindia.com/_next/image?url=https%3A%2F%2Fedge.sitecorecloud.io%2Fhondamotorc388f-hmsi8ece-prodb777-e813%2Fmedia%2FProject%2FHONDA2WI%2Fhonda2wheelersindia%2Fhome%2FBuilding-for-a-better-tomorrow%2FSafety-1000x667.jpg%3Fh%3D667%26iar%3D0%26w%3D1000&w=2580&q=75&dpl=dpl_FtSSXkyD1TePng2iAsP1UuTqNDx5');">
                    <div class="banner-content">
                        <h2 class="display-4">Safety</h2>
                        <p class="lead">Creating a culture of safe riding</p>

                    </div>
                </div>
                <div class="banner-slide" style="background-image: url('https://www.honda2wheelersindia.com/_next/image?url=https%3A%2F%2Fedge.sitecorecloud.io%2Fhondamotorc388f-hmsi8ece-prodb777-e813%2Fmedia%2FProject%2FHONDA2WI%2Fhonda2wheelersindia%2Fhome%2FBuilding-for-a-better-tomorrow%2FCSR-1000x667.jpg%3Fh%3D667%26iar%3D0%26w%3D1000&w=2580&q=75&dpl=dpl_FtSSXkyD1TePng2iAsP1UuTqNDx5');">
                    <div class="banner-content">
                        <h2 class="display-4">CSR</h2>
                        <p class="lead">Empowering communities through meaningful action</p>

                    </div>
                </div>
                <div class="banner-slide" style="background-image: url('https://www.honda2wheelersindia.com/_next/image?url=https%3A%2F%2Fedge.sitecorecloud.io%2Fhondamotorc388f-hmsi8ece-prodb777-e813%2Fmedia%2FProject%2FHONDA2WI%2Fhonda2wheelersindia%2Fhome%2FBuilding-for-a-better-tomorrow%2FEnvironment-1000x667.jpg%3Fh%3D667%26iar%3D0%26w%3D1000&w=2580&q=75&dpl=dpl_FtSSXkyD1TePng2iAsP1UuTqNDx5');">
                    <div class="banner-content">
                        <h2 class="display-4">Environment</h2>
                        <p class="lead">Riding Towards a Greener Future</p>
                    </div>
                </div>
                <div class="banner-indicators">
                    <div class="banner-indicator active" data-slide="0"></div>
                    <div class="banner-indicator" data-slide="1"></div>
                    <div class="banner-indicator" data-slide="2"></div>
                </div>
            </section>

            <!-- Normal Bikes Category -->
            <section id="bikes" class="category-section">
                <div class="category-header">
                    <h2 class="category-title">Commuter Bikes</h2>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/--standard-obd-2b1740150415645.jpg?q=80" alt="Honda Shine" class="bike-img">
                                <span class="bike-badge">Best Seller</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Honda Shine</h3>
                                <p class="bike-price">₹78,500</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">65 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">10.5 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">10.5L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/honda-qc1-standard1732724431068.jpg?q=80" alt="Honda SP 125" class="bike-img">
                                <span class="bike-badge">New Launch</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Honda SP 125</h3>
                                <p class="bike-price">₹86,017</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">65 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">10.72 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">11L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                                 </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/--drum-20251737370775509.jpg?q=80" alt="Honda Livo" class="bike-img">
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Honda Livo</h3>
                                <p class="bike-price">₹74,500</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">74 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">8.31 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">8L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Back to Top Button -->
            <div class="back-to-top">
                <i class="fas fa-arrow-up"></i>
            </div>

            <!-- Sports Bikes Category -->
            <section class="category-section">
                <div class="category-header">
                    <h2 class="category-title">Sports Bikes</h2>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/--standard-obd-2b1740150415645.jpg?q=80" alt="Honda Hornet 2.0" class="bike-img">
                                <span class="bike-badge">Hot Deal</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Hornet 2.0</h3>
                                <p class="bike-price">₹1,35,000</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">45 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">17.5 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">12L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/128059/cb300f-right-side-view-2.png?isig=0&q=80" alt="Honda CB300F" class="bike-img">
                                <span class="bike-badge">New Launch</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">CB300F</h3>
                                <p class="bike-price">₹2,42,000</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">35 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">24.1 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">13L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/bw/models/colors/honda-select-model-pearl-nightstar-black--obd2-1695014544654.png?q=80" alt="Honda CB200X" class="bike-img">
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">CB200X</h3>
                                <p class="bike-price">₹1,47,500</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        <div class="spec-value">45 kmpl</div>
                                        <div class="spec-label">Mileage</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">17.1 HP</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-gas-pump"></i></div>
                                        <div class="spec-value">12L</div>
                                        <div class="spec-label">Tank</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Electric Bikes Category -->
            <section class="category-section">
                <div class="category-header">
                    <h2 class="category-title">Electric Bikes</h2>
                 </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/138913/activa-e-front-wheel.jpeg?isig=0&q=80" alt="Honda Activa Electric" class="bike-img">
                                <span class="bike-badge">Coming Soon</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Activa Electric</h3>
                                <p class="bike-price">₹1,10,000 (Expected)</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-battery-full"></i></div>
                                        <div class="spec-value">100 km</div>
                                        <div class="spec-label">Range</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">4.5 kW</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-charging-station"></i></div>
                                        <div class="spec-value">4 hrs</div>
                                        <div class="spec-label">Charge Time</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="bike-card">
                            <div class="bike-img-container">
                                <img src="https://edge.sitecorecloud.io/hondamotorc388f-hmsi8ece-prodb777-e813/media/Project/HONDA2WI/honda2wheelersindia/motorcycle/dio-125/Desktop/Design/Design-Fierce-LED-Headlamp-555x555.png?h=555&iar=0&w=555" alt="Honda Dio Electric" class="bike-img">
                                <span class="bike-badge">Coming Soon</span>
                            </div>
                            <div class="bike-details">
                                <h3 class="bike-title">Dio Electric</h3>
                                <p class="bike-price">₹95,000 (Expected)</p>
                                <div class="bike-specs">
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-battery-full"></i></div>
                                        <div class="spec-value">85 km</div>
                                        <div class="spec-label">Range</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-bolt"></i></div>
                                        <div class="spec-value">3.5 kW</div>
                                        <div class="spec-label">Power</div>
                                    </div>
                                    <div class="spec-item">
                                        <div class="spec-icon"><i class="fas fa-charging-station"></i></div>
                                        <div class="spec-value">3.5 hrs</div>
                                        <div class="spec-label">Charge Time</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Reviews Section -->
            <section id="reviews" class="reviews-section">
                <div class="container">
                    <h2 class="text-center mb-5">What Our Customers Say</h2>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="review-card">
                                <div class="review-header">
                                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User" class="review-avatar">
                                    <div class="review-user">
                                        <h4 class="review-name">Rajesh Kumar</h4>
                                        <p class="review-date">15 March 2024</p>
                                    </div>
                                    <div class="review-stars">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                                <div class="review-text">
                                    <p>"I've been using my Honda Shine for 3 years now and it's been absolutely reliable. The mileage is fantastic and maintenance costs are very low. Best commuter bike in this segment!"</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="review-card">
                                <div class="review-header">
                                    <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="User" class="review-avatar">
                                    <div class="review-user">
                                        <h4 class="review-name">Priya Sharma</h4>
                                        <p class="review-date">2 April 2024</p>
                                    </div>
                                    <div class="review-stars">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                    </div>
                                </div>
                                <div class="review-text">
                                    <p>"The Honda Activa has been perfect for my daily commute. It's so easy to ride in city traffic and the seat is very comfortable. Service at Honda showrooms is also very professional."</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="review-card">
                                <div class="review-header">
                                    <img src="https://randomuser.me/api/portraits/men/75.jpg" alt="User" class="review-avatar">
                                    <div class="review-user">
                                        <h4 class="review-name">Vikram Singh</h4>
                                        <p class="review-date">28 February 2024</p>
                                    </div>
                                    <div class="review-stars">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                                <div class="review-text">
                                    <p>"Upgraded to the Hornet 2.0 last month and I'm loving every ride! The power delivery is smooth and the aggressive styling gets me compliments everywhere. Honda never disappoints!"</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
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

        // Banner Slider
        let currentSlide = 0;
        const slides = document.querySelectorAll('.banner-slide');
        const indicators = document.querySelectorAll('.banner-indicator');

        function showSlide(index) {
            // Hide all slides
            slides.forEach(slide => slide.classList.remove('active'));
            indicators.forEach(indicator => indicator.classList.remove('active'));

            // Show current slide
            slides[index].classList.add('active');
            indicators[index].classList.add('active');
            currentSlide = index;
        }
        // Back to Top Button
            const backToTopButton = document.querySelector('.back-to-top');

            window.addEventListener('scroll', function() {
                if (window.pageYOffset > 300) {
                    backToTopButton.classList.add('active');
                } else {
                    backToTopButton.classList.remove('active');
                }
            });

            backToTopButton.addEventListener('click', function(e) {
                e.preventDefault();
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });

        // Auto slide change
        setInterval(() => {
            currentSlide = (currentSlide + 1) % slides.length;
            showSlide(currentSlide);
        }, 5000);

        // Click on indicators
        indicators.forEach((indicator, index) => {
            indicator.addEventListener('click', () => {
                showSlide(index);
            });
        });

        // Highlight active navigation link
        document.addEventListener('DOMContentLoaded', function() {
            const navLinks = document.querySelectorAll('.nav-link');

            navLinks.forEach(link => {
                link.addEventListener('click', function() {
                    navLinks.forEach(l => l.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>
</body>
</html>