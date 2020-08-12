
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
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
                        <a href="index.jsp" class="general list-group-item list-group-item-action <% if(cat==null){ %>active<% } %>">All Categories</a>
                        <% for (Category cats : categories) {%>
                        <a href="index.jsp?cId=<%= cats.getCategoryId()%>" class="general list-group-item list-group-item-action <% if(cat!=null && Integer.parseInt(cat)== cats.getCategoryId()){ %>active<% } %>" value="<%= cats.getCategoryId()%>"><%= cats.getCategoryTitile()%></a>
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
                                        <button class="btn custom-bg text-light">Add to cart</button>
                                        <%
                                            int price = prod.getpPrice();
                                            int discount = prod.getpDiscount();
                                            int effectivePrice = price-discount;
                                            int percent = (int) ((double)discount/(double)price *100);
                                        %>
                                        <button class="btn btn-outline-primary m-1"><b>&#x20B9;<%= effectivePrice %></b> <span class="text-muted" style="text-decoration: line-through;">&#x20B9;<%= price %></span> <span class="text-success"><%= percent %>% off</span> </button>
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
    </body>
</html>
