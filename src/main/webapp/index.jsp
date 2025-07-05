<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | Power of Dreams</title>
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

        .welcome-container {
            flex: 1;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 2rem;
            position: relative;
            z-index: 1;
            min-height: 80vh;
        }

        .welcome-content {
            flex: 1;
            text-align: right;
            padding: 0 4rem;
            margin-left: auto;
            max-width: 60%;
        }

        .main-bike-image {
            position: absolute;
            left: 5%;
            top: 50%;
            transform: translateY(-50%);
            width: 500px;
            z-index: 2;
            filter: drop-shadow(0 0 20px rgba(0, 51, 153, 0.7));
            animation: float 6s ease-in-out infinite;
            opacity: 0.8;
        }

        .welcome-text {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-light);
            font-size: 5.5rem;
            font-weight: 800;
            letter-spacing: 2px;
            text-shadow: 0 0 20px rgba(0, 51, 153, 0.5);
            margin-bottom: 1.5rem;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.8s 0.3s forwards;
            position: relative;
        }

        .welcome-text::after {
            content: '';
            position: absolute;
            width: 100%;
            height: 4px;
            bottom: -10px;
            left: 0;
            background: linear-gradient(90deg, var(--honda-blue), var(--honda-red));
            border-radius: 2px;
        }

        .subtitle {
            font-size: 1.4rem;
            max-width: 700px;
            margin-bottom: 3rem;
            line-height: 1.6;
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.8s 0.6s forwards;
            color: var(--honda-silver);
            margin-left: auto;
            text-align: right;
        }

        .btn-primary-honda {
            background: linear-gradient(135deg, var(--honda-blue), #0044cc);
            color: var(--honda-light);
            font-weight: 700;
            padding: 14px 36px;
            border-radius: 30px;
            border: none;
            letter-spacing: 1px;
            text-transform: uppercase;
            font-size: 0.9rem;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.8s 0.9s forwards;
            box-shadow: 0 4px 15px rgba(0, 51, 153, 0.4);
            margin-left: auto;
            display: block;
        }

        .btn-primary-honda:hover {
            background: linear-gradient(135deg, #0044cc, var(--honda-blue));
            color: var(--honda-light);
            transform: translateY(-5px) scale(1.03);
            box-shadow: 0 15px 30px rgba(0, 51, 153, 0.6);
        }

        .btn-outline-honda {
            background: transparent;
            color: var(--honda-light);
            font-weight: 700;
            padding: 14px 36px;
            border-radius: 30px;
            border: 2px solid var(--honda-light);
            letter-spacing: 1px;
            text-transform: uppercase;
            font-size: 0.9rem;
            margin-left: 20px;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            opacity: 0;
            transform: translateY(30px);
            animation: fadeInUp 0.8s 1.1s forwards;
        }

        .btn-outline-honda:hover {
            background-color: var(--honda-light);
            color: var(--honda-dark);
            transform: translateY(-5px) scale(1.03);
            box-shadow: 0 15px 30px rgba(255, 255, 255, 0.2);
        }

        /* New Sections */
        .info-section {
            padding: 5rem 0;
            background-color: var(--honda-gray-bg);
            border-top: 1px solid rgba(255,255,255,0.1);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .about-honda {
            padding: 2rem;
            background: rgba(0,0,0,0.3);
            border-radius: 15px;
            border-left: 4px solid var(--honda-red);
        }

        .scrolling-section {
            position: relative;
        }

        .scrolling-cards {
            display: flex;
            overflow-x: auto;
            gap: 20px;
            padding: 20px 0;
            scroll-snap-type: x mandatory;
            scrollbar-width: none; /* Hide scrollbar for Firefox */
        }

        .scrolling-cards::-webkit-scrollbar {
            display: none; /* Hide scrollbar for Chrome/Safari */
        }

        .scrolling-card {
            min-width: 100%;
            height: 300px;
            scroll-snap-align: start;
            background: rgba(0,0,0,0.2);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            transition: all 0.3s;
            border: 1px solid rgba(255,255,255,0.1);
            margin: 0 10px;
        }

        .scrolling-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .scrolling-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .scrolling-card h3 {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0,0,0,0.8));
            color: white;
            padding: 15px;
            margin: 0;
            font-size: 1.2rem;
            text-align: center;
        }
        .scroll-control {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 40px;
            height: 40px;
            background-color: rgba(255,255,255,0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s;
        }

        .scroll-control:hover {
            background-color: var(--honda-red);
            transform: translateY(-50%) scale(1.1);
        }

        .card-image-container {
            height: 220px;
            width: 100%;
            overflow: hidden;
            position: relative;
            background: rgba(0,0,0,0.3);
        }

        .card-image-container img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        .scroll-left {
            left: -20px;
        }

        .scroll-right {
            right: -20px;
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

       /* Updated Scrolling Card Styles */
        .scrolling-card {
            min-width: 100%;
            height: 300px;
            scroll-snap-align: start;
            background: rgba(0,0,0,0.2);
            border-radius: 10px;
            overflow: hidden;
            position: relative;
            transition: all 0.3s;
            border: 1px solid rgba(255,255,255,0.1);
            margin: 0 10px;
        }

        .card-image-container {
            height: 220px;
            width: 100%;
            overflow: hidden;
            position: relative;
            background: rgba(0,0,0,0.3);
        }

        .card-image-container img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        .scrolling-card h3 {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0,0,0,0.8));
            color: white;
            padding: 15px;
            margin: 0;
            font-size: 1.2rem;
            text-align: center;
        }


        .combined-section {
            padding: 4rem 0;
            background-color: var(--honda-gray-bg);
            margin-bottom: 70px;
        }

        .news-container {
            height: 100%;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .news-card {
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            padding: 1.5rem;
            transition: all 0.3s;
            border-left: 3px solid var(--honda-blue);
            flex: 1;
        }

        .news-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-left: 3px solid var(--honda-red);
        }

        .news-card h4 {
            margin-bottom: 0.5rem;
            color: var(--honda-light);
        }

        .news-card p {
            color: #aaa;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .news-card a {
            color: var(--honda-red);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s;
        }

        .news-card a:hover {
            color: var(--honda-light);
            text-decoration: underline;
        }

        /* Updated Video Section Styles */
        .video-container {
            display: flex;
            flex-direction: column;
            gap: 20px;
            height: 100%;
        }

        .video-playlist {
            position: relative;
            height: 150px;
        }

        .video-items {
            display: flex;
            overflow-x: auto;
            scroll-snap-type: x mandatory;
            scrollbar-width: none;
            gap: 15px;
            height: 100%;
        }

        .video-items::-webkit-scrollbar {
            display: none;
        }

        .video-item {
            min-width: 250px;
            scroll-snap-align: start;
            height: 100%;
        }

        .video-thumbnail {
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .video-thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .main-video {
            flex: 1;
            background: #000;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .main-video iframe {
            width: 100%;
            height: 100%;
            min-height: 300px;
            border: none;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .combined-section .row {
                flex-direction: column;
            }

            .scrolling-card {
                height: 250px;
            }

            .card-image-container {
                height: 180px;
            }

            .video-playlist {
                height: 120px;
            }

            .video-item {
                min-width: 200px;
            }
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
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutUs.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userLogin.jsp">User login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<!-- Back to Top Button -->
<div class="back-to-top">
    <i class="fas fa-arrow-up"></i>
</div>
    <div class="welcome-container">
        <div class="pulse-effect"></div>
        <div class="welcome-content">
            <h1 class="welcome-text">HONDA</h1>
            <p class="subtitle">The Power of Dreams. Since 1948, we've engineered motorcycles that deliver exhilarating performance, unmatched reliability, and the pure joy of riding.</p>
            <div class="d-flex flex-wrap justify-content-end">
                <button class="btn btn-primary-honda">View Motorcycles</button>
                <button class="btn btn-outline-honda">Book Test Ride</button>
            </div>
        </div>
    </div>


<section class="info-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="about-honda">
                    <h3 class="mb-4">About Honda</h3>
                    <p>Honda Motor Co., Ltd. is a Japanese public multinational conglomerate manufacturer of automobiles, motorcycles, and power equipment, headquartered in Minato, Tokyo, Japan.</p>
                    <p>Since 1948, Honda has been a leader in motorcycle innovation, producing some of the most reliable and high-performance bikes in the world.</p>
                    <p>Our philosophy of "The Power of Dreams" drives us to create products that improve the lives of people worldwide.</p>
                </div>
            </div>
            <div class="col-md-8">
                <div class="row">
                    <div class="col-md-6">
                        <h3 class="mb-4 text-center">New Launches</h3>
                        <div class="scrolling-section">
                            <div class="scroll-control scroll-left">
                                <i class="fas fa-chevron-left"></i>
                            </div>
                            <div class="scrolling-cards">
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/--standard-obd-2b1740150415645.jpg?q=80" alt="Hornet 2.0">
                                    </div>
                                    <h3>Hornet 2.0</h3>
                                </div>
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/664x374/n/bw/models/colors/honda-select-model-pearl-nightstar-black--obd2-1695014544654.png?q=80" alt="CB300F">
                                    </div>
                                    <h3>CB200X</h3>
                                </div>
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/128059/cb300f-right-side-view-2.png?isig=0&q=80" alt="CBR650R">
                                    </div>
                                    <h3>CB300F</h3>
                                </div>
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/664x374/n/9yu5nfb_1825017.jpg?q=80" alt="Shine 100">
                                    </div>
                                    <h3>CB350</h3>
                                </div>
                            </div>
                            <div class="scroll-control scroll-right">
                                <i class="fas fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h3 class="mb-4 text-center">Latest Updates</h3>
                        <div class="scrolling-section">
                            <div class="scroll-control scroll-left">
                                <i class="fas fa-chevron-left"></i>
                            </div>
                            <div class="scrolling-cards">
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/664x374/n/cw/ec/1/versions/honda-qc1-standard1732724431068.jpg?q=80" alt="Eco Tech">
                                    </div>
                                    <h3>Eco-Friendly Tech</h3>
                                </div>
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/310x174/bw/models/honda-pcx125.jpg?20190103151915&q=80" alt="2025 Models">
                                    </div>
                                    <h3>2025 Models Revealed</h3>
                                </div>
                                <div class="scrolling-card">
                                    <div class="card-image-container">
                                        <img src="https://imgd.aeplcdn.com/1056x594/n/p0at3fb_1834951.jpg?q=80" alt="Racing">
                                    </div>
                                    <h3>Racing Championship</h3>
                                </div>
                            </div>
                            <div class="scroll-control scroll-right">
                                <i class="fas fa-chevron-right"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="combined-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="text-center mb-4">Latest Honda News</h2>
                <div class="news-container">
                    <div class="news-card">
                        <h4>Honda Announces New Electric Motorcycle Lineup</h4>
                        <p>Honda reveals its ambitious plans for electric motorcycles with five new models set to launch by 2025.</p>
                        <a href="https://global.honda/newsroom/news/2023/c230628eng.html" target="_blank">Read more →</a>
                    </div>
                    <div class="news-card">
                        <h4>Honda Racing Dominates MotoGP Championship</h4>
                        <p>Honda's racing team secures another championship title with record-breaking performance.</p>
                        <a href="https://honda.racing/motogp" target="_blank">Read more →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <h2 class="text-center mb-4">Honda Videos</h2>
                <div class="video-container">
                    <div class="main-video">
                        <iframe width="560" height="315" src="https://www.youtube.com/embed/ylRh5X3eI0A?si=Zg4RBEc53RZsiVjS" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="why-honda-section py-5" style="background-color: #1a1a1a;">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center mb-4">
                <h2 class="text-uppercase" style="color: #e40521; font-family: 'Kanit', sans-serif;">Why Choose Honda</h2>
                <div class="border-bottom mx-auto" style="width: 100px; border-bottom: 3px solid #003399;"></div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="text-center p-4 h-100" style="background-color: #2a2a2a; border-radius: 10px; border-left: 4px solid #003399;">
                    <div class="mb-3">
                        <i class="fas fa-shield-alt fa-3x" style="color: #e40521;"></i>
                    </div>
                    <h4 style="color: #ffffff;">Advanced Security</h4>
                    <p style="color: #aaa;">Honda's cutting-edge security systems including HISS (Honda Ignition Security System) provide unparalleled protection against theft, giving you peace of mind.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="text-center p-4 h-100" style="background-color: #2a2a2a; border-radius: 10px; border-left: 4px solid #e40521;">
                    <div class="mb-3">
                        <i class="fas fa-cogs fa-3x" style="color: #003399;"></i>
                    </div>
                    <h4 style="color: #ffffff;">Proven Reliability</h4>
                    <p style="color: #aaa;">With decades of engineering excellence, Honda motorcycles are renowned for their durability and low maintenance, ensuring you spend more time riding than repairing.</p>
                </div>
            </div>

            <div class="col-md-4 mb-4">
                <div class="text-center p-4 h-100" style="background-color: #2a2a2a; border-radius: 10px; border-left: 4px solid #ffffff;">
                    <div class="mb-3">
                        <i class="fas fa-headset fa-3x" style="color: #e40521;"></i>
                    </div>
                    <h4 style="color: #ffffff;">Nationwide Support</h4>
                    <p style="color: #aaa;">Our extensive network of service centers across the country and 24/7 roadside assistance ensures help is always nearby when you need it.</p>
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
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Scrolling functionality for cards
        document.querySelectorAll('.scroll-right').forEach(button => {
            button.addEventListener('click', function() {
                const container = this.parentElement.querySelector('.scrolling-cards');
                container.scrollBy({ left: 300, behavior: 'smooth' });
            });
        });

        document.querySelectorAll('.scroll-left').forEach(button => {
            button.addEventListener('click', function() {
                const container = this.parentElement.querySelector('.scrolling-cards');
                container.scrollBy({ left: -300, behavior: 'smooth' });
            });
        });

        // Scrolling functionality for videos
        document.querySelector('.video-scroll-right').addEventListener('click', function() {
            const container = document.querySelector('.video-playlist');
            container.scrollBy({ left: 300, behavior: 'smooth' });
        });

        document.querySelector('.video-scroll-left').addEventListener('click', function() {
            const container = document.querySelector('.video-playlist');
            container.scrollBy({ left: -300, behavior: 'smooth' });
        });

        // Video selection functionality
        document.querySelectorAll('.video-item').forEach(item => {
            item.addEventListener('click', function() {
                const videoId = this.querySelector('img').alt.split(' ')[2]; // Simple example
                const iframe = document.querySelector('.main-video iframe');
                iframe.src = `https://www.youtube.com/embed/${videoId}?autoplay=1&mute=1`;
            });
        });
    </script>
</body>
</html>