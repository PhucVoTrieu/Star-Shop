<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <!--Login Start-->
        <div class="login-page section-padding-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="login-register-content">
                            <h4 class="title">Login to Your Account</h4>

                            <div class="login-register-form">
                                <form action="" method ="post">
                                    <div class="single-form">
                                        <label>Email address *</label>
                                        <input type="email" id="email">
                                    </div>
                                    <div class="single-form">
                                        <label>Password</label>
                                        <input type="password" id="password" required autocomplete="on">
                                    </div>
                                    <div class="single-form">
                                        <button id="Login" class="btn btn-primary btn-block">Login</button>
                                    </div>
                                    <div class="single-form d-flex justify-content-between">
                                        <div class="cus-checkbox">
                                            <input type="checkbox" id="remember">
                                            <label for="remember"><span></span> Remember Me</label>
                                        </div>
                                        <div class="forget">
                                            <a href="#">Lost Your Password</a>
                                        </div>
                                    </div>
                                    <div class="single-form">
                                        <label>You don't have account ?</label>
                                        <a href="${pageContext.request.contextPath}/register" class="btn btn-dark btn-block">Create Account Now</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Login End-->
        
      <script>
    document.getElementById("Login").addEventListener("click", async function (e) {
        e.preventDefault(); // Prevent form submission
        
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;

        try {
            const response = await fetch('/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ email, password }),
            });

            if (response.ok) {
                const data = await response.json();
              //  alert('Login successful! Token: ' + data.token);

                // Optionally store the token in localStorage or a cookie
              //  document.cookie = `jwtToken=${data.token}; path=/; max-age=${data.expiresIn}`;
                
                // Redirect to a protected page
                window.location.href = '/common/products';
            } else {
                const error = await response.json();
                alert('Login failed: ' + error.message);
            }
        } catch (err) {
            console.error('Error:', err);
            alert('An error occurred. Please try again.');
        }
    });
</script>


      