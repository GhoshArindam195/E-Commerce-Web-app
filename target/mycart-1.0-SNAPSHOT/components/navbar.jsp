
<style>
    .custom-bg{
        background: #004d40 !important;
    }
</style>

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
        </ul>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a  class="nav-link" id="cart-icon" href="#" data-toggle="modal" data-target="#cart-modal"><i id="cart-val">(0)</i><i class="fas fa-cart-arrow-down" style="font-size: 20px;"></i><span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login<span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register.jsp">Register<span class="sr-only"></span></a>
            </li>
        </ul>
    </div>
</nav>
