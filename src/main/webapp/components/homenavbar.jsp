<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current_user");
    if (user1 == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!--<style>
    .custom-bg{
        background: #004d40 !important;
    }
</style>-->

<nav class="navbar navbar-expand-lg navbar-dark custom-bg fixed-top">
    <a class="navbar-brand active" href="http://localhost:9494/">MyCart</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="#">Products <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Pantry <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Offers</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Category
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            <%
                if (user1.getUserType().equals("admin")) {%>
            <li class="nav-item">
                <a class="nav-link" href="#" data-toggle="modal" data-target="#control-modal">Controller</a>
            </li>
            <%}%>
        </ul>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#"><b>Cart(0)</b><span class="sr-only"></span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <% if (user1.getUserType().equals("admin")) {%>
                    <b>Admin <%= user1.getUserName()%></b>
                    <% } else if (user1.getUserType().equals("seller")) {%>
                    <b>Seller <%= user1.getUserName()%></b>
                    <% } else if (user1.getUserType().equals("buyer")) {%>
                    <b>Buyer <%= user1.getUserName()%></b>
                    <% }%>
                </a>
                <div class="dropdown-menu" style="margin: 0px; padding: 0px;" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item bg-danger text-light" href="logoutServlet">Logout</a>
                </div>
            </li>


        </ul>
    </div>
</nav>