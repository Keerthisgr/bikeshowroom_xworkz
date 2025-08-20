<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | My Profile</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            font-family: 'Arial', sans-serif;
            background-color: var(--honda-gray);
            color: var(--honda-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 80px;
        }

        .navbar {
            background-color: var(--honda-gray-bg) !important;
            border-bottom: 2px solid var(--honda-red);
            padding: 15px 0;
        }

        .navbar-brand img {
            height: 45px;
        }

        .nav-link {
            color: var(--honda-light) !important;
            font-weight: 500;
            margin: 0 12px;
        }

        .profile-container {
            max-width: 800px;
            margin: 20px auto;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
            flex: 1;
        }

        .profile-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }

        .profile-title {
            color: var(--honda-blue);
            font-weight: 600;
        }

        .btn-edit {
            background-color: var(--honda-blue);
            color: white;
            border: none;
            padding: 5px 15px;
            border-radius: 4px;
        }

        .btn-edit:hover {
            background-color: #00257a;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid var(--honda-gray);
            margin-bottom: 20px;
        }

        .profile-detail {
            margin-bottom: 15px;
        }

        .detail-label {
            font-weight: 600;
            color: var(--honda-dark);
            display: inline-block;
            width: 150px;
        }

        .edit-form {
            display: none;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-label {
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }

        .read-only-field {
            background-color: #f5f5f5;
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .btn-save {
            background-color: var(--honda-red);
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
            margin-right: 10px;
        }

        .btn-cancel {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 4px;
        }

        .profile-content {
            margin-top: 20px;
        }

        .section-title {
            color: var(--honda-blue);
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #eee;
        }

        /* New form styles */
        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -15px;
        }

        .form-col {
            flex: 1;
            padding: 0 15px;
            min-width: 250px;
        }

        .full-width {
            flex: 0 0 100%;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
        }

        .radio-option {
            display: flex;
            align-items: center;
        }

        .radio-option input[type="radio"] {
            margin-right: 8px;
        }

        .schedule-fields {
            margin-top: 15px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 5px;
            display: none;
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
            font-size: 1rem;
        }

        .copyright {
            color: #777;
            font-size: 0.9rem;
            margin-top: 1rem;
        }

        @media (max-width: 768px) {
            .profile-container {
                padding: 20px;
                margin: 15px;
            }

            .detail-label {
                width: 120px;
            }

            .radio-group {
                flex-direction: column;
                gap: 10px;
            }

            .footer-links {
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <!-- Header/Navigation -->
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
    <div class="container">
        <div class="profile-container">
            <div class="profile-header">
                <h2 class="profile-title">My Profile</h2>
                <button id="editProfileBtn" class="btn-edit">
                    <i class="fas fa-edit me-1"></i> Edit Profile
                </button>
            </div>

            <div class="profile-content">
                <!-- View Mode -->
                <div id="viewMode">
                    <div class="text-center">
                        <img src="getProfileImage?email=${user.email}"
                             alt="Profile Picture" class="profile-pic">
                    </div>

                    <h4 class="section-title">Personal Information</h4>

                    <div class="profile-detail">
                        <span class="detail-label">Full Name:</span>
                        <span>${user.fullName}</span>
                    </div>

                    <div class="profile-detail">
                        <span class="detail-label">Email:</span>
                        <span>${user.email}</span>
                    </div>

                    <div class="profile-detail">
                        <span class="detail-label">Phone:</span>
                        <span>${user.phone}</span>
                    </div>

                    <div class="profile-detail">
                        <span class="detail-label">Age:</span>
                        <span>${user.age}</span>
                    </div>

                    <div class="profile-detail">
                        <span class="detail-label">Address:</span>
                        <span>${user.address}</span>
                    </div>

                    <div class="profile-detail">
                        <span class="detail-label">Driving License:</span>
                        <span>${user.dlNumber}</span>
                    </div>
                </div>

                <!-- Edit Mode -->
                <div id="editMode" class="edit-form">
                    <form id="profileForm" action="updateprofile" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="userId" value="${user.id}">
                        <input type="hidden" name="email" value="${user.email}">
                        <div class="text-center mb-4">
                            <img src="getProfileImage?email=${user.email}" alt="Profile Picture" class="profile-pic">

                            <div class="mt-2">
                                <label for="profilePhoto" class="btn btn-sm btn-secondary">
                                    <i class="fas fa-camera me-1"></i> Change Photo
                                    <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*" style="display: none;">
                                </label>
                            </div>
                        </div>

                        <h4 class="section-title">Personal Information</h4>

                        <!-- Read-only fields -->
                        <div class="form-group">
                            <label class="form-label">Full Name</label>
                            <div class="read-only-field">${user.fullName}</div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Email</label>
                            <div class="read-only-field">${user.email}</div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Driving License</label>
                            <div class="read-only-field">${user.dlNumber}</div>
                        </div>

                        <!-- Editable fields -->
                        <div class="form-group">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phone" name="phone"
                                   value="${user.phone}" required pattern="[0-9]{10}">
                            <div class="invalid-feedback">Please enter a valid 10-digit phone number</div>
                        </div>

                        <div class="form-group">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" class="form-control" id="age" name="age"
                                   value="${user.age}" min="18" max="80" required>
                            <div class="invalid-feedback">You must be at least 18 years old</div>
                        </div>

                        <div class="form-group">
                            <label for="address" class="form-label">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3" required>${user.address}</textarea>
                            <div class="invalid-feedback">Please enter your complete address</div>
                        </div>

                        <!-- New form fields -->
                        <h4 class="section-title" style="margin-top: 30px;">Test Ride Preferences</h4>

                        <div class="form-row">
                            <div class="form-col">
                                <div class="form-group">
                                    <label for="showroom" class="form-label">Preferred Showroom</label>
                                    <select class="form-control" id="showroom" name="showroom" required>
                                        <option value="" disabled selected>Select showroom</option>
                                        <c:forEach items="${branchdata}" var="branch">
                                            <option value="${branch.branchName}" ${user.showroom == branch.branchName ? 'selected' : ''}>${branch.branchName}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select a showroom</div>
                                </div>
                            </div>
                            <div class="form-col">
                                <div class="form-group">
                                    <label for="bikeModel" class="form-label">Preferred Bike Model</label>
                                    <select class="form-control" id="bikeModel" name="bikeModel" required>
                                        <option value="" disabled selected>Select bike model</option>
                                        <c:forEach items="${bikeModels}" var="model">
                                            <option value="${model.model}" ${user.bikeModel == model.model ? 'selected' : ''}>${model.model}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="invalid-feedback">Please select a bike model</div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Test Ride Option</label>
                            <div class="radio-group">
                                <div class="radio-option">
                                    <input type="radio" id="bookNow" name="testRideOption" value="bookNow" ${user.testRideOption != 'scheduleLater' ? 'checked' : ''}>
                                    <label for="bookNow">Book Ride Now</label>
                                </div>
                                <div class="radio-option">
                                    <input type="radio" id="scheduleLater" name="testRideOption" value="scheduleLater" ${user.testRideOption == 'scheduleLater' ? 'checked' : ''}>
                                    <label for="scheduleLater">Schedule Test Ride</label>
                                </div>
                            </div>

                            <div id="scheduleFields" class="schedule-fields" style="${user.testRideOption == 'scheduleLater' ? 'display: block;' : ''}">
                                <div class="form-row">
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="rideDate" class="form-label">Preferred Date</label>
                                            <input type="date" class="form-control" id="rideDate" name="rideDate" value="${user.rideDate}">
                                            <div class="invalid-feedback">Please select a valid future date</div>
                                        </div>
                                    </div>
                                    <div class="form-col">
                                        <div class="form-group">
                                            <label for="rideTime" class="form-label">Time Slot</label>
                                            <select class="form-control" id="rideTime" name="rideTime">
                                                <option value="" disabled selected>Select time slot</option>
                                                <option value="09:00 AM - 10:00 AM" ${user.rideTime == '09:00 AM - 10:00 AM' ? 'selected' : ''}>09:00 AM - 10:00 AM</option>
                                                <option value="10:00 AM - 11:00 AM" ${user.rideTime == '10:00 AM - 11:00 AM' ? 'selected' : ''}>10:00 AM - 11:00 AM</option>
                                                <option value="11:00 AM - 12:00 PM" ${user.rideTime == '11:00 AM - 12:00 PM' ? 'selected' : ''}>11:00 AM - 12:00 PM</option>
                                                <option value="12:00 PM - 01:00 PM" ${user.rideTime == '12:00 PM - 01:00 PM' ? 'selected' : ''}>12:00 PM - 01:00 PM</option>
                                                <option value="02:00 PM - 03:00 PM" ${user.rideTime == '02:00 PM - 03:00 PM' ? 'selected' : ''}>02:00 PM - 03:00 PM</option>
                                                <option value="03:00 PM - 04:00 PM" ${user.rideTime == '03:00 PM - 04:00 PM' ? 'selected' : ''}>03:00 PM - 04:00 PM</option>
                                                <option value="04:00 PM - 05:00 PM" ${user.rideTime == '04:00 PM - 05:00 PM' ? 'selected' : ''}>04:00 PM - 05:00 PM</option>
                                            </select>
                                            <div class="invalid-feedback">Please select a time slot</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end mt-4">
                            <button type="button" id="cancelEditBtn" class="btn-cancel">
                                <i class="fas fa-times me-1"></i> Cancel
                            </button>
                            <button type="submit" class="btn-save">
                                <i class="fas fa-save me-1"></i> Save Changes
                            </button>
                        </div>
                    </form>
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

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle between view and edit modes
            const editProfileBtn = document.getElementById('editProfileBtn');
            const cancelEditBtn = document.getElementById('cancelEditBtn');
            const viewMode = document.getElementById('viewMode');
            const editMode = document.getElementById('editMode');

            editProfileBtn.addEventListener('click', function() {
                viewMode.style.display = 'none';
                editMode.style.display = 'block';
                window.scrollTo({ top: 0, behavior: 'smooth' });
            });

            cancelEditBtn.addEventListener('click', function() {
                viewMode.style.display = 'block';
                editMode.style.display = 'none';
            });

            // Preview profile picture before upload
            const profilePhotoInput = document.getElementById('profilePhoto');
            const profileImagePreview = document.getElementById('profileImagePreview');

            profilePhotoInput.addEventListener('change', function(e) {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        profileImagePreview.src = e.target.result;
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });

            // Toggle schedule fields based on radio selection
            const bookNowRadio = document.getElementById('bookNow');
            const scheduleLaterRadio = document.getElementById('scheduleLater');
            const scheduleFields = document.getElementById('scheduleFields');

            function toggleScheduleFields() {
                if (scheduleLaterRadio.checked) {
                    scheduleFields.style.display = 'block';
                } else {
                    scheduleFields.style.display = 'none';
                }
            }

            bookNowRadio.addEventListener('change', toggleScheduleFields);
            scheduleLaterRadio.addEventListener('change', toggleScheduleFields);

            // Form validation
            document.getElementById('profileForm').addEventListener('submit', function(e) {
                let isValid = true;

                // Validate phone
                const phoneInput = document.getElementById('phone');
                const phoneRegex = /^[0-9]{10}$/;
                if (!phoneRegex.test(phoneInput.value)) {
                    phoneInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    phoneInput.classList.remove('is-invalid');
                }

                // Validate age
                const ageInput = document.getElementById('age');
                const age = parseInt(ageInput.value);
                if (isNaN(age) || age < 18 || age > 80) {
                    ageInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    ageInput.classList.remove('is-invalid');
                }

                // Validate address
                const addressInput = document.getElementById('address');
                if (!addressInput.value.trim()) {
                    addressInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    addressInput.classList.remove('is-invalid');
                }

                // Validate showroom
                const showroomInput = document.getElementById('showroom');
                if (!showroomInput.value) {
                    showroomInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    showroomInput.classList.remove('is-invalid');
                }

                // Validate bike model
                const bikeModelInput = document.getElementById('bikeModel');
                if (!bikeModelInput.value) {
                    bikeModelInput.classList.add('is-invalid');
                    isValid = false;
                } else {
                    bikeModelInput.classList.remove('is-invalid');
                }

                // Validate schedule fields if visible
                if (scheduleFields.style.display === 'block') {
                    const rideDateInput = document.getElementById('rideDate');
                    if (!rideDateInput.value) {
                        rideDateInput.classList.add('is-invalid');
                        isValid = false;
                    } else {
                        rideDateInput.classList.remove('is-invalid');
                    }

                    const rideTimeInput = document.getElementById('rideTime');
                    if (!rideTimeInput.value) {
                        rideTimeInput.classList.add('is-invalid');
                        isValid = false;
                    } else {
                        rideTimeInput.classList.remove('is-invalid');
                    }
                }

                if (!isValid) {
                    e.preventDefault();
                    // Scroll to first invalid field
                    const firstInvalid = document.querySelector('.is-invalid');
                    if (firstInvalid) {
                        firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    }
                }
            });

            // Initialize the schedule fields visibility
            toggleScheduleFields();
        });
    </script>
</body>
</html>