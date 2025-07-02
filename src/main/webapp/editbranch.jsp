<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - Edit Branch</title>
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

        /* Toast Notification Styles */
        #successToast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1100;
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
                        <a class="nav-link" href="view-branches.jsp">View Branches</a>
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
            <h2 class="page-title"><i class="fas fa-edit me-2"></i>Edit Branch</h2>

            <div class="edit-form-container">
                <div class="form-header">
                    <h3 class="form-title">Branch Information</h3>
                </div>

                <form action="updatebranch" method="post" enctype="multipart/form-data" id="branchForm">
                    <input type="hidden" name="id" value="${branch.id}">

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="branchName" class="form-label">Branch Name</label>
                                <input type="text" class="form-control" id="branchName" name="branchName"
                                       value="${branch.branchName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="location" class="form-label">Location</label>
                                <input type="text" class="form-control" id="location" name="location"
                                       value="${branch.location}" required>
                            </div>

                            <div class="mb-3">
                                <label for="number" class="form-label">Contact Number</label>
                                <input type="tel" class="form-control" id="number" name="number"
                                       value="${branch.number}" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="managerName" class="form-label">Manager Name</label>
                                <input type="text" class="form-control" id="managerName" name="managerName"
                                       value="${branch.managerName}" required>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                       value="${branch.email}" required>
                            </div>

                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="active" ${branch.status == 'active' ? 'selected' : ''}>Active</option>
                                    <option value="inactive" ${branch.status == 'inactive' ? 'selected' : ''}>Inactive</option>
                                    <option value="maintenance" ${branch.status == 'maintenance' ? 'selected' : ''}>Under Maintenance</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-end gap-3">
                        <a href="view-branches.jsp" class="btn btn-cancel text-white">Cancel</a>
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

    <!-- Success Toast Notification -->
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
        <div id="successToast" class="toast align-items-center text-white bg-success border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    <i class="fas fa-check-circle me-2"></i> Branch data saved successfully!
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
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

        // Form submission handler
        document.getElementById('branchForm').addEventListener('submit', function(e) {
            // Show success toast
            const successToast = new bootstrap.Toast(document.getElementById('successToast'));
            successToast.show();

            // Continue with form submission
            return true;
        });

        // Check if we should show the toast from a redirect
        document.addEventListener('DOMContentLoaded', function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('saved')) {
                const successToast = new bootstrap.Toast(document.getElementById('successToast'));
                successToast.show();
            }
        });
    </script>
</body>
</html>