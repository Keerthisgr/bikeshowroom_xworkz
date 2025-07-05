<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | Follow-up Management</title>
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
            --honda-light: #ffffff;
            --honda-dark: #333333;
            --honda-gray: #f5f5f5;
            --honda-gray-bg: #2a2a2a;
        }

        body {
            font-family: 'Rubik', sans-serif;
            background-color: var(--honda-gray);
            color: var(--honda-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: var(--honda-gray-bg) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
        }

        .navbar.scrolled {
            padding: 8px 0;
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

        .followup-header {
            background-color: var(--honda-blue);
            color: white;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 20px;
        }

        .followup-title {
            font-family: 'Rubik', sans-serif;
            font-weight: 600;
            color: white;
            margin: 0;
        }

        .followup-card {
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-top: 3px solid var(--honda-red);
            margin-bottom: 30px;
        }

        .followup-table {
            color: var(--honda-dark);
        }

        .followup-table thead {
            background-color: var(--honda-blue);
            color: white;
            position: sticky;
            top: 0;
        }

        .followup-table th {
            font-weight: 500;
            padding: 12px 15px;
        }

        .followup-table td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        .btn-honda-edit {
            background-color: var(--honda-blue);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-honda-edit:hover {
            background-color: #002266;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 51, 153, 0.2);
        }

        .btn-honda-view {
            background-color: var(--honda-red);
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn-honda-view:hover {
            background-color: #c0041c;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(228, 5, 33, 0.2);
        }

        .ride-option-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .test-ride {
            background-color: rgba(0, 51, 153, 0.1);
            color: var(--honda-blue);
            border: 1px solid var(--honda-blue);
        }

        .booking {
            background-color: rgba(228, 5, 33, 0.1);
            color: var(--honda-red);
            border: 1px solid var(--honda-red);
        }

        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
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

        /* Modal Styles - Only CSS improvements */
        .modal-header {
            background-color: var(--honda-blue);
            color: white;
            border-bottom: 2px solid var(--honda-red);
        }

        .modal-header .btn-close {
            filter: brightness(0) invert(1);
            opacity: 0.8;
        }

        .modal-header .btn-close:hover {
            opacity: 1;
        }

        .modal-content {
            border: none;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .modal-footer .btn {
            padding: 8px 16px;
            font-weight: 500;
            border-radius: 4px;
        }

        .modal-footer .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .modal-footer .btn-primary {
            background-color: var(--honda-blue);
            border-color: var(--honda-blue);
        }

        .modal-footer .btn-danger {
            background-color: var(--honda-red);
            border-color: var(--honda-red);
        }

        .form-control:focus {
            border-color: var(--honda-blue);
            box-shadow: 0 0 0 0.25rem rgba(0, 51, 153, 0.25);
        }

        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        #followupTable th {
            background-color: var(--honda-gray);
            position: sticky;
            top: 0;
        }

        @media (max-width: 768px) {
            .followup-table th,
            .followup-table td {
                padding: 8px 12px;
                font-size: 0.85rem;
            }

            .btn-honda-edit,
            .btn-honda-view {
                padding: 4px 8px;
                font-size: 0.75rem;
            }

            .footer-links {
                gap: 10px;
            }

            .modal-dialog {
                margin: 0.5rem auto;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navigation -->
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
                        <a class="nav-link active" href="adminLogin.jsp">Admin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5 pt-4">
        <div class="row">
            <div class="col-12">
                <div class="card followup-card">
                    <div class="card-header followup-header d-flex justify-content-between align-items-center">
                        <h3 class="followup-title">
                            <i class="fas fa-clipboard-list me-2"></i> Customer Follow-ups
                        </h3>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover followup-table">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Ride Option</th>
                                        <th>Model</th>
                                        <th>Showroom</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${followIt}" var="follow">
                                        <tr>
                                            <td>${follow.name}</td>
                                            <td>${follow.rideOption}
                                                <!-- <span class="ride-option-badge ${follow.rideOption eq 'Test Ride' ? 'test-ride' : 'booking'}">
                                                    ${follow.rideOption}
                                                </span> -->
                                            </td>
                                            <td>${follow.bikeModel}</td>
                                            <td>${follow.showroom}</td>
                                            <td>
                                                <button class="btn btn-honda-edit btn-sm editFollowupBtn"
                                                        data-bs-toggle="modal" data-bs-target="#editfollowup"
                                                        data-name="${follow.name}">
                                                    <i class="fas fa-edit me-1"></i> Edit
                                                </button>
                                                <button class="btn btn-honda-view btn-sm viewFollowupBtn"
                                                        data-bs-toggle="modal" data-bs-target="#viewfollowup"
                                                        data-name="${follow.name}">
                                                    <i class="fas fa-eye me-1"></i> View
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

   <!-- Edit Follow-up Modal with EL -->
    <div class="modal fade" id="editfollowup" tabindex="-1" aria-labelledby="editfollowupLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editfollowupLabel">
                        <i class="fas fa-edit me-2"></i> Edit Follow-up
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="followupeditsubmit" method="post">
                        <div class="mb-3">
                            <label for="followupName" class="form-label">Name</label>
                            <input type="text" id="followupName" class="form-control" name="name" value="${param.name}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="followupData" class="form-label">Status</label>
                            <input type="text" id="followupData" class="form-control" name="status" value="${param.rideOption}" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Message</label>
                            <input type="text" id="followupMsg" class="form-control" name="msg" value="${param.message}" readonly>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- View Follow-up Modal with EL -->
    <div class="modal fade" id="viewfollowup" tabindex="-1" aria-labelledby="viewfollowupLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="viewfollowupLabel">
                        <i class="fas fa-clipboard-check me-2"></i> Follow-up Details
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="table-responsive" style="max-height: 400px;">
                        <table class="table table-hover" id="followupTable">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${followupDetails}" var="detail">
                                    <tr>
                                        <td>${detail.name}</td>
                                        <td>${detail.date}</td>
                                        <td>${detail.time}</td>
                                        <td>${detail.message}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

        // Follow-up edit functionality (preserved from original)
        document.querySelectorAll('.editFollowupBtn').forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault();
                let name = this.getAttribute('data-name');
                fetch("http://localhost:8090/project_main/followupedit?name=" + encodeURIComponent(name))
                    .then(response => response.json())
                    .then(data => {
                        document.getElementById("followupName").value = data.name;
                        document.getElementById("followupData").value = data.rideOption;
                        var myModal = new bootstrap.Modal(document.getElementById("editfollowup"));
                        myModal.show();
                    })
                    .catch(error => console.error("Error fetching data:", error));
            });
        });

        // Follow-up view functionality (preserved from original)
        document.querySelectorAll('.viewFollowupBtn').forEach(item => {
            item.addEventListener('click', function(event) {
                event.preventDefault();
                let name = this.getAttribute('data-name');
                fetch("http://localhost:8090/project_main/followupview?name=" + encodeURIComponent(name))
                    .then(response => response.json())
                    .then(data => {
                        let tableBody = document.querySelector("#followupTable tbody");
                        tableBody.innerHTML = "";
                        data.forEach(user => {
                            let row = document.createElement("tr");
                            row.innerHTML = `
                                <td>${user.name}</td>
                                <td>${user.date}</td>
                                <td>${user.time}</td>
                                <td>${user.message}</td>
                            `;
                            tableBody.appendChild(row);
                        });
                        var myModal = new bootstrap.Modal(document.getElementById("viewfollowup"));
                        myModal.show();
                    })
                    .catch(error => console.error("Error fetching data:", error));
            });
        });
    </script>
</body>
</html>