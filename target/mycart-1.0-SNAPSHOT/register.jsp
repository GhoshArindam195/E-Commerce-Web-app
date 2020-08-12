<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register | MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <!--navbar-->
        <%@include file="components/navbar.jsp" %><br><br>
        
        <!--bootstrap message-->
        <%@include file="components/message.jsp" %>

        <!--registration form-->
        <div class="container-fluid mt-5">
            <div class="row">
                <div class="col-sm-8 offset-sm-2">
                    <div class="card">
                        <div class="card-header text-center">
                            <p class="display-4">Register here</p>
                        </div>
                        <form action="registerServlet" method="post">
                            <div class="card-body p-3">
                                <div class="form-group">
                                    <label for="name"><b>Name</b> :</label>
                                    <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="eg. Arindam Ghosh" required>
                                </div>
                                <div class="form-group">
                                    <label for="email"><b>Email</b> :</label>
                                    <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="eg. username@email.com" required>
                                </div>
                                <div class="form-group">
                                    <label for="password"><b>Password</b> :</label>
                                    <input type="password" name="user_password" class="form-control" id="password" placeholder="eg. Password123*" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone"><b>Phone</b> :</label>
                                    <input type="text" name="user_phone" class="form-control" id="phone" placeholder="eg. +country code, numbers" required>
                                </div>
                                <div class="form-group">
                                    <label for="address"><b>Address</b> :</label>
                                    <input type="text" name="user_address" class="form-control" id="address" placeholder="eg. N.N Road, Siliguri, 736213" required>
                                </div>
                                <div class="form-group">
                                    <select class="form-control" name="user_type">
                                        <option selected disabled><---Select your registration type---></option>
                                        <option value="buyer">Buyer</option> 
                                        <option value="seller">Seller</option> 
                                        <option value="admin">Admin</option> 
                                    </select>
                                </div>
                            </div>

                            <div class="card-footer text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
