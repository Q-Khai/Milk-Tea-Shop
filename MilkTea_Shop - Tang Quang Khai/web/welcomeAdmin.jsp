<%-- 
    Document   : welcomeAdmin
    Created on : Jul 6, 2022, 3:20:29 PM
    Author     : TQK
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        welcome:
        <h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <h2>Your information:</h2>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        User ID: <%=loginUser.getUserID()%></br>
        Role ID: <%=loginUser.getRoleID()%></br>
        Full Name: <%=loginUser.getFullName()%></br>
        Address : <%=loginUser.getAddress()%></br>
        Phone : <%=loginUser.getPhone()%></br>
        Email : <%=loginUser.getEmail()%></br>
        Password: <%="***"%>
        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout"/></br></br>
            <a href="MainController?action=Product" class="text-danger">Manager Product</a>
        </form>
    </body>
</html>
