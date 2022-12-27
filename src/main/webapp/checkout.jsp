<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in.. Login first");
        response.sendRedirect("login.jsp");
    } else if (user.getUserType().equals("admin"))
        response.sendRedirect("adminHome.jsp");
    else if (user.getUserType().equals("seller"))
        response.sendRedirect("sellerHome.jsp");
    else {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%
    }
%>