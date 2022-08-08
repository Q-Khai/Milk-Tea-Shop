<%-- 
    Document   : home
    Created on : Jul 4, 2022, 3:28:18 PM
    Author     : TQK
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Ogani Template">
        <meta name="keywords" content="Ogani, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shopping Page</title>

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
                <a href="MainController?action=Shopping"><img src="img/logo.png" alt=""></a>
            </div>
            <div class="humberger__menu__cart">
                <ul>
                    <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.CART.getCart().size()}</span></a></li>
                </ul>
            </div>
            <div class="humberger__menu__widget">
                <div class="header__top__right__language">
                    <img src="img/language.png" alt="">
                    <div>English</div>
                    <span class="arrow_carrot-down"></span>
                    <ul>
                        <li><a href="#">Việt Nam</a></li>
                        <li><a href="#">English</a></li>
                    </ul>
                </div>
                <div class="header__top__right__auth">
                    <a href=""><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}</a>
                </div>
            </div>
            <nav class="humberger__menu__nav mobile-menu">
                <ul>
                    <li class="active"><a href="./index.html">Home</a></li>
                    <li><a href="./shop-grid.html">Shop</a></li>
                    <li><a href="#">Pages</a>
                        <ul class="header__menu__dropdown">
                            <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                            <li><a href="./checkout.html">Check Out</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div id="mobile-menu-wrap"></div>
            <div class="header__top__right__social">
                <a href="https://www.messenger.com/t/100004463580805"><i class="fa fa-facebook"></i></a>
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
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__left">
                                <ul>
                                    <li><i class="fa fa-envelope"></i> khaitqse150823@fpt.edu.vn</li>
                                    <li>Miễn phí giao hàng với hóa đơn từ 150.000 vnđ</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="header__top__right">
                                <div class="header__top__right__social">
                                    <a href="https://www.messenger.com/t/100004463580805"><i class="fa fa-facebook"></i></a>
                                </div>
                                <div class="header__top__right__auth">
                                    <a href=""><i class="fa fa-user"></i> ${sessionScope.LOGIN_USER.fullName}</a>
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
                                    <li class="active"><a href="#">Home</a></li>
                                    <li><a href="MainController?action=View">CART</a></li>
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
                    <div class="col-lg-3">
                        <form action="MainController" method="POST">
                            <div class="header__cart">
                                <ul>
                                    <li><a href="MainController?action=View"><i class="fa fa-shopping-bag"></i> <span>${sessionScope.CART.getCart().size()}</span></a></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="humberger__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <!-- Hero Section Begin -->
        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="hero__categories">
                            <div class="hero__categories__all">
                                <i class="fa fa-bars"></i>
                                <span>All Categories</span>
                            </div>
                            <ul>
                                <c:forEach items="${requestScope.LIST_CATEGORY}" var="category">
                                    <li ${TAG==category.categoryID ? "active":""}><a href="MainController?categoryID=${category.categoryID}&action=Category">${category.categoryName}</a></li><hr>
                                    <!--Toán tử 3 ngôi: khi chọn category nào thì cate đó sẽ active, còn lại k-->
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="hero__search">
                            <div class="hero__search__form">
                                <form action="MainController" method="POST">
                                    <div class="hero__search__categories">
                                        All Categories
                                        <span class="arrow_carrot-down"></span>
                                    </div>
                                    <input type="text" name="search" value="${VALUE_SEARCH}" placeholder="Bạn cần tìm gì?">
                                    <button type="submit" name="action" value="Search" class="site-btn">SEARCH</button>
                                </form>
                            </div>
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
                        <div class="hero__item set-bg" data-setbg="img/banner/banner.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Categories Section Begin -->
        <section class="categories">
            <div class="container">
                <div>
                    <h2 class="text-center font-weight-bold">Best Seller</h2>
                </div>
                <div class="row">
                    <div class="categories__slider owl-carousel">
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/tea/tra_sua_truyen_thong.png">
                                <h5><a href="#">Trà Sữa Truyền Thống</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/tea/tra_sua_socola.png">
                                <h5><a href="#">Trà Sữa Socola</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/tea/cookie_da_xay.jpg">
                                <h5><a href="#">Cookie Oreo</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/tea/hong_tra_machiato.png">
                                <h5><a href="#">Hồng Trà Macchiato</a></h5>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="categories__item set-bg" data-setbg="img/tea/tra-sua-bac-ha.png">
                                <h5><a href="#">Trà Sữa Bạc Hà</a></h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Categories Section End -->

        <!-- Featured Section Begin -->
        <section class="featured spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Menu</h2>
                        </div>
                        <div class="featured__controls">
                            <ul id="ul_top">
                                <c:forEach items="${requestScope.LIST_CATEGORY}" var="category">
                                    <li class="text-black-50"><a href="MainController?categoryID=${category.categoryID}&action=Category">${category.categoryName}</a></li>
                                </c:forEach>
                                <!--                                <li class="active" data-filter="#">All</li>
                                                                <li data-filter="#">Trà Sữa</li>
                                                                <li data-filter=".fresh-meat">Trà Trái Cây</li>
                                                                <li data-filter=".vegetables">Đá Xay</li>
                                                                <li data-filter=".fastfood">Topping</li>-->
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <c:forEach items='${requestScope.LIST_TEA}' var="tea">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <form action="MainController" method="POST">
                                <div class="featured__item">
                                    <!-- Product ID-->
                                    <input type="hidden" name="productID" value="${tea.productID}" reachonly=""/>
                                    <!-- Product Name-->
                                    <input type="hidden" name="productName" value="${tea.productName}" />
                                    <!-- image-->
                                    <input type="hidden" name="image" value="${tea.image}" />
                                    <!--Price-->
                                    <input type="hidden" name="price" value="${tea.price}" />
                                    <!--Quantity-->
                                    <input type="hidden" name="quantity" value="${tea.quantity}" />
                                    <!--Category ID-->
                                    <input type="hidden" name="categoryID" value="${tea.categoryID}" />
                                    <!-- Product image-->
                                    <!--<img class="card-img-top" src="${tea.image}" alt="..." />-->
                                    <div class="featured__item__pic set-bg" data-setbg="${tea.image}">
                                    </div>
                                    <div class="featured__item__text">
                                        <button type="submit" name="action" value="Add"><i class="fa fa-shopping-cart"></i></button>
                                        <h6><a href="#">${tea.productName}</a></h6>
                                        <h5>${tea.price}00 vnđ</h5>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    <div class="banner">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/KhuyenMai.png" alt="">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="banner__pic">
                        <img src="img/banner/2duoc3.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Banner End -->

    <hr>
    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
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
