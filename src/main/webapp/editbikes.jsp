<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - Edit Bike</title>
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

        /* Form Styles */
        .edit-form-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 40px;
            border-left: 4px solid var(--honda-blue);
        }

        .form-header {
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }

        .form-title {
            color: var(--honda-blue);
            font-weight: 700;
            font-family: 'Kanit', sans-serif;
        }

        .form-label {
            font-weight: 600;
            color: var(--honda-dark);
        }

        .form-control, .form-select {
            border-radius: 5px;
            padding: 10px 15px;
            border: 1px solid #ddd;
            transition: all 0.3s;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--honda-blue);
            box-shadow: 0 0 0 0.25rem rgba(0, 51, 153, 0.25);
        }

        .btn-save {
            background-color: var(--honda-blue);
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-save:hover {
            background-color: #002266;
            transform: translateY(-2px);
        }

        .btn-cancel {
            background-color: #6c757d;
            border: none;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-cancel:hover {
            background-color: #5a6268;
            transform: translateY(-2px);
        }

        /* Image Preview */
        .image-preview-container {
            margin-top: 20px;
            text-align: center;
        }

        .image-preview {
            max-width: 100%;
            max-height: 200px;
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 5px;
            margin-bottom: 10px;
        }

        /* Status Badges */
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
            margin-bottom: 1.5rem;
            position: relative;
        }

        .page-title::after {
            content: '';
            position: absolute;
            width: 80px;
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
                        <a class="nav-link" href="view-bikes.jsp">View Bikes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <div class="container">
            <h2 class="page-title"><i class="fas fa-motorcycle me-2"></i>Edit Bike Details</h2>

            <div class="edit-form-container">
                <div class="form-header">
                    <h3 class="form-title">Bike Information</h3>
                </div>

                <form action="updatebike" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${bike.id}">

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="bikename" class="form-label">Bike Name</label>
                                <input type="text" class="form-control" id="bikename" name="bikename"
                                       value="${bike.bikename}" required>
                            </div>

                            <div class="mb-3">
                                <label for="model" class="form-label">Model</label>
                                <input type="text" class="form-control" id="model" name="model"
                                       value="${bike.model}" required>
                            </div>

                            <div class="mb-3">
                                <label for="engine" class="form-label">Engine (cc)</label>
                                <input type="number" class="form-control" id="engine" name="engine"
                                       value="${bike.engine}" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="milage" class="form-label">Mileage (kmpl)</label>
                                <input type="number" step="0.1" class="form-control" id="milage" name="milage"
                                       value="${bike.milage}" required>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Price (₹)</label>
                                <input type="number" class="form-control" id="price" name="price"
                                       value="${bike.price}" required>
                            </div>

                            <div class="mb-3">
                                <label for="color" class="form-label">Available Colors</label>
                                <input type="text" class="form-control" id="color" name="color"
                                       value="${bike.color}" required>
                            </div>
                        </div>
                    </div>



                    <div class="d-flex justify-content-end gap-3">
                        <a href="view-bikes.jsp" class="btn btn-cancel text-white">Cancel</a>
                        <button type="submit" class="btn btn-save text-white">
                            <i class="fas fa-save me-1"></i> Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container text-center footer-content">
            <img src="https://s3-ap-southeast-1.amazonaws.com/assetsin.izmocars.com/userfiles/102585/03-08-2021/Honda%20logo.png" alt="Honda Logo" class="footer-logo">
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

        // Image preview function
        function previewImage(event, previewId) {
            const input = event.target;
            const preview = document.getElementById(previewId);
            const noImageTextId = previewId.replace('Preview', 'NoImageText');
            const noImageText = document.getElementById(noImageTextId);

            if (input.files && input.files[0]) {
                const reader = new FileReader();

                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                    if (noImageText) noImageText.style.display = 'none';
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>