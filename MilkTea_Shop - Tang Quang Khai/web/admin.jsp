<%-- 
    Document   : admin
    Created on : Jul 6, 2022, 8:25:15 AM
    Author     : TQK
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.entity.TeaDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="css/admin.css">

        <!------ Include the above in your HEAD tag ---------->

        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    </head>

    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <nav class="navbar navbar-expand-md navbar-green bg-green">
            <div class="container">
                <div class="humberger__menu__wrapper">
                    <div class="humberger__menu__logo">
                        <a href="#"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <li class="nav-item m-auto">
                            <a class="nav-link" href="#">Welcome: ${sessionScope.LOGIN_USER.fullName}  </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MainController?action=Logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">Quản Lý Sản Phẩm</h1>
            </div>
        </section>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">

                        <table class="table">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td><input class="form-control" type="hidden" name="productID" placeholder="id" required/></td>
                                    <td><input class="form-control" type="hidden" name="image" placeholder="image url" required/></td>
                                    <td><input class="form-control" type="hidden" name="productName" placeholder="Name" required/></td>
                                    <td>
                                        <!--                                        <select name="categoryID" class="form-select" placeholder="category" required>
                                        <c:forEach items="${LIST_CATEGORY}" var="cate">
                                            <option value="${cate.categoryID}">${cate.categoryName}</option>
                                        </c:forEach>
                                    </select>-->
                                        <input class="form-control" type="hidden" name="categoryID" placeholder="Category" required/>
                                    </td>
                                    <td><input class="form-control" type="hidden" name="quantity" placeholder="Quantity" required/></td>
                                    <td><input class="form-control" type="hidden" name="price" placeholder="Price" required/></td>
                                    <td>
                                        <%--<c:if test="${!empty requestScope.P_ERROR}">--%>
                                        <h5 class="text-danger">${requestScope.P_ERROR}</h5>
                                        <%--</c:if>--%>
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button class="btn btn-lg btn-block btn-success text-uppercase" type="button" data-bs-toggle="modal" data-bs-target="#ModalAdd">Thêm Sản Phẩm</button>
                                    </td>
                                </tr>
                            </form>
                        </table>

                        <!--Modal Add-->
                        <form action="MainController" method="POST">
                            <div class="modal fade" id="ModalAdd" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                        </div>
                                        <!--<form action="MainController" method="POST">-->
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <label>Product ID</label>
                                                <input class="form-control" type="text" name="productID" placeholder="id" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Product Name</label>
                                                <input class="form-control" type="text" name="productName" placeholder="Name" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Image URL</label>
                                                <input class="form-control" type="text" name="image" placeholder="image url" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Quantity</label>
                                                <input class="form-control" type="text" name="quantity" placeholder="Quantity" required/>
                                            </div>
                                            <div class="form-group">
                                                <label>Price</label>
                                                <input class="form-control" type="text" name="price" placeholder="Price" required/>
                                            </div>

                                            <div class="form-group">
                                                <label>Category ID</label>
                                                <select name="categoryID" class="form-select" placeholder="category" required>
                                                    <c:forEach items="${LIST_CATEGORY}" var="cate">
                                                        <option value="${cate.categoryID}">${cate.categoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-success" name="action" value="Create">Add</button>
                                        </div>
                                        <!--</form>-->
                                    </div>
                                </div>
                            </div>
                        </form>
                        <table class="table table-striped">
                            <%--<c:if test="${!empty requestScope.LIST_PRODUCT}">--%>
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Image URL</th>
                                    <th scope="col">Product</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th> </th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.listP}" var="product">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <!--productID-->
                                        <td>
                                            ${product.productID}
                                            <input class="form-control" type="hidden" name="productID" value="${product.productID}" readonly=""/>
                                        </td>
                                        <!--image-->
                                        <td>
                                            <img src="${product.image}" style="width: 100px;height:80px;">
                                        </td>
                                        <td>
                                            <input class="form-control" type="text" name="image" value="${product.image}" required/>
                                        </td>
                                        <!--name-->
                                        <td>
                                            <input class="form-control" type="text" name="productName" value="${product.productName}" required/>
                                        </td>
                                        <!--category-->
                                        <td>
                                            <input class="form-control" type="text" name="categoryID" value="${product.categoryID}" required/>
                                        </td>
                                        <!--quantity-->
                                        <td>
                                            <input class="form-control" type="number" name="quantity" value="${product.quantity}" required/>
                                        </td>
                                        <!--price-->
                                        <td>
                                            <input class="form-control" type="text" name="price" value="${product.price}00 vnđ" required/>
                                        </td>
                                        </form>
                                        <td class="text-right">
                                            <!--<button class="btn btn-sm btn-success" type="submit" value="Update" name="action"><i class="fa fa-edit"></i></button>-->
                                            <button class="btn btn-sm btn-success" type="button" 
                                                    onclick="myFunction(this.getAttribute('data-productID'), this.getAttribute('data-productImg'), this.getAttribute('data-productName'), this.getAttribute('data-price'), this.getAttribute('data-quantity'))" 
                                                    data-bs-toggle="modal" data-bs-target="#exampleModal" 
                                                    data-productID="${product.productID}"
                                                    data-productImg="${product.image}"
                                                    data-productName="${product.productName}"
                                                    data-quantity="${product.quantity}"
                                                    data-price="${product.price}"><i class="fa fa-edit"> Edit</i></button>
                                            <!--<a href="MainController?action=Update&productID=${product.productID}" class="edit text-success"><i class="fa fa-edit">Edit</i></a>-->
                                        </td>
                                        <td class="text-right">
                                            <!--<button class="btn btn-sm btn-danger" tyle="submit" name="action" value="Delete" ><i class="fa fa-trash"> Delete</i></button>--> 
                                            <button class="btn btn-sm btn-danger" onclick="truyenIdDelete(this.getAttribute('data-ProductID'))" data-bs-toggle="modal"
                                                    data-bs-target="#ModalDeleteProduct" data-ProductID="${product.productID}">
                                                <i class="fa fa-trash fw-bold"></i> Delete
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

        <!--Modal Delete-->
        <form action="MainController">
            <div class="modal fade" id="ModalDeleteProduct" tabindex="-1" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <div class="modal-header justify-content-center">
                            <h4 class="modal-title text-danger" id="exampleModalLabel">Xóa Sản Phẩm này?</h4>
                        </div>
                        <div class="modal-footer justify-content-center">
                            <button type="button" class="main-btn warning-btn-outline btn-hover btn-sm"
                                    data-bs-dismiss="modal">Hủy</button>
                            <input type="hidden" id="ProductId"  name="productID"/>
                            <button type="submit" name="action" value="Delete" class="main-btn warning-btn btn-hover btn-sm">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!--Modal Edit-->
        <form action="MainController" method="POST">
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Update Product</h5>
                        </div>
                        <!--<form action="MainController" method="POST">-->
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Product ID</label>
                                <input id="field2" name="productID" type="text" class="form-control" readonly="">
                            </div>
                            <div class="form-group">
                                <label>Product Name</label>
                                <input id="field3" name="productName" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image URL</label>
                                <input id="field4" name="image" type="text"  class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input id="field5" name="quantity" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input id="field6" name="price" type="text" class="form-control" required>
                            </div>

                            <div class="form-group">
                                <label>Category ID</label>
                                <select name="categoryID" class="form-select" placeholder="category" required>
                                    <c:forEach items="${LIST_CATEGORY}" var="cate">
                                        <option value="${cate.categoryID}">${cate.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success" name="action" value="Update">Update</button>
                        </div>
                        <!--</form>-->
                    </div>
                </div>
            </div>
        </form>
        <%--</c:forEach>--%>


        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-8 col-sm-8">
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

        <!-- Js Plugins -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="js/manager.js" type="text/javascript"></script>
        <script>
                                                function myFunction(productID, productName, image, price, quantity, categoryID) {
                                                    document.getElementById("field2").value = productID;
                                                    document.getElementById("field3").value = productName;
                                                    document.getElementById("field4").value = image;
                                                    document.getElementById("field6").value = price;
                                                    document.getElementById("field5").value = quantity;
                                                    document.getElementById("categoryID").value = categoryID;
                                                }

                                                function truyenIdDelete(ProductID) {
                                                    document.getElementById("ProductId").value = ProductID;
                                                }
        </script>
    </body>
</html>
