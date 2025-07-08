<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honda | User Registration</title>
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

        /* Registration Form Styles */
        .registration-section {
            padding: 5rem 0;
            background-color: var(--honda-gray-bg);
        }

        .registration-container {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 15px;
            padding: 3rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            border-top: 4px solid var(--honda-red);
            margin-bottom: 3rem;
        }

        .registration-title {
            font-family: 'Kanit', sans-serif;
            color: var(--honda-light);
            font-size: 2.5rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }

        .registration-title::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 4px;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(90deg, var(--honda-blue), var(--honda-red));
            border-radius: 2px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            color: var(--honda-light);
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: block;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--honda-light);
            padding: 12px 15px;
            border-radius: 8px;
            transition: all 0.3s;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: var(--honda-blue);
            color: var(--honda-light);
            box-shadow: 0 0 0 0.25rem rgba(0, 51, 153, 0.25);
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        /* Improved dropdown styling */
        select.form-control {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23ffffff' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
            background-size: 16px 12px;
        }

        select.form-control option {
            background-color: var(--honda-gray-bg);
            color: var(--honda-light);
            padding: 10px;
        }

        /* Validation styles */
        .is-invalid {
            border-color: var(--honda-red) !important;
        }

        .invalid-feedback {
            color: var(--honda-red);
            font-size: 0.85rem;
            margin-top: 0.25rem;
            display: none;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .form-col {
            padding-right: 15px;
            padding-left: 15px;
            flex: 0 0 50%;
            max-width: 50%;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            margin-bottom: 1.5rem;
        }

        .radio-option {
            display: flex;
            align-items: center;
        }

        .radio-option input[type="radio"] {
            margin-right: 8px;
            accent-color: var(--honda-red);
        }

        .radio-option label {
            color: var(--honda-light);
            cursor: pointer;
        }

        .schedule-fields {
            display: none;
            margin-top: 1rem;
            padding: 1rem;
            background-color: rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            border-left: 3px solid var(--honda-blue);
        }

        .btn-register {
            background: linear-gradient(135deg, var(--honda-blue), #0044cc);
            color: var(--honda-light);
            font-weight: 700;
            padding: 14px 36px;
            border-radius: 30px;
            border: none;
            letter-spacing: 1px;
            text-transform: uppercase;
            font-size: 0.9rem;
            transition: all 0.4s;
            display: block;
            width: 100%;
            margin-top: 1.5rem;
        }

        .btn-register:hover {
            background: linear-gradient(135deg, #0044cc, var(--honda-blue));
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 51, 153, 0.4);
        }

        .btn-register:disabled {
            background: #666;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        /* Full width fields */
        .full-width {
            flex: 0 0 100%;
            max-width: 100%;
        }

        /* Footer Styles */
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

        @media (max-width: 768px) {
            .form-col {
                flex: 0 0 100%;
                max-width: 100%;
            }

            .registration-container {
                padding: 2rem;
            }

            .registration-title {
                font-size: 2rem;
            }

            .radio-group {
                flex-direction: column;
                gap: 10px;
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
                        <a class="nav-link" href="aboutUs.jsp">About us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="userRegistration.jsp">User Registration</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="adminLogin.jsp">Admin</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="registration-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="registration-container">
                        <h2 class="registration-title">User Registration</h2>
                        <form id="registrationForm" action="userregistration" method="post" enctype="multipart/form-data">
                            <!-- Personal Information Section -->
                            <div class="form-row">
                                <div class="form-col">
                                    <div class="form-group">
                                    <span id="nameerror" class="errormessage"></span><br>
                                     <label for="fullName" class="form-label">Full Name</label>
                                     <input type="text" class="form-control" id="fullName" onChange="checkFullNameUnique()" name="fullName" placeholder="Enter your full name" required>
                                     </div>
                                </div>
                                <div class="form-col">
                                    <div class="form-group">
                                    <span id="emailerror" class="errormessage"></span><br>
                                    <label for="email" class="form-label">Email ID</label>
                                                                            <input type="email" class="form-control" id="email" onChange="checkEmailUnique()" name="email" placeholder="Enter email address" required>

                                        </div>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-col">
                                    <div class="form-group">
                                    <span id="phoneerror" class="errormessage"></span><br>
                                    <label for="phone" class="form-label">Phone Number</label>
                                                                            <input type="tel" class="form-control" onChange="checkPhoneUnique()" id="phone" name="phone" placeholder="Enter phone number" required>

                                       </div>
                                </div>
                                <div class="form-col">
                                    <div class="form-group">
                                       <span id="ageerror" class="errormessage"></span><br>
                                       <label for="age" class="form-label">Age</label>
                                       <input type="number" class="form-control" id="age" name="age"
                                              placeholder="Enter your age" min="18" max="80" onChange="checkAgeValid()" required>
                                        </div>
                                </div>
                            </div>

                            <!-- Address (full width) -->
                            <div class="form-row">
                                <div class="form-col full-width">
                                    <div class="form-group">
                                        <label for="address" class="form-label">Address</label>
                                        <textarea class="form-control" id="address" name="address" rows="3"
                                                  placeholder="Enter your full address (House No, Street, City, State, Pincode)" required></textarea>
                                        <div class="invalid-feedback">Please enter your complete address</div>
                                    </div>
                                </div>
                            </div>

                            <!-- License and Showroom Info -->
                            <div class="form-row">
                                <div class="form-col">
                                    <div class="form-group">
                                    <span id="dlnoerror" class="errormessage"></span><br>
                                    <label for="dlNumber" class="form-label">Driving License No.</label>
                                                                            <input type="text" class="form-control" id="dlNumber" name="dlNumber" onChange="checkDLNumberUnique()" placeholder="Enter DL number" required>

                                    </div>
                                </div>
                                <div class="form-col">
                                    <div class="form-group">
                                        <label for="showroom" class="form-label">Preferred Showroom</label>
                                        <select class="form-control" id="showroom" name="showroom" onChange="fetchBikes()" required>
                                            <option value="" disabled selected>Select showroom</option>
                                            <c:forEach items="${branchdata}" var="branch">
                                                <option value="${branch}">${branch}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a showroom</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Bike Model Selection -->
                            <div class="form-row">
                                <div class="form-col full-width">
                                    <div class="form-group">
                                        <label for="bikeModel" class="form-label">Select Bike Model</label>
                                        <select class="form-control" id="bikeModel" name="bikeModel" required>
                                            <option value="" disabled selected>Select bike model</option>
                                            <c:forEach items="${bikeModels}" var="model">
                                                <option value="${model}">${model}</option>
                                            </c:forEach>
                                        </select>
                                        <div class="invalid-feedback">Please select a bike model</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Test Ride Options -->
                            <div class="form-row">
                                <div class="form-col full-width">
                                    <div class="form-group">
                                        <label class="form-label">Test Ride Option</label>
                                        <div class="radio-group">
                                            <div class="radio-option">
                                                <input type="radio" id="bookNow" name="testRideOption" value="bookNow" checked>
                                                <label for="bookNow">Book Ride Now</label>
                                            </div>
                                            <div class="radio-option">
                                                <input type="radio" id="scheduleLater" name="testRideOption" value="scheduleLater">
                                                <label for="scheduleLater">Schedule Test Ride</label>
                                            </div>
                                        </div>

                                        <div id="scheduleFields" class="schedule-fields">
                                            <div class="form-row">
                                                <div class="form-col">
                                                    <div class="form-group">
                                                        <label for="rideDate" class="form-label">Preferred Date</label>
                                                        <input type="date" class="form-control" id="rideDate" name="rideDate">
                                                        <div class="invalid-feedback">Please select a valid future date</div>
                                                    </div>
                                                </div>
                                                <div class="form-col">
                                                    <div class="form-group">
                                                        <label for="rideTime" class="form-label">Time Slot</label>
                                                        <select class="form-control" id="rideTime" name="rideTime">
                                                            <option value="" disabled selected>Select time slot</option>
                                                            <option value="09:00 AM - 10:00 AM">09:00 AM - 10:00 AM</option>
                                                            <option value="10:00 AM - 11:00 AM">10:00 AM - 11:00 AM</option>
                                                            <option value="11:00 AM - 12:00 PM">11:00 AM - 12:00 PM</option>
                                                            <option value="12:00 PM - 01:00 PM">12:00 PM - 01:00 PM</option>
                                                            <option value="02:00 PM - 03:00 PM">02:00 PM - 03:00 PM</option>
                                                            <option value="03:00 PM - 04:00 PM">03:00 PM - 04:00 PM</option>
                                                            <option value="04:00 PM - 05:00 PM">04:00 PM - 05:00 PM</option>
                                                        </select>
                                                        <div class="invalid-feedback">Please select a time slot</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-register" id="registerBtn">Register Now</button>
                        </form>
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

        // Initialize data for dropdowns (would normally come from database)
        // This is just for demonstration - in real app, this would be set in the controller
        const showrooms = [
            "Honda West Delhi",
            "Honda East Delhi",
            "Honda North Delhi",
            "Honda South Delhi",
            "Honda Central Delhi"
        ];

        const bikeModels = [
            "Honda CB300R",
            "Honda CBR650R",
            "Honda CB500X",
            "Honda Rebel 500",
            "Honda Africa Twin",
            "Honda Gold Wing"
        ];

        const timeSlots = [
            "09:00 AM - 11:00 AM",
            "11:00 AM - 01:00 PM",
            "02:00 PM - 04:00 PM",
            "04:00 PM - 06:00 PM"
        ];

        // Show/hide schedule fields based on radio selection
        const bookNowRadio = document.getElementById('bookNow');
        const scheduleLaterRadio = document.getElementById('scheduleLater');
        const scheduleFields = document.getElementById('scheduleFields');
        const registerBtn = document.getElementById('registerBtn');

        // Function to validate schedule fields when visible
        function validateScheduleFields() {
            if (scheduleLaterRadio.checked) {
                const dateInput = document.getElementById('rideDate');
                const timeInput = document.getElementById('rideTime');

                const date = dateInput.value;
                const time = timeInput.value;

                if (!date || !time) {
                    registerBtn.disabled = true;
                    return false;
                }

                // Validate date is in the future
                const today = new Date();
                const selectedDate = new Date(date);
                today.setHours(0, 0, 0, 0);

                if (selectedDate <= today) {
                    dateInput.classList.add('is-invalid');
                    document.querySelector('#rideDate + .invalid-feedback').style.display = 'block';
                    registerBtn.disabled = true;
                    return false;
                } else {
                    dateInput.classList.remove('is-invalid');
                    document.querySelector('#rideDate + .invalid-feedback').style.display = 'none';
                }

                registerBtn.disabled = false;
                return true;
            }

            // If Book Now is selected, enable it anyway
            registerBtn.disabled = false;
            return true;
        }


        // Toggle schedule fields visibility
        function toggleScheduleFields() {
            if (scheduleLaterRadio.checked) {
                scheduleFields.style.display = 'block';
                // Set minimum date to tomorrow
                const tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1);
                document.getElementById('rideDate').min = tomorrow.toISOString().split('T')[0];
                // Disable register button until fields are filled
                registerBtn.disabled = true;
            } else {
                scheduleFields.style.display = 'none';
                registerBtn.disabled = false;
            }
        }
        function checkFullNameUnique() {
        var name=document.getElementById('fullName').value;
                    const patter=/^[A-Z][a-z]*$/;
                    if(patter.test(name)){
                    document.getElementById('nameerror').innerHTML="";
                            if (name!=="") {
                                 var xhttp = new XMLHttpRequest();
                                 xhttp.open("GET","http://localhost:8080/bikeshowroom_xworkz/name?fullName="+name);
                                 xhttp.send();

                                 xhttp.onload = function(){
                                 document.getElementById("nameerror").innerHTML = this.responseText;
                              }
                          }

                    }else{
                        document.getElementById('nameerror').innerHTML="Please enter a valid name (first letter capital, only alphabets)";
                    }

        }

       function checkEmailUnique() {
           var email = document.getElementById('email').value;
           const pattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

           if (pattern.test(email)) {
               document.getElementById('emailerror').innerHTML = "";
               if (email !== "") {
                   var xhttp = new XMLHttpRequest();
                   xhttp.open("GET", "http://localhost:8080/bikeshowroom_xworkz/validateemail?email=" + email);
                   xhttp.send();

                   xhttp.onload = function () {
                       document.getElementById("emailerror").innerHTML = this.responseText;
                   }
               }
           } else {
               document.getElementById('emailerror').innerHTML = "Please enter a valid email address";
           }
       }



        function checkPhoneUnique() {
            var number = document.getElementById('phone').value;
            const pattern = /^[6-9]\d{9}$/;

            if (pattern.test(number)) {
                document.getElementById('phoneerror').innerHTML = "";
                if (number !== "") {
                    var xhttp = new XMLHttpRequest();
                    xhttp.open("GET", "http://localhost:8080/bikeshowroom_xworkz/phonenumber?phone=" + number);
                    xhttp.send();

                    xhttp.onload = function () {
                        document.getElementById("phoneerror").innerHTML = this.responseText;
                    }
                }
            } else {
                document.getElementById('phoneerror').innerHTML = "Please enter a valid 10-digit phone number";
            }
        }


        function checkDLNumberUnique() {
            var dlNumber = document.getElementById('dlNumber').value;
            const pattern = /^[A-Z]{2}\d{2}\s\d{11}$/; // Example: KA01 12345678901

            if (pattern.test(dlNumber)) {
                document.getElementById('dlnoerror').innerHTML = "";
                if (dlNumber !== "") {
                    var xhttp = new XMLHttpRequest();
                    xhttp.open("GET", "http://localhost:8080/bikeshowroom_xworkz/dlnumber?dlnum=" + dlNumber);
                    xhttp.send();

                    xhttp.onload = function () {
                        document.getElementById("dlnoerror").innerHTML = this.responseText;
                    }
                }
            } else {
                document.getElementById('dlnoerror').innerHTML = "Please enter a valid DL number (e.g., KA01 12345678901)";
            }
        }

        function checkAgeValid() {
            var age = document.getElementById('age').value;
            const pattern = /^(1[89]|[2-7][0-9]|80)$/; // Valid range: 18–80

            if (pattern.test(age)) {
                document.getElementById('ageerror').innerHTML = "";
            } else {
                document.getElementById('ageerror').innerHTML = "Age must be between 18 and 80";
            }
        }



        function validateDropdowns() {
            const showroom = document.getElementById('showroom').value;
            const bikeModel = document.getElementById('bikeModel').value;
            let valid = true;

            if (!showroom) {
                document.getElementById('showroom').classList.add('is-invalid');
                valid = false;
            } else {
                document.getElementById('showroom').classList.remove('is-invalid');
            }

            if (!bikeModel) {
                document.getElementById('bikeModel').classList.add('is-invalid');
                valid = false;
            } else {
                document.getElementById('bikeModel').classList.remove('is-invalid');
            }

            return valid;
        }


        function fetchBikes() {
                 const branchId = document.getElementById('showroom').value;
                 const xhr = new XMLHttpRequest();
                 xhr.open("GET", "http://localhost:8080/bikeshowroom_xworkz/getbranchandbike?branchName="+branchId);
                 xhr.onreadystatechange = function () {
                   if (xhr.readyState === 4 && xhr.status === 200) {
                     const bikes = JSON.parse(xhr.responseText);
                     const bikeDropdown = document.getElementById('bikeModel');
                     bikeDropdown.innerHTML = '<option value="" disabled selected>Select a bike</option>'; // Clear previous options
                     bikes.forEach(bike => {
                       const option = document.createElement('option');
                       option.value = bike;
                       option.textContent = bike;
                       bikeDropdown.appendChild(option);
                     });
                   }
                 };
                 xhr.send();
               }

        function validateAddress() {
            const addressInput = document.getElementById('address');

            if (!addressInput.value.trim()) {
                addressInput.classList.add('is-invalid');
                document.querySelector('#address + .invalid-feedback').style.display = 'block';
                return false;
            } else {
                addressInput.classList.remove('is-invalid');
                document.querySelector('#address + .invalid-feedback').style.display = 'none';
                return true;
            }
        }

        // Initial setup
        toggleScheduleFields();

        // Event listeners
        bookNowRadio.addEventListener('change', toggleScheduleFields);
        scheduleLaterRadio.addEventListener('change', toggleScheduleFields);

        // Validate fields when they change
        document.getElementById('fullName').addEventListener('input', validateName);
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('phone').addEventListener('input', validatePhone);
        document.getElementById('age').addEventListener('input', validateAge);
        document.getElementById('dlNumber').addEventListener('input', validateDL);
        document.getElementById('address').addEventListener('input', validateAddress);
        document.getElementById('showroom').addEventListener('change', validateDropdowns);
        document.getElementById('bikeModel').addEventListener('change', validateDropdowns);

        // Validate schedule fields when they change
        document.getElementById('rideDate').addEventListener('change', validateScheduleFields);
        document.getElementById('rideTime').addEventListener('change', validateScheduleFields);

        // Form submission
        document.getElementById('registrationForm').addEventListener('submit', function(e) {
            // Validate all fields
            const isNameValid = validateName();
            const isEmailValid = validateEmail();
            const isPhoneValid = validatePhone();
            const isAgeValid = validateAge();
            const isDLValid = validateDL();
            const isAddressValid = validateAddress();
            const areDropdownsValid = validateDropdowns();
            const areScheduleFieldsValid = validateScheduleFields();

            if (!isNameValid || !isEmailValid || !isPhoneValid || !isAgeValid ||
                !isDLValid || !isAddressValid || !areDropdownsValid || !areScheduleFieldsValid) {
                e.preventDefault();
                // Scroll to first invalid field
                const firstInvalid = document.querySelector('.is-invalid');
                if (firstInvalid) {
                    firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                }
            }
        });

        // Auto-capitalize first letter of name
        document.getElementById('fullName').addEventListener('input', function(e) {
            if (this.value.length === 1) {
                this.value = this.value.toUpperCase();
            }
        });
    </script>
</body>
</html>