<%-- 
    Document   : ShowCart
    Created on : Apr 30, 2015, 10:07:23 PM
    Author     : HenGzTy
--%>

<%@page import="database.Cart"%>
<%@page import="java.io.File"%>
<%@page import="bean.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <style>
        @import url("http://weloveiconfonts.com/api/?family=entypo");
		</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
        <meta name="description" content="Login and Registration Form with HTML5 and CSS3" />
        <meta name="keywords" content="html5, css3, form, switch, animation, :target, pseudo-class" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link rel="stylesheet" href="css/reset.css">
        <!-- CSS reset -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="css/stylelogin.css" />
        <link rel="stylesheet" type="text/css" href="css/table.css" />
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <div>
            <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </div>
           <header class="cd-header">
            <nav>
                <ul class="cd-secondary-nav">
                    <li><a href="reglog.html">About</a></li>
                        <%

                            String role = (String) session.getAttribute("role");
                            if (role.equals("")) {

                        %>

                    <li><a href="RegLog.jsp">Login</a></li>
                    <li><a href="RegLog.jsp#toregister">Register</a></li>
                    <li><a href="Home.jsp">Home</a></li>
                        <%} else if (role.equals("customer")) {%>
                    <li><a href="RegLog.jsp">Log out</a></li>
                    <li><a href="AddToCart.jsp">Cart</a></li>
                        <%} else if (role.equals("merchant")) {%>
                    <li><a href="RegLog.jsp">Log out</a></li>

                    <%} else if (role.equals("admin")) {%>
                    <li><a href="RegLog.jsp">Log out</a></li>
                        <%}%>
                </ul>
            </nav>
            <!-- cd-nav --> 
        
            <a class="cd-primary-nav-trigger" href="#0"> <span class="cd-menu-text">manage</span><span class="cd-menu-icon"></span> </a> <!-- cd-primary-nav-trigger --> 
        </header>
        <nav>
            <!-- customer -->
            <ul class="cd-primary-nav">
                <%if (role.equals("customer")) {%>
                <li class="cd-label">Information</li>
                <li><a href="showprofileinfo.do">My Information</a></li>
                <li class="cd-label">Product</li>
                <li><a href="manage.do">My Photo</a></li>
                <li class="cd-label">Follow us</li>
                <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                    
                <!--merchant -->
                 <%}else if (role.equals("merchant")) {%>
                <li class="cd-label">Information</li>
                <li><a href="showprofileinfo.do">My Information</a></li>
                <li class="cd-label">Manage</li>
                <li><a href="Upload.jsp">Add Photo</a></li>
                <li><a href="manage.do">Remove Photo</a></li>
                <li class="cd-label">Payment</li>
                <li><a href="showcallpayment.do">Call Payment</a></li>

                <li class="cd-label">Follow us</li>
                <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                    
                <%}else if (role.equals("admin")) {%>
                <li class="cd-label">User</li>
                <li><a href="showuserdata.do?userrole=merchant">Merchant</a></li>
                <li><a href="showuserdata.do?userrole=customer">Customer</a></li>
                <li class="cd-label">Product</li>
                <li><a href="enableproduct.do">Enable Photo</a></li>
                <li><a href="manage.do">Delete Photo</a></li>
             
                <li class="cd-label">Payment</li>
                 <li><a href="showrequestpayment.do">Set Payment</a></li>
                <li class="cd-label">Follow us</li>
                <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                    <%}%>
            </ul>
        </nav>


            <br>
            <br>
            <div class="table-title" align="center" >
                <div style="padding:10px; width:300px;height:50px;background-color:rgba(255,255,255,.3); border-radius:10px;">
                    <h3>Product Data</h3>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <%  Cart something = new Cart();
                List<Product> cart = new LinkedList<Product>();
                if (role.equals("customer")) {
                    something = (Cart) session.getAttribute("cart");
                    cart = something.getCart();
            %>

            <table class="table-fill">

                <tr>
                    <th class="text-left">Photo</th>
                    <th class="text-left">Name</th>
                    <th class="text-left">Price</th>
                    <th class="text-left">Description</th>
                    <th class="text-left">Remove</th>

                </tr>


                <tbody class="table-hover">
                    <%for (Product product : cart) {%>
                    <tr>

                        <td class=""> <img src="PhotoStore<%=File.separator + product.getmID() + File.separator + product.getAddress()%>" style="max-height: 200px ;max-width: 200px" /></td>
                        <td class="text-left"><%= product.getName()%></td>
                        <td class="text-left">$<%=product.getPrice()%></td>

                        <td class="text-left"><%= product.getDescription()%></td>
                        <td class=""><a href="#" class="myButton">Remove</a></td>


                    </tr>
                    <%}%>

                </tbody>
            </table><br><br>
            <div align="right" style="padding:30px; font-size:30px;">Total Price<span style="border-radius:10px;margin:10px; font-size:18px; background-color:#fff; padding:10px; width:200px;"><%= something.PriceSum(cart) %></span>
                <br><br><br>
                <span><div align="right">
                        <a href="BillingPage.jsp?amount=<%=something.PriceSum(cart) %>"><input type='image' name='submit' value="click"  src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif' border='0' align='top' alt='Check out with PayPal'/></a>
                    </div>
            </div></span></div>


    <br><br>
    <div class="wrapper">
        <div class="social">&#62220;</div>
        <div class="social">&#62217;</div>
        <div class="social">&#62223;</div>
        <div class="social">&#62232;</div>
        <div class="social">&#62235;</div>
        <div class="social">&#62226;</div>
        <div class="social">&#62214;</div>
    </div>
    <br><br><br><br>
<td class="text-left"><%= something.PriceSum(cart)%></td>
<%} else if (role.equals("merchant")) {
    cart = (List) session.getAttribute("searchmerchant");
%>

<table class="table-fill">
    <thead>
        <tr>
            <th class="text-left">Photo</th>
            <th class="text-left">Name</th>
            <th class="text-left">Price</th>
            <th class="text-left">Date</th>
            <th class="text-left">SaleAmount</th>
            <th class="text-left">Info</th>
            <th class="text-left">Delete</th>


        </tr>
    </thead>
    <tbody class="table-hover">
        <%for (Product product : cart) {%>
        <tr>

            <td class=""> <img src="PhotoStore<%=File.separator + product.getmID() + File.separator + product.getAddress()%>" style="max-height: 200px ;max-width: 200px"/></td>
            <td class="text-left"><%=product.getName()%></td>
            <td class="text-left">$<%=product.getPrice()%></td>
            <td class="text-left"><%=product.getDate()%></td>
            <td class="text-left">$<%=product.getSaleAmount()%></td>
            <td class=""><a href="#" class="myButton" >Get Info</a></td>
            <td class=""><a href="#" class="myButton">Remove</a></td>

        </tr>
        <%}%>

    </tbody>
</table>


<%}%>

<script src="js/jquery-2.1.1.js"></script> 
<script src="js/main.js"></script>



</body>
</html>

