<%-- 
    Document   : viewCart
    Created on : Jul 6, 2022, 11:54:39 PM
    Author     : TQK
--%>

<%@page import="sample.shopping.TeaSell"%>
<%@page import="sample.shopping.Cart"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart Page</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css" type="text/css">
    </head>

    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Humberger Begin -->
        <div class="humberger__menu__overlay"></div>
        <div class="humberger__menu__wrapper">
            <div class="humberger__menu__logo">
                <a href="#"><img src="img/logo.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <!-- <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li> -->
                    <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                </ul>
                <div class="header__cart__price">item: <span>$150.00</span></div>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__language">
                    <img src="img/language.png" alt="">
                    <div>English</div>
                    <span class="arrow_carrot-down"></span>
                    <ul>
                        <li><a href="#">Spanis</a></li>
                        <li><a href="#">English</a></li>
                    </ul>
                </div>
                <div class="header__top__right__auth">
                    <a href="#"><i class="fa fa-user"></i> Login</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li><a href="./index.html">Home</a></li>
                    <li class="active"><a href="./shop-grid.html">Cart</a></li>
                    <li><a href="#">Pages</a>
                        <ul class="header__menu__dropdown">
                            <li><a href="./checkout.html">Check Out</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="header__top__right__social">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-pinterest-p"></i></a>
            </div>
            <div class="humberger__menu__contact">
                <ul>
                    <li><i class="fa fa-envelope"></i> khaitqse150823@fpt.edu.vn</li>
                    <li>Miễn phí giao hàng với hóa đơn từ 150.000 vnđ</li>
                </ul>
            </div>
        </div>
        <!-- Humberger End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="header__top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> khaitqse150823@fpt.edu.vn</li>
                                    <li>Miễn phí giao hàng với hóa đơn từ 150.000 vnđ</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href="#"><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="header__logo">
                            <a href="MainController?action=Shopping"><img src="img/logo.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                            <form action="MainController" method="POST">
                                <ul>
                                    <li><a href="MainController?action=Shopping">Home</a></li>
                                    <li class="active"><a href="#">CART</a></li>
                                    <!--                                    <li><a href="#">Pages</a>
                                                                            <ul class="header__menu__dropdown">
                                                                                <li><a href="MainController?action=View">Shoping Cart</a></li>
                                                                                <li><a href="./checkout.html">Check Out</a></li>
                                    
                                                                            </ul>
                                                                        </li>-->
                                    <li><a href="MainController?action=Logout">Logout</a></li>
                                </ul
                            </form>
                        </nav>                       
                    </div>
                    <div class="col-3">
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>0836.434.919</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>

        <!-- Breadcrumb Section Begin -->
        <section class="breadcrumb-section set-bg" data-setbg="img/checkout.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="breadcrumb__text">
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Breadcrumb Section End -->

        <!-- Shoping Cart Section Begin -->
        <section class="h-auto" style="background-color: #ffff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black"><i class="fa fa-shopping-cart"></i> YOUR CART</h1>
                                                <h6 class="mb-0 text-muted"></h6>
                                            </div>
                                            <!--Tea Sell-->                                                                                                                                            
                                            <%
                                                Cart cart = (Cart) session.getAttribute("CART");
                                                if (cart != null) {
                                                    if (cart.getCart().size() >= 0) {
                                                        int count = 1;
                                                        double total = 0;
                                                        for (TeaSell p : cart.getCart().values()) {
                                                            total += p.getpPrice() * p.getpQuantity();
                                            %>
                                            <c:set var="totalPrice" value="<%=total%>"/>
                                            <hr class="my-4">
                                            <form action="MainController" method="POST">
                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="<%=p.getpImage()%>" class="img-fluid rounded-3">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h6 class="text-muted">Product Name</h6>
                                                        <h5 class="text-black mb-0"><%=p.getpName()%></h5>
                                                    </div>                                                 
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex" style="width: 18%">                             
                                                        <input type="hidden" name="productID" value="<%=p.getpID()%>" min="1" required=""/>
                                                        <input class="form-control" type="number" id="form1" min="1" name="quantity" value="<%=p.getpQuantity()%>" />
                                                    </div>
                                                    <div class="col-md-2 col-lg-1 col-xl-2 offset-lg-1" style="width: 14.666667%;">
                                                        <h6 class="mb-0"><%=p.getpPrice() * p.getpQuantity()%>00 vnđ</h6>
                                                    </div>
                                                    <div>                                                        
                                                        <button class="btn btn-sm btn-success" type="submit" value="Edit" name="action"><i class="fa fa-edit"></i></button>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <!--<button class="btn btn-sm btn-success" type="submit" value="Remove" name="action"><i class="fa fa-times"></i></button>-->
                                                        <a href="MainController?action=Remove&productID=<%=p.getpID()%>" class="text-danger"><i class="fa fa-times"></i></a>
                                                    </div>
                                                </div> 
                                            </form>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                            <!---------------------------->
                                            <div class="pt-5">
                                                <h6 class="mb-0">
                                                    <a href="MainController?action=Shopping" class="text-body"><i class="fa fa-long-arrow-alt-left"></i>Back to shop</a>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Details Order</h3>
                                            <hr class="my-4">
                                            <h6 class="">Receiver's Name</h6>
                                            <div class="mb-4">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2" class="form-control form-control" value="${sessionScope.LOGIN_USER.fullName}" required=""/>
                                                </div>
                                            </div>

                                            <h6 class="">Address</h6>
                                            <div class="mb-4">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2" class="form-control form-control" value="${sessionScope.LOGIN_USER.address}" required=""/>
                                                </div>
                                            </div>
                                            <h6 class="">Phone Numbers</h6>

                                            <div class="mb-4">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2" class="form-control form-control" value="${sessionScope.LOGIN_USER.phone}" required=""/>
                                                </div>
                                            </div>
                                            <h6 class="">Email</h6>
                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2" class="form-control form-control" value="${sessionScope.LOGIN_USER.email}" required=""/>
                                                </div>
                                            </div>

                                            <hr class="my-4">                                            
                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>                                                
                                                <h3>${totalPrice}00 vnđ</h3>
                                            </div>
                                            <div class="mb-4">
                                                <form action="MainController">                                            
                                                    <button type="button" class="btn btn-dark btn-block btn-lg"
                                                            data-mdb-ripple-color="dark" data-toggle="modal" data-target="#exampleModal">Pay the bill</button>
                                                </form>
                                            </div>
                                            <c:if test="${!empty requestScope.ERROR_QUANTITY}">
                                                <div class="mb-4 alert alert-danger">
                                                    <c:forEach items="${requestScope.ERROR_QUANTITY}" var="error">
                                                        <h7>${error} not enough Quantity !</h7></br>
                                                        </c:forEach>
                                                </div>
                                            </c:if>
                                            <c:if test="${!empty requestScope.ORDER_SUCCESS}">
                                                <div class="mb-5 alert alert-success text-center fw-bold">                                
                                                    <h5>${requestScope.ORDER_SUCCESS}</h5>                                                   
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>

                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Success -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <form action="MainController" method="POST">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-success" id="exampleModalLabel">Thanh Toán Thành Công</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Cám ơn bạn đã đến với Tiệm Trà Sữa của chúng tôi!! </p>
                                <p>Hẹn gặp lại bạn ^.^</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" name="action" value="Shopping" class="btn btn-primary">Success</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- Shoping Cart Section End -->

        <!-- Footer Section Begin -->
        <footer class="footer spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="footer__about">
                            <div class="footer__about__logo">
                                <a href="#"><img src="img/logo.png" alt=""></a>
                            </div>
                            <ul>
                                <li>Address: FPT University</li>
                                <li>Phone: 0836.434.919</li>
                                <li>Email: khaitqse150823@fpt.edu.vn</li>
                            </ul>
                        </div>
                    </div>
                </div> 
            </div>
        </footer>
        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/jquery.slicknav.js"></script>
        <script src="js/mixitup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>


    </body>

</html>