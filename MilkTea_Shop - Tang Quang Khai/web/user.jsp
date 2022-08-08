<%-- 
    Document   : user
    Created on : Jul 5, 2022, 10:46:03 AM
    Author     : TQK
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        welcome:
        <h1>${sessionScope.LOGIN_USER.fullName}</h1>
        <h2>Your information:</h2>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("US")) {
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
            <a href="MainController?action=Shopping" class="text-danger">Shopping now</a>
        </form>
    </body>
</html>
