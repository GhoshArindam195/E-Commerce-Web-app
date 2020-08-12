<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("messgae", "You are not logged in.. Login first");
        response.sendRedirect("login.jsp");
    } else if (user.getUserType().equals("buyer"))
        response.sendRedirect("home.jsp");
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
        <title>Admin | MyCart</title>
    </head>
    <body>
        <%@include file="components/homenavbar.jsp" %>
        <%@include file="components/message.jsp" %>

        <!--Control Modal -->
        <div class="modal fade hover" id="control-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg">
                        <div class="container text-center text-light" style="font-size: 20px"><b>Admin Controller</b></div>

                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="container" style=" border: 0px; margin: 0px;">
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="card">
                                        <div class="card-header text-center bg-success text-light"><b>Buyers</b></div>
                                        <div class="card-body">
                                            <img src="img/buyer.png" class="card-img-top">
                                        </div>
                                        <div class="card-footer text-center">
                                            <h3>1000</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="card">
                                        <div class="card-header text-center bg-success text-light"><b>Sellers</b></div>
                                        <div class="card-body">
                                            <img src="img/seller.png" class="card-img-top">
                                        </div>
                                        <div class="card-footer text-center">
                                            <h3>1000</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="card">
                                        <div class="card-header text-center bg-success text-light"><b>Categories</b></div>
                                        <div class="card-body">
                                            <img src="img/cate.png" class="card-img-top">
                                        </div>
                                        <div class="card-footer text-center">
                                            <h3>1000</h3>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-3">
                                    <div class="card">
                                        <div class="card-header text-center bg-success text-light"><b>Products</b></div>
                                        <div class="card-body">
                                            <img src="img/prods.png" class="card-img-top">
                                        </div>
                                        <div class="card-footer text-center">
                                            <h3>1000</h3>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row my-2" >
                                <div class="col-sm-6">
                                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                                        <div class="card-header text-center bg-primary text-light"><b>Add Category</b></div>
                                        <div class="card-body text-center">
                                            <img src="img/add.png" class="card-img-top" style="max-height: 200px; max-width: 200px;">
                                        </div>
                                        <div class="card-footer"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                                        <div class="card-header text-center bg-primary text-light"><b>Add Product</b></div>
                                        <div class="card-body text-center">
                                            <img src="img/addprod.png" class="card-img-top" style="max-height: 200px; max-width: 200px;">
                                        </div>
                                        <div class="card-footer"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end Control Modal -->


        <!--add category Modal -->
        <div class="modal fade" id="add-category-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-light">
                        <div class="container text-center"><h4 class="modal-title" id="staticBackdropLabel">Enter your category details</h4></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="productOperationServlet" method="post">
                        <input type="hidden" value="addCat" name="operation">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="cTitle">Category Title</label>
                                <input required type="text" class="form-control" id="cTitle" name="cTitle" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="cDesc">Category Description</label>
                                <textarea required class="form-control" id="cDesc" name="cDesc" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success">Submit</button>
                            <button type="reset" class="btn btn-outline-warning">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--end add category Modal -->

        <!--add Product Modal -->
        <div class="modal fade" id="add-product-modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-light">
                        <div class="container text-center"><h4 class="modal-title" id="staticBackdropLabel">Enter your Product details</h4></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="productOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="addProd" name="operation"/>
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="pName">Product Name</label>
                                <input required type="text" class="form-control" id="pName" name="pName" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="pDesc">Product Description</label>
                                <textarea required class="form-control" id="pDesc" name="pDesc" rows="5"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="pPrice">Product Price</label>
                                <input required type="text" class="form-control" id="pPrice" name="pPrice" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="pDisc">Product Discount</label>
                                <input required type="text" class="form-control" id="pDisc" name="pDisc" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="pQuant">Product Quantity</label>
                                <input required type="text" class="form-control" id="pQuant" name="pQuant" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="pCat">Product Category</label>
                                <select name="pCatId" class="form-control" id="pCat">
                                    <%                                    CategoryDao cd = new CategoryDao(FactoryProvider.getFactory());
                                        List<Category> categories = cd.getAllCategories();
                                        for (Category cats : categories) {%>
                                        <option value="<%= cats.getCategoryId() %>"><%= cats.getCategoryTitile() %></option>
                                    <%}%>
                                </select>
                            </div>



                            <div class="form-group text-center">
                                <label class="custom-file-upload text-light bg-primary" id="pPic">
                                    <input type="file" name="pPic" required/>
                                    <b>Product image</b>
                                </label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success">Submit</button>
                            <button type="reset" class="btn btn-outline-warning">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--end add Product Modal -->

    </body>
</html>

<%            }
%>