<%-- 
    Document   : login
    Created on : Jul 4, 2022, 3:21:33 PM
    Author     : TQK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/styleLogin.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(images/background.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <form action="LoginController" method="POST" class="signin-form" id="form1">
                                <div class="form-group">
                                    <input type="text" name="userID" class="form-control" placeholder="UserID"  required="required">
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" name="password" class="form-control" placeholder="Password"  required="required">
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <p class="text-danger">${requestScope.ERROR}</p>
                                <div class="g-recaptcha" data-sitekey="6Le4YsogAAAAAPXNiHuioMxSZP5UBSNkemVHVOHx"></div>
                                <div id="error"></div>
                                <div class="form-group">
                                    <button type="submit" name="action" value="Login" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Remember Me
                                            <input type="checkbox" checked>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="#" style="color: #fff">Forgot Password</a>
                                    </div>
                                </div>

                            </form>
                            <!--                            <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
                                                        <div class="social d-flex text-center">
                                                            <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
                                                        </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--JS-->                        
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("form1");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault(); //không cho phép tiếp tục
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit(); //Nếu response không phải chuỗi trống thì đc phép submit
                    } else {
                        error.innerHTML = "Please check reCATCHA";
                        error.className = "text-danger text-center"
                    }
                });
            }
        </script>
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min_1.js"></script>
        <script src="js/main_1.js"></script>

    </body>
</html>


