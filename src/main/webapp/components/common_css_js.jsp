<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<!--Razor Pay Script-->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<!-- Font awesome cdn -->
<script src="https://kit.fontawesome.com/b88c6e57bb.js" crossorigin="anonymous"></script>

<style>
    .custom-bg{
        background: #004d40 !important;
    }

    .hover .card:hover{
        background: #e2e2e2;
        cursor: pointer;
    }

    input[type="file"] {
        display: none;
    }

    .custom-file-upload {
        border: 1px solid #ccc;
        display: inline-block;
        padding: 6px 12px;
        cursor: pointer;
    }

    .list-group-item.active{
        background-color: #004d40 !important;
        border-color: #004d40 !important;
    }
</style>



<script>
    function clearCart()
    {
        let itemsArray = [];
        if (localStorage.getItem('itemsJSON') != null) {
            let localStr = localStorage.getItem('itemsJSON');
            itemsArray = JSON.parse(localStr);
        }
        itemsArray = [];
        localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));

        let cartTable = document.getElementById('cart-table');
        let str = "";
        str += ` <thead class="custom-bg text-light">
                                <tr>
                                    <th scope="col">no.</th>
                                    <th scope="col">Item name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody id="tBody">
                            </tbody>`;
        cartTable.innerHTML = str;

        let cart = document.getElementById('cart-val');
        cart.innerHTML = '(' + 0 + ')';

        //disable the check out button.....
        let checkOut = document.getElementById('check-out');
        checkOut.classList.add("disabled");
    }

    window.onload = function ()
    {
        //landing on index page should clear the cart.................
        if (window.location.href.length == 22 || window.location.href.includes('index.jsp'))
        {
            clearCart();
        }

        if (JSON.parse(localStorage.getItem('itemsJSON')).length == 0)
        {
            let checkOut = document.getElementById('check-out');
            checkOut.classList.add("disabled");
        } else
        {
            let checkOut = document.getElementById('check-out');
            checkOut.classList.remove("disabled");
        }


        let cart = document.getElementById('cart-val');
        let localStr = localStorage.getItem('itemsJSON');
//        alert(localStr)
        if (localStr == null)
        {
            cart.innerHTML = '(' + 0 + ')';
        } else
        {
            itemsArray1 = JSON.parse(localStr);
            cart.innerHTML = '(' + itemsArray1.length + ')';
        }

        let itemsArray = [];
        if (localStorage.getItem('itemsJSON') != null) {
            let localStr = localStorage.getItem('itemsJSON');
            itemsArray = JSON.parse(localStr);
            let tBody = document.getElementById('tBody');
            let str = "";
            itemsArray.forEach((e, index) => {
                str +=
                        `<tr>
                                    <th scope="row">\${index+1}</th>
                                    <td>\${e[1]}</td>
                                    <td><i class="fas fa-plus-square" onclick="increase(\${e[0]})"></i> \${e[3]} <i class="fas fa-minus-square" onclick="decrease(\${e[0]})"></i></td>
                                    <td>\${e[2]}</td>
                                    <td><button id="remove" class="btn btn-danger" onclick="removeItemById(\${e[0]})">Remove</button></td>
                          </tr>`;
            });
            tBody.innerHTML = str;
        }

    }

    function addToCart(pId, pName, pPrice)
    {
        let itemsArray = [];
        if (localStorage.getItem('itemsJSON') == null)
        {
            //Means cart is empty....
            itemsArray.push([pId, pName, pPrice, 1]);
            localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));
//            window.location.reload();
        } else
        {
            let flg = true;
            //Means cart is not empty............
            let localStr = localStorage.getItem('itemsJSON');
            itemsArray = JSON.parse(localStr);
            itemsArray.forEach(
                    function (e)
                    {
                        if (e[0] == pId) {
//                            e[3] += 1;
                            let actualPrice = e[2] / e[3];
                            e[3] += 1;
                            e[2] += actualPrice;
                            flg = false;
                        }
                    }
            )
            if (flg) {
                itemsArray.push([pId, pName, pPrice, 1]);
            }
            localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));
        }
        let cart = document.getElementById('cart-val');
        cart.innerHTML = '(' + itemsArray.length + ')';

        // populate th table....
        let localStr = localStorage.getItem('itemsJSON');
        itemsArray = JSON.parse(localStr);
        let tBody = document.getElementById('tBody');
        let str = "";
        itemsArray.forEach((e, index) => {
            str +=
                    `<tr>
                                    <th scope="row">\${index+1}</th>
                                    <td>\${e[1]}</td>
                                    <td><i class=" fas fa-plus-square" onclick="increase(\${e[0]})"></i> \${e[3]} <i class="fas fa-minus-square" onclick="decrease(\${e[0]})"></i></td>
                                    <td>\${e[2]}</td>
                                    <td><button  id="remove" class="btn btn-danger" onclick="removeItemById(\${e[0]})">Remove</button></td>
                          </tr>`;
        });
        tBody.innerHTML = str;

