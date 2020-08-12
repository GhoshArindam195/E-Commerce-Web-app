<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
        <title>Login | MyCart</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %><br><br>
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
    </body>
</html>
