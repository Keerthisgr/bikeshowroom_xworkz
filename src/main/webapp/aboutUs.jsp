<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Honda | Power of Dreams</title>
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
            overflow-x: hidden;
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

        /* About Page Specific Styles */
        .about-hero {
            padding: 8rem 0 4rem;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                        url('https://www.honda.co.jp/environment/earthdreams/img/earthdreams_philosophy.jpg');
            background-size: cover;
            background-position: center;
            position: relative;
            margin-bottom: 4rem;
        }

        .about-hero-content {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .about-hero h1 {
            font-family: 'Kanit', sans-serif;
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            color: var(--honda-light);
            text-shadow: 0 0 20px rgba(0, 51, 153, 0.5);
        }

        .about-hero p {
            font-size: 1.2rem;
            color: var(--honda-silver);
            margin-bottom: 2rem;
        }

        .section-title {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-red);
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            position: relative;
            display: inline-block;
        }

        .section-title::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 4px;
            bottom: -10px;
            left: 0;
            background: linear-gradient(90deg, var(--honda-blue), var(--honda-red));
            border-radius: 2px;
        }

        .history-section, .values-section, .achievements-section {
            padding: 4rem 0;
            background-color: rgba(42, 42, 42, 0.8);
            margin-bottom: 3rem;
            border-radius: 10px;
        }

        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }

        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: var(--honda-blue);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
        }

        .timeline-container {
            padding: 10px 40px;
            position: relative;
            background-color: inherit;
            width: 50%;
        }

        .timeline-container::after {
            content: '';
            position: absolute;
            width: 25px;
            height: 25px;
            right: -17px;
            background-color: var(--honda-light);
            border: 4px solid var(--honda-red);
            top: 15px;
            border-radius: 50%;
            z-index: 1;
        }

        .left {
            left: 0;
        }

        .right {
            left: 50%;
        }

        .left::before {
            content: " ";
            height: 0;
            position: absolute;
            top: 22px;
            width: 0;
            z-index: 1;
            right: 30px;
            border: medium solid var(--honda-gray-bg);
            border-width: 10px 0 10px 10px;
            border-color: transparent transparent transparent var(--honda-gray-bg);
        }

        .right::before {
            content: " ";
            height: 0;
            position: absolute;
            top: 22px;
            width: 0;
            z-index: 1;
            left: 30px;
            border: medium solid var(--honda-gray-bg);
            border-width: 10px 10px 10px 0;
            border-color: transparent var(--honda-gray-bg) transparent transparent;
        }

        .right::after {
            left: -16px;
        }

        .timeline-content {
            padding: 20px 30px;
            background-color: var(--honda-gray-bg);
            position: relative;
            border-radius: 6px;
            border-left: 4px solid var(--honda-red);
        }

        .timeline-year {
            font-weight: 700;
            color: var(--honda-red);
            margin-bottom: 0.5rem;
        }

        .value-card {
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            padding: 2rem;
            height: 100%;
            border-left: 4px solid var(--honda-blue);
            transition: all 0.3s;
        }

        .value-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-left: 4px solid var(--honda-red);
        }

        .value-icon {
            font-size: 2.5rem;
            color: var(--honda-red);
            margin-bottom: 1.5rem;
        }

        .value-title {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-light);
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .achievement-card {
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            padding: 1.5rem;
            height: 100%;
            transition: all 0.3s;
            border-top: 4px solid var(--honda-red);
            text-align: center;
        }

        .achievement-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-top: 4px solid var(--honda-blue);
        }

        .achievement-number {
            font-family: 'Kanit', sans-serif;
            font-size: 3rem;
            font-weight: 800;
            color: var(--honda-red);
            margin-bottom: 1rem;
        }

        .achievement-title {
            font-size: 1.2rem;
            color: var(--honda-light);
            margin-bottom: 1rem;
        }

        .leadership-section {
            padding: 4rem 0;
            background-color: rgba(42, 42, 42, 0.8);
            margin-bottom: 3rem;
            border-radius: 10px;
        }

        .leader-card {
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
            margin-bottom: 2rem;
            border-bottom: 4px solid var(--honda-blue);
        }

        .leader-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-bottom: 4px solid var(--honda-red);
        }

        .leader-image {
            height: 300px;
            overflow: hidden;
        }

        .leader-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .leader-card:hover .leader-image img {
            transform: scale(1.05);
        }

        .leader-info {
            padding: 1.5rem;
        }

        .leader-name {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-light);
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }

        .leader-position {
            color: var(--honda-red);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .global-presence-section {
            padding: 4rem 0;
            background-color: rgba(42, 42, 42, 0.8);
            margin-bottom: 3rem;
            border-radius: 10px;
        }

        .map-container {
            position: relative;
            height: 500px;
            background: url('https://www.honda.com/-/media/Honda-US/Images/Honda-Company/Worldwide-Network/worldwide-network-map.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 10px;
            overflow: hidden;
            border: 2px solid var(--honda-blue);
        }

        .map-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 51, 153, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .map-overlay h3 {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-light);
            font-size: 2.5rem;
            text-align: center;
            text-shadow: 0 0 10px rgba(0,0,0,0.8);
        }

        .stats-item {
            text-align: center;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .stats-number {
            font-family: 'Kanit', sans-serif;
            font-size: 3rem;
            font-weight: 800;
            color: var(--honda-red);
            margin-bottom: 0.5rem;
        }

        .stats-label {
            font-size: 1.1rem;
            color: var(--honda-light);
        }

        footer {
            margin-top: 5rem;
        }

        @media screen and (max-width: 768px) {
            .about-hero h1 {
                font-size: 2.5rem;
            }

            .about-hero p {
                font-size: 1rem;
            }

            .section-title {
                font-size: 2rem;
            }

            .timeline::after {
                left: 31px;
            }

            .timeline-container {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }

            .timeline-container::before {
                left: 60px;
                border: medium solid var(--honda-gray-bg);
                border-width: 10px 10px 10px 0;
                border-color: transparent var(--honda-gray-bg) transparent transparent;
            }

            .left::after, .right::after {
                left: 15px;
            }

            .right {
                left: 0%;
            }

            .leader-image {
                height: 200px;
            }

            .map-container {
                height: 300px;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-in {
            animation: fadeInUp 1s ease forwards;
        }
        footer {
            background-color: var(--honda-dark);
            color: var(--honda-light);
            border-top: 2px solid var(--honda-red);
            position: relative;
            padding: 3rem 0;
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

        .pulse-effect {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: radial-gradient(circle, rgba(0, 51, 153, 0.3) 0%, transparent 70%);
            opacity: 0;
            z-index: -1;
            animation: pulse 8s infinite;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(-5deg);
            }
            50% {
                transform: translateY(-20px) rotate(5deg);
            }
        }

        @keyframes pulse {
            0% {
                opacity: 0;
                transform: scale(0.8);
            }
            50% {
                opacity: 0.3;
            }
            100% {
                opacity: 0;
                transform: scale(1.2);
            }
        }

        @media (max-width: 1200px) {
            .welcome-container {
                flex-direction: column;
                padding-top: 6rem;
            }

            .main-bike-image {
                position: relative;
                left: auto;
                top: auto;
                transform: none;
                width: 80%;
                margin: 0 auto 3rem;
            }

            .welcome-content {
                max-width: 100%;
                text-align: center;
                padding: 0 2rem;
            }

            .subtitle {
                text-align: center;
                margin-left: 0;
            }

            .btn-primary-honda {
                margin-left: auto;
                margin-right: auto;
            }

            .video-container {
        height: 100%;
        display: flex;
        flex-direction: column;
    }

    .main-video {
        width: 100%;
        height: 300px; /* Matching the news section height */
        background: #000;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 10px 30px rgba(0,0,0,0.5);
    }

    .main-video iframe {
        width: 100%;
        height: 100%;
        border: none;
    }

    @media (max-width: 768px) {
        .main-video {
            height: 250px;
        }
    }
        }

        @media (max-width: 768px) {
            .welcome-text {
                font-size: 3.5rem;
            }

            .welcome-text::after {
                width: 100%;
            }

            .subtitle {
                font-size: 1.1rem;
                padding: 0 20px;
            }

            .btn-primary-honda,
            .btn-outline-honda {
                padding: 12px 24px;
                font-size: 0.8rem;
                margin-left: 0;
                margin-top: 15px;
                width: 80%;
                max-width: 250px;
            }

            .scroll-control {
                width: 30px;
                height: 30px;
                font-size: 0.8rem;
            }

            .scroll-left {
                left: -15px;
            }

            .scroll-right {
                right: -15px;
            }


            .footer-links {
                gap: 10px;
            }
        }
        footer {
        margin-top: 5rem;
    }

        @media (max-width: 576px) {
            .info-section .row > div {
                margin-bottom: 2rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
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
                        <a class="nav-link active" href="about.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userlogin.jsp">User login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="about-hero">
        <div class="container">
            <div class="about-hero-content fade-in">
                <h1>About Us</h1>
                <p>For over 75 years, Honda has been driven by the Power of Dreams - pushing the boundaries of what's possible to create products that improve lives around the world.</p>
            </div>
        </div>
    </section>



    <!-- Values Section -->
    <section class="values-section">
        <div class="container">
            <h2 class="section-title text-center fade-in">OUR VALUES</h2>
            <div class="row">
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.2s;">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h3 class="value-title">Innovation</h3>
                        <p>We challenge ourselves to develop revolutionary technologies and products that create new value for our customers and society.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.4s;">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h3 class="value-title">Sustainability</h3>
                        <p>We are committed to reducing our environmental impact and creating a sustainable society for future generations.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.6s;">
                    <div class="value-card">
                        <div class="value-icon">
                            <i class="fas fa-people-carry"></i>
                        </div>
                        <h3 class="value-title">Quality</h3>
                        <p>We pursue the highest level of quality in all our products and services to exceed customer expectations.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Achievements Section -->
    <section class="achievements-section">
        <div class="container">
            <h2 class="section-title text-center fade-in">OUR ACHIEVEMENTS</h2>
            <div class="row">
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.2s;">
                    <div class="achievement-card">
                        <div class="achievement-number">400M+</div>
                        <h4 class="achievement-title">Motorcycles Produced</h4>
                        <p>Honda is the world's largest motorcycle manufacturer since 1959.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.4s;">
                    <div class="achievement-card">
                        <div class="achievement-number">800+</div>
                        <h4 class="achievement-title">Global Facilities</h4>
                        <p>Manufacturing plants, R&D centers, and sales offices across six continents.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4 fade-in" style="animation-delay: 0.6s;">
                    <div class="achievement-card">
                        <div class="achievement-number">25+</div>
                        <h4 class="achievement-title">MotoGP Championships</h4>
                        <p>Dominating the world's premier motorcycle racing championship.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Leadership Section -->
    <section class="leadership-section">
        <div class="container">
            <h2 class="section-title text-center fade-in">OUR LEADERSHIP</h2>
            <div class="row">
                <div class="col-md-4 fade-in" style="animation-delay: 0.2s;">
                    <div class="leader-card">

                        <div class="leader-info">
                            <h4 class="leader-name">Toshihiro Mibe</h4>
                            <p class="leader-position">President & CEO</p>
                            <p>Leading Honda's global operations and driving the company's electrification strategy.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 fade-in" style="animation-delay: 0.4s;">
                    <div class="leader-card">

                        <div class="leader-info">
                            <h4 class="leader-name">Shinji Aoyama</h4>
                            <p class="leader-position">Senior Managing Officer</p>
                            <p>Oversees Honda's motorcycle operations and global production strategies.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 fade-in" style="animation-delay: 0.6s;">
                    <div class="leader-card">

                        <div class="leader-info">
                            <h4 class="leader-name">Noriya Hayakawa</h4>
                            <p class="leader-position">Chief Officer, Motorcycle Operations</p>
                            <p>Drives innovation in Honda's motorcycle product development and technology.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


            <div class="row fade-in" style="animation-delay: 0.6s;">
                <div class="col-12">
                    <h3 class="text-center mb-4">MAJOR MANUFACTURING LOCATIONS</h3>
                    <div class="table-responsive">
                        <table class="table table-dark table-striped">
                            <thead>
                                <tr>
                                    <th>Region</th>
                                    <th>Location</th>
                                    <th>Primary Products</th>
                                    <th>Established</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Japan</td>
                                    <td>Kumamoto Factory</td>
                                    <td>Large motorcycles, racing models</td>
                                    <td>1976</td>
                                </tr>
                                <tr>
                                    <td>USA</td>
                                    <td>Marysville, Ohio</td>
                                    <td>Motorcycles, ATVs</td>
                                    <td>1979</td>
                                </tr>
                                <tr>
                                    <td>India</td>
                                    <td>Tapukara, Rajasthan</td>
                                    <td>Two-wheelers, engines</td>
                                    <td>2011</td>
                                </tr>
                                <tr>
                                    <td>Thailand</td>
                                    <td>Prachinburi</td>
                                    <td>Global production hub</td>
                                    <td>2016</td>
                                </tr>
                                <tr>
                                    <td>Brazil</td>
                                    <td>Manaus</td>
                                    <td>Latin America models</td>
                                    <td>1976</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>

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

        // Animation on scroll
        document.addEventListener('DOMContentLoaded', function() {
            const fadeElements = document.querySelectorAll('.fade-in');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = 1;
                        entry.target.style.transform = 'translateY(0)';
                    }
                });
            }, {
                threshold: 0.1
            });

            fadeElements.forEach(element => {
                element.style.opacity = 0;
                element.style.transform = 'translateY(20px)';
                element.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                observer.observe(element);
            });
        });
    </script>
</body>
</html>