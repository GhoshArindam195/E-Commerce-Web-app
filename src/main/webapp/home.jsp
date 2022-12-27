<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
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
        <%@include file="components/common_css_js.jsp" %>
        <title>Home | MyCart</title>
    </head>
    <body>
        <%@include file="components/homenavbar.jsp" %>
        <%@include file="components/message.jsp" %>



        <!--Main body-->
        <div class="container-fluid mt-5">
            <div class="row">

                <%                    
                    ProductDao pd = new ProductDao(FactoryProvider.getFactory());
                    List<Product> products = null;
                    String cat = request.getParameter("cId");
                    if (cat == null) {
                        products = pd.getAllProducts();
                    } else {
                        products = pd.getProductsByCategoryId(Integer.parseInt(cat));
                    }

                    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> categories = cd.getAllCategories();
                %>


                <!--Category col-->
                <div class="col-sm-2 mt-4">
                    <ul class="list-group">
                        <a href="index.jsp" class="general list-group-item list-group-item-action <% if (cat == null) { %>active<% } %>">All Categories</a>
                        <% for (Category cats : categories) {%>
                        <a href="index.jsp?cId=<%= cats.getCategoryId()%>" class="general list-group-item list-group-item-action <% if (cat != null && Integer.parseInt(cat) == cats.getCategoryId()) { %>active<% }%>" value="<%= cats.getCategoryId()%>"><%= cats.getCategoryTitile()%></a>
                        <% } %>
                    </ul>
                </div>

                <!--main body row-->
                <div class="col-sm-10">
                    <div class="row mt-4">
                        <div class="col-sm-12">
                            <div class="card-columns">
                                <!--Traversing all the cards here-->
                                <% for (Product prod : products) {%>
                                <div class="card">
                                    <div class="card-header text-center">
                                        <h5 class="card-title"><%= prod.getpName()%></h5>
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            <%= Helper.get10Words(prod.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="text-center">
                                        <img src="img/products/<%= prod.getpPhoto()%>" class="card-img-top img-fluid " style="height: 250px; width: auto;"></div>
                                    <div class="card-footer">
                                        <%
                                            int price = prod.getpPrice();
                                            int discount = prod.getpDiscount();
                                            int effectivePrice = price - discount;
                                            int percent = (int) ((double) discount / (double) price * 100);
                                            int pId = prod.getpId();
                                            String pName = prod.getpName();
                                        %>
                                        <a href="#" class="btn custom-bg text-light" onclick="addToCart(<%= pId%>, '<%= pName%>', <%= effectivePrice%>)">Add to cart</a> 
                                        <button class="btn btn-outline-primary m-1"><b>&#x20B9;<%= effectivePrice%></b> <span class="text-muted" style="text-decoration: line-through;">&#x20B9;<%= price%></span> <span class="text-success"><%= percent%>% off</span> </button>
                                    </div>
                                </div>
                                <% }
                                    if (products.size() == 0) { %>
                                <h1 class="display-4">No Products</h1>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--end of Main body-->

        <!--cart modal-->

        <div class="modal fade" id="cart-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Your cart</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table" id="cart-table">
                            <thead class="custom-bg text-light">
                                <tr>
                                    <th scope="col">no.</th>
                                    <th scope="col">Item name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody id="tBody">
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" onclick="clearCart()">Clear cart</button>
                        <button type="button" class="btn btn-success" id="check-out" >Check out</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end cart modal-->



    </body>
</html>

<%
    }
%>