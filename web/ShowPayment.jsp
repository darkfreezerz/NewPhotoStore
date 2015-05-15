<%-- 
    Document   : ShowCallPayment
    Created on : May 2, 2015, 3:44:49 AM
    Author     : niponsarikan
--%>

<%@page import="bean.MerchantPayment"%>
<%@page import="bean.ProductSold"%>
<%@page import="bean.User"%>
<%@page import="java.io.File"%>
<%@page import="bean.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
         <style type="text/css" media="all">
            @import url("css/reset.css");
            @import url("css/style.css");
            @import url("http://weloveiconfonts.com/api/?family=entypo");
            @import url("css/button.css");
        </style>
        <script src="js/modernizr.js"></script>
    </head>
    <body>
        <div>
            <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"> <a href="Home.jsp"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </a> </div>
            <header class="cd-header">
                <nav>
                    <ul class="cd-secondary-nav">
                        <li><a href="Home.jsp">Home</a></li>
                       
                            <%

                                String role = (String) session.getAttribute("role");
                                if (role.equals("")) {

                            %>

                        <li><a href="RegLog.jsp">Login</a></li>
                        <li><a href="RegLog.jsp#toregister">Register</a></li>

                        <%} else if (role.equals("customer")) {%>

                        <li><a href="ShowCart.jsp">Cart</a></li>
                        <li><a href="logout.do">Log out</a></li>
                            <%} else if (role.equals("merchant")) {%>
                        <li><a href="logout.do">Log out</a></li>

                        <%} else if (role.equals("admin")) {%>
                        <li><a href="logout.do">Log out</a></li>
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
                    <%} else if (role.equals("merchant")) {%>
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

                    <%} else if (role.equals("admin")) {%>
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
                    <h3>Payment Data</h3>
                    <br>
                </div>
                <br>
                <br>

            </div>

            <%
                List<ProductSold> products = new LinkedList<ProductSold>();
                if (role.equals("merchant")) {
                    double salesum = (double) session.getAttribute("salesum");%>
            SaleSum Amount : $<%= salesum%> <br> <br>
            Payment Amount(Subtract 30%) : $<%=salesum * 0.7%> <br><br><br>
            <%if ((salesum * 0.7) > 20) { %>
            <a href="paymentservlet.do" class="myButton">Call Payment</a>


            <%}%>
            <br><br><br>
            <%products = (List<ProductSold>) session.getAttribute("mproductsold");%>
                
                <table class="table-fill">
                    <thead>
                        <tr>
                            <th class="text-left">Photo</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Sale Count</th>
                            <th class="text-left">Price</th>
                            <th class="text-left">Sale Amount</th>



                        </tr>
                    </thead>
                    <tbody class="table-hover">
                        <%for (ProductSold product : products) {%>
                        <tr>


                            <td class=""> <img src="PhotoStore<%=File.separator + product.getM_id() + File.separator + product.getP_address()%>" style="max-height: 200px ;max-width: 200px" /></td>
                            <td class="text-left"><%=product.getP_name()%></td>
                            <td class="text-left"><%=product.getP_salecount()%></td>
                            <td class="text-left">$<%=product.getP_price()%></td>
                            <td class="text-left">$<%=product.getSale_amount()%></td>


                        </tr>
                        <%}%>

                    </tbody>
                </table>
                <%} else if (role.equals("admin")) {
                    List<MerchantPayment> payment = new LinkedList<MerchantPayment>();
                    payment = (List<MerchantPayment>) session.getAttribute("merchantpayment");

                %>
                <table class="table-fill">
                    <thead>
                        <tr>
                            <th class="text-left">Name</th>
                            <th class="text-left">Cost</th>
                            <th class="text-left">Paypal Account</th>
                            <th class="text-left">Date</th>

                            <th class="text-left">Manage</th>




                        </tr>
                    </thead>
                    <tbody class="table-hover">
                        <%for (MerchantPayment merchant : payment) {%>
                        <tr>

                            <td class="text-left"><%=merchant.getMname() + " " + merchant.getMlast()%></td>
                            <td class="text-left"><%=merchant.getMpaycost()%></td>
                            <td class="text-left"><%=merchant.getMPaypal()%></td>
                            <td class="text-left"><%=merchant.getMpaydate()%></td>
                            <td class=""><a href="paymentservlet.do?paypal=<%=merchant.getMPaypal()%>&mpay=<%=merchant.getMpaycost() %>&pindex=<%=merchant.getMpayId() %>" class="myButton">Pay</a></td>


                        </tr>
                        <%}%>

                    </tbody>
                </table>


                <%}%>
<br><br><br><div class="wrapper">
    <div class="social">&#62220;</div>
    <div class="social">&#62217;</div>
    <div class="social">&#62223;</div>
    <div class="social">&#62232;</div>
    <div class="social">&#62235;</div>
    <div class="social">&#62226;</div>
    <div class="social">&#62214;</div>
<br><br><br></div>
                <script src="js/jquery-2.1.1.js"></script> 
                <script src="js/main.js"></script>



                </body>
                </html>