//        enable the checkout button..................
        let checkOut = document.getElementById('check-out');
        checkOut.classList.remove("disabled");
    }

    function increase(pId)
    {
        console.log("increase " + pId);

        let itemsArray = [];
        let localStr = localStorage.getItem('itemsJSON');
        itemsArray = JSON.parse(localStr);

        itemsArray.forEach(
                function (e)
                {
                    if (e[0] == pId)
                    {
                        let actualPrice = e[2] / e[3];
                        e[3] += 1;
                        e[2] += actualPrice;
                    }
                }
        )

        localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));

        let str = "";
        itemsArray.forEach((e, index) => {
            str +=
                    `<tr>
                                    <th scope="row">\${index+1}</th>
                                    <td>\${e[1]}</td>
                                    <td><i class=" fas fa-plus-square" onclick="increase(\${e[0]})"></i> \${e[3]} <i class="fas fa-minus-square" onclick="decrease(\${e[0]})"></i></td>
                                    <td>\${e[2]}</td>
                                    <td><button  id="remove" class="btn btn-danger" onclick="removeItemById(\${e[0]})">Remove</button></td>
                          </tr>`;
        });
        let tBody = document.getElementById('tBody');
        tBody.innerHTML = str;

    }


    function decrease(pId) {
        console.log("decrease " + pId);

        let itemsArray = [];
        let localStr = localStorage.getItem('itemsJSON');
        itemsArray = JSON.parse(localStr);

        itemsArray.forEach(
                function (e)
                {
                    if (e[0] == pId)
                    {
                        if (e[3] > 1)
                        {
                            let actualPrice = e[2] / e[3];
                            e[3] -= 1;
                            e[2] -= actualPrice;
                        }
                    }
                }
        )

        localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));

        let str = "";
        itemsArray.forEach((e, index) => {
            str +=
                    `<tr>
                                    <th scope="row">\${index+1}</th>
                                    <td>\${e[1]}</td>
                                    <td><i class=" fas fa-plus-square" onclick="increase(\${e[0]})"></i> \${e[3]} <i class="fas fa-minus-square" onclick="decrease(\${e[0]})"></i></td>
                                    <td>\${e[2]}</td>
                                    <td><button id="remove" class="btn btn-danger" onclick="removeItemById(\${e[0]})">Remove</button></td>
                          </tr>`;
        });
        let tBody = document.getElementById('tBody');
        tBody.innerHTML = str;


    }


    //Check out..................
    $(document).on('click', '#check-out', function () {
        //alert("clicked"); 

        if (!window.location.href.includes('home.jsp'))
        {
            window.location.replace('http://localhost:9494/login.jsp');
        }

        let itemsArray = [];
        let localStr = localStorage.getItem('itemsJSON');
//        console.log(localStr);
        itemsArray = JSON.parse(localStr);

        total_amount = 0;
        itemsArray.forEach(
                function (e)
                {
//                    console.log(e)
                    total_amount += e[2];
                }
        )
        const d = {
            amount: total_amount,
            items: localStr
        }
        $.ajax(
                {
                    url: "createOrderServlet",
                    //data: d,
                    
                    //contentType: 'application/json',  //ContentType specifies the datatype of our data which we're passing to server
                    type: 'POST',
                    dataType: 'json', //dataType: specifies the datatype of the data which we're getting as response from server
                    data: d,
                    success: function (response, textStatus, jqXHR) {

                        if (response.status == "created")
                        {
//                            open payment form.....................
                            let options = {
                                "key": "rzp_test_PcZtcdZRiGnBtK",
                                "amount": response.amount,
                                "currency": "INR",
                                "name": "Test",
                                "description": "Test",
                                "order_id": response.id,
                                "handler": function (response) {
                                    alert(response.razorpay_payment_id);
                                    alert(response.razorpay_order_id);
                                    alert(response.razorpay_signature);
                                    alert("Payment Successfull");

                                },
                                "prefill": {
                                    "name": "A G",
                                    "email": "arindam.ghosh@example.com",
                                    "contact": "7001290785"
                                },
                                "notes": {
                                    "address": "Razorpay Testing"
                                },
                                "theme": {
                                    "color": "#3399cc"
                                }

                            };
                            let rzp = new Razorpay(options);
                            rzp.on('payment.failed', function (response) {
                                alert(response.error.code);
                                alert(response.error.description);
                                alert(response.error.source);
                                alert(response.error.step);
                                alert(response.error.reason);
                                alert(response.error.metadata.order_id);
                                alert(response.error.metadata.payment_id);
                            });
                            rzp.open();
                        }
                    },
                    error: function (errorData, textStatus, errorThrown) {
                        console.log(errorData)
                    }
                }
        )



    });

    function removeItemById(pId)
    {
        let itemsArray = [];
        let localStr = localStorage.getItem('itemsJSON');
        itemsArray = JSON.parse(localStr);
        let indx;
        itemsArray.forEach(
                function (e, index)
                {
                    if (e[0] == pId)
                    {
                        indx = index;
                    }
                }
        )

        itemsArray.splice(indx, 1);
        localStorage.setItem('itemsJSON', JSON.stringify(itemsArray));


        let str = "";
        itemsArray.forEach((e, index) => {
            str +=
                    `<tr>
                                    <th scope="row">\${index+1}</th>
                                    <td>\${e[1]}</td>
                                    <td><i class=" fas fa-plus-square" onclick="increase(\${e[0]})"></i> \${e[3]} <i class="fas fa-minus-square" onclick="decrease(\${e[0]})"></i></td>
                                    <td>\${e[2]}</td>
                                    <td><button id="remove" class="btn btn-danger" onclick="removeItemById(\${e[0]})">Remove</button></td>
                          </tr>`;
        });
        let tBody = document.getElementById('tBody');
        tBody.innerHTML = str;

        let cart = document.getElementById('cart-val');
        cart.innerHTML = '(' + itemsArray.length + ')';

        //after removing every item from cart, check if it was the last item
        if (itemsArray.length == 0)
        {
            clearCart();
        }
    }
</script>
