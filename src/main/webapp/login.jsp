<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>Login | MyCart</title>
    </head>
    <body>
        <!--navbar-->
        <%@include file="components/navbar.jsp" %><br><br>
        <!--navbar ends-->
        
        <!--Main body-->
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-sm-4 offset-sm-4">
                    <div class="card">
                        <div class="card-header custom-bg text-center text-light" style="font-size: 25px;">
                            <b>Login here</b>
                        </div>
                        <%@include file="components/message.jsp" %>
                        <form action="loginServlet" method="post">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" id="email" name="loginEmail" aria-describedby="emailHelp">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="loginPwd">
                                </div>
                            </div>
                            <div class="card-footer text-center">
                                <button type="submit" class="btn custom-bg text-light">Submit</button><br>
                                <!--<a href="register.jsp" class="btn btn-outline-info mt-2">New User ?</a>-->
                            </div>
                        </form>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--Main body ends-->

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
                        <a href="#" type="button" class="btn btn-success" id="check-out">Check out</a>
                    </div>
                </div>
            </div>
        </div>

        <!--end cart modal-->
    </body>
</html>
