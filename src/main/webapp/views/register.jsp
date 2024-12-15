<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Register Start -->
<div class="register-page section-padding-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="login-register-content">
                    <h4 class="title">Create New Account</h4>
                    <div class="login-register-form">
                        <form id="registerForm">
                            <!-- Full Name -->
                            <div class="single-form">
                                <label>Full Name *</label>
                                <input type="text" id="fullName" placeholder="Enter your full name" required>
                            </div>
                            <!-- Phone Number -->
                            <div class="single-form">
                                <label>Phone Number *</label>
                                <input type="tel" id="phoneNumber" placeholder="Enter your phone number" required>
                            </div>
                            <!-- Email -->
                            <div class="single-form">
                                <label>Username or Email Address *</label>
                                <input type="email" id="email" placeholder="Enter your email" required>
                            </div>
                            <!-- Password -->
                            <div class="single-form">
                                <label>Password *</label>
                                <input type="password" id="password" placeholder="Enter your password" required>
                            </div>
                            <!-- Confirm Password -->
                            <div class="single-form">
                                <label>Confirm Password *</label>
                                <input type="password" id="confirmPassword" placeholder="Re-enter your password" required>
                            </div>
                            <!-- Register Button -->
                            <div class="single-form">
                                <button type="submit" class="btn btn-primary btn-block">Register</button>
                            </div>
                            <div class="single-form">
                                <label>Already have an account?</label>
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-dark btn-block">Log in instead!</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register End -->
<script>
    document.getElementById('registerForm').addEventListener('submit', function (event) {
        event.preventDefault(); // Ngăn form gửi thông thường

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const fullName = document.getElementById('fullName').value;
        const phoneNumber = document.getElementById('phoneNumber').value;

        // Kiểm tra mật khẩu trùng khớp
        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // Gửi dữ liệu đăng ký
        fetch('/auth/signup', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email, password, fullName, phoneNumber }),
        })
            .then(response => response.json())
            .then(data => {
                
                    window.location.href = "/login"; // Điều hướng đến trang đăng nhập
               
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred during registration.');
            });
    });
</script>
