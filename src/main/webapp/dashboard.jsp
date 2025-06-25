<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda Showroom - Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            --sidebar-width: 250px;
        }

        body {
            font-family: 'Rubik', sans-serif;
            background-color: var(--honda-silver);
            overflow-x: hidden;
        }

        /* Navbar Styles */
        .navbar {
            background-color: rgba(42, 42, 42, 0.95) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            z-index: 1100;
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

        /* Sidebar - Using your color scheme */
        .sidebar {
            width: var(--sidebar-width);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 13px;
            background: linear-gradient(rgba(42, 42, 42, 0.95), rgba(42, 42, 42, 0.95));
            color: var(--honda-light);
            transition: all 0.3s;
            z-index: 1000;
            border-right: 2px solid var(--honda-red);
            margin-top: 70px;
        }

        .sidebar-header {
            padding: 20px;
            background-color: rgba(0,0,0,0.2);
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-menu {
            padding: 20px 0;
        }

        .sidebar-menu a {
            color: rgba(255,255,255,0.8);
            display: block;
            padding: 12px 20px;
            text-decoration: none;
            transition: all 0.3s;
            border-left: 3px solid transparent;
        }


        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            background-color: rgba(0,0,0,0.2);
            color: var(--honda-light);
            border-left: 3px solid var(--honda-red);
        }

        .sidebar-menu i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 20px;
            transition: all 0.3s;
            margin-top: 70px;
        }

        /* Cards - Using your color scheme */
        .dashboard-card {
            background: var(--honda-light);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            transition: all 0.3s;
            border-left: 4px solid var(--honda-blue);
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px rgba(0,0,0,0.1);
            background-color: #f0f5ff;
        }

        .card-icon {
            font-size: 2rem;
            color: var(--honda-blue);
            margin-bottom: 15px;
        }

        .card-value {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--honda-blue);
        }

        .card-title {
            color: var(--honda-dark);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Forms - Styled to match your theme */
        .form-container {
            background: var(--honda-light);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            display: none; /* Hide all forms by default */
            animation: fadeIn 0.5s ease-out;
        }

        .form-container.active {
            display: block; /* Show active form */
        }

        .form-title {
            color: var(--honda-blue);
            border-bottom: 2px solid var(--honda-red);
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .btn-honda-primary {
            background-color: var(--honda-blue);
            color: var(--honda-light);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-honda-primary:hover {
            background-color: #002266;
            color: var(--honda-light);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 51, 153, 0.3);
        }

        .btn-honda-danger {
            background-color: var(--honda-red);
            color: var(--honda-light);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s;
        }

        .btn-honda-danger:hover {
            background-color: #c0041c;
            color: var(--honda-light);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(228, 5, 33, 0.3);
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 992px) {
            .sidebar {
                left: -var(--sidebar-width);
                margin-top: 60px;
            }

            .main-content {
                margin-left: 0;
                margin-top: 60px;
            }

            .sidebar.active {
                left: 0;
            }

            .main-content.active {
                margin-left: var(--sidebar-width);
            }
        }

        @media (max-width: 768px) {
            .navbar-brand img {
                height: 35px;
            }

            .sidebar {
                width: 220px;
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
                        <a class="nav-link active" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h4><i class="fas fa-motorcycle"></i> Dashboard</h4>
        </div>
        <div class="sidebar-menu">
            <a href="#" class="active" id="dashboard-link"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="#add-bike" id="bike-link"><i class="fas fa-plus-circle"></i> Add Bike</a>
            <a href="#add-branch" id="branch-link"><i class="fas fa-map-marker-alt"></i> Add Branch</a>
            <a href="#add-showroom" id="showroom-link"><i class="fas fa-store"></i> Add Showroom</a>
            <a href="#customers" id="customers-link"><i class="fas fa-users"></i> Customers</a>
            <a href="#settings" id="settings-link"><i class="fas fa-cog"></i> Settings</a>
            <a href="#logout" id="logout-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Dashboard Content -->
        <div class="container-fluid mt-4">
            <!-- Summary Cards - Always visible on dashboard -->
            <div class="row" id="dashboard-cards">
                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="card-icon"><i class="fas fa-motorcycle"></i></div>
                        <h3 class="card-title">${bike}</h3>
                        <div class="card-title">Bikes</div><a href="bikes" class="card-title">View</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="card-icon"><i class="fas fa-map-marker-alt"></i></div>
                        <h3 class="card-title">${branch}</h3>
                        <div class="card-title">Branches</div>
                         <a href="branches" class="card-title">View</a>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="card-icon"><i class="fas fa-store"></i></div>
                    </br>
                        <h3 class="card-title">${showroomBikes}</h3>

                        <div class="card-title">Showrooms</div>
                        <a href="branches" class="card-title">
                        </a>
                        <div>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="dashboard-card">
                        <div class="card-icon"><i class="fas fa-users"></i></div>
                    </br>
                        <h3 class="card-title">21</h3>
                        <div class="card-title">Today's Visitors</div>
                        <a href="branches" class="card-title"></a>
                    </div>
                </div>
            </div>

<!-- Add Bike Form -->
<div class="row mt-4">
    <div class="col-md-12">
        <div class="form-container" id="bike-form">
            <h4 class="form-title"><i class="fas fa-plus-circle"></i> Add New Bike</h4>
            <form action="addnewbike" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="bikeName" class="form-label">Bike Name</label>
                            <input type="text" class="form-control" id="bikeName" name="bikename" placeholder="e.g., Hornot 2.0" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Model Name</label>
                            <input type="text" class="form-control" name="model" placeholder="e.g., Honda CB350">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="bikeEngine" class="form-label">Engine</label>
                            <input type="number" class="form-control" name="engine" id="bikeEngine" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="bikeMileage" class="form-label">Mileage</label>
                            <input type="number" class="form-control" name="milage" id="bikeMileage" placeholder="Ex: 28 kmpl" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Price (₹)</label>
                            <input type="number" name="price" class="form-control" placeholder="200000">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="bikeColor" class="form-label">Available Colors</label>
                            <input type="text" class="form-control" name="color" id="bikeColor">
                        </div><!-- Empty column for alignment or you can add another field here -->
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Front Image</label>
                            <input type="file" name="frontview" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Back Image</label>
                            <input type="file" name="backview" class="form-control">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Left Image</label>
                            <input type="file" class="form-control" name="leftview">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Right Image</label>
                            <input type="file" class="form-control" name="rightview">
                        </div>
                    </div>
                </div>



                <button type="submit" class="btn btn-honda-primary">Add Bike</button>
            </form>
        </div>
    </div>
</div>
            <!-- Add Branch Form -->
<div class="row mt-4">
    <div class="col-md-12">
        <div class="form-container" id="branch-form">
            <h4 class="form-title"><i class="fas fa-map-marker-alt"></i> Add New Branch</h4>
            <form action="addbranch" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Branch Name</label>
                            <input type="text" class="form-control"  name="branchName" placeholder="e.g., Honda Bangalore East">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" class="form-control" name="location" placeholder="Enter address">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Contact Number</label>
                            <input type="tel" class="form-control" name="number" placeholder="+91 XXXXXXXXXX">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label">Manager</label>
                            <input type="text" class="form-control" name="managerName" placeholder="Manager name">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">

                        <div class="mb-3">
                            <label class="form-label">Image</label>
                            <input type="file" class="form-control" name="image">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="branchStatus" class="form-label">Status</label>
                            <select class="form-control" id="branchStatus" name="status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                                <option value="maintenance">Maintenance</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="branchEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="branchEmail" placeholder="branch@example.com">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!-- Empty column for potential additional field -->
                    </div>
                </div>

                <button type="submit" class="btn btn-honda-primary">Add Branch</button>
            </form>
        </div>
    </div>
</div>

            <!-- Add Showroom Form -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="form-container" id="showroom-form">
                    <h4 class="form-title"><i class="fas fa-store"></i> Add New Showroom</h4>
                     <form action="addbikeandbranchtoshowroom" method="post" >
                                           <div class="row">
                                               <div class="col-md-6">

                                                   <div class="mb-3">
                                                       <label for="showroomBranch" class="form-label">Select Branch</label>
                                                       <select class="form-select" id="showroomBranch" name="branchName" required>
                                                           <option value="">-- Select Branch --</option>
                                                           <c:forEach items="${notfullbranchlist}" var="totalbranches">
                                                               <option value="${totalbranches.id}">${totalbranches.branchName}</option>
                                                           </c:forEach>
                                                       </select>
                                                   </div>
                                                   <div class="mb-3">
                                                           <label for="showroomBike" class="form-label">Select Bike</label>
                                                           <select class="form-select" id="showroomBike" name="model" required>
                                                                  <option value="">-- Select Bike --</option>
                                                                  <c:forEach items="${unsoldbikelist}" var="totalbikes">
                                                                  <option value="${totalbikes.id}">${totalbikes.model}</option>
                                                                    </c:forEach>
                                                          </select>
                                                   </div>
                                               </div>
                                           </div>

                                           <div class="modal-footer">
                                               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                               <button type="submit" class="btn btn-gold">Add to Showroom</button>
                                           </div>
                                       </form>
                </div>
            </div>
        </div>
    </div>
</div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Initialize - Show dashboard by default
        document.addEventListener('DOMContentLoaded', function() {
            showDashboard();

            // Add click event listeners to sidebar links
            document.getElementById('dashboard-link').addEventListener('click', function(e) {
                e.preventDefault();
                showDashboard();
                setActiveLink(this);
            });

            document.getElementById('bike-link').addEventListener('click', function(e) {
                e.preventDefault();
                showForm('bike-form');
                setActiveLink(this);
            });

            document.getElementById('branch-link').addEventListener('click', function(e) {
                e.preventDefault();
                showForm('branch-form');
                setActiveLink(this);
            });

            document.getElementById('showroom-link').addEventListener('click', function(e) {
                e.preventDefault();
                showForm('showroom-form');
                setActiveLink(this);
            });

            document.getElementById('customers-link').addEventListener('click', function(e) {
                e.preventDefault();
                // You can add functionality for customers here
                setActiveLink(this);
            });

            document.getElementById('settings-link').addEventListener('click', function(e) {
                e.preventDefault();
                // You can add functionality for settings here
                setActiveLink(this);
            });

            document.getElementById('logout-link').addEventListener('click', function(e) {
                e.preventDefault();
                // You can add logout functionality here
                setActiveLink(this);
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

        // Function to show dashboard cards and hide all forms
        function showDashboard() {
            document.getElementById('dashboard-cards').style.display = 'flex';
            const forms = document.querySelectorAll('.form-container');
            forms.forEach(form => {
                form.style.display = 'none';
            });
        }

        // Function to show specific form and hide others
        function showForm(formId) {
            document.getElementById('dashboard-cards').style.display = 'none';
            const forms = document.querySelectorAll('.form-container');
            forms.forEach(form => {
                if (form.id === formId) {
                    form.style.display = 'block';
                } else {
                    form.style.display = 'none';
                }
            });

            // Scroll to the form
            document.getElementById(formId).scrollIntoView({ behavior: 'smooth' });
        }

        // Function to set active link in sidebar
        function setActiveLink(clickedLink) {
            const links = document.querySelectorAll('.sidebar-menu a');
            links.forEach(link => {
                link.classList.remove('active');
            });
            clickedLink.classList.add('active');
        }
    </script>
</body>
</html>