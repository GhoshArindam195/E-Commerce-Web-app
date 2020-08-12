<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null)
    {
        session.setAttribute("messgae", "You are not logged in.. Login first");
        response.sendRedirect("login.jsp");
    }
    else if(user.getUserType().equals("buyer"))
        response.sendRedirect("home.jsp");
    else if(user.getUserType().equals("admin"))
        response.sendRedirect("adminHome.jsp");
    else
    {
        %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>Seller | MyCart</title>
    </head>
    <body>
        <%@include file="components/homenavbar.jsp" %>
        <%@include file="components/message.jsp" %>
    </body>
</html>

        <%
    }
%>