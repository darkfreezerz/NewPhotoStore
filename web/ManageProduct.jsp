<%-- 
    Document   : ManageProduct
    Created on : Apr 28, 2015, 6:48:26 PM
    Author     : niponsarikan
--%>

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
                            <%} else if (role.equals("customer")) {%>
                        <li><a href="RegLog.jsp">Log out</a></li>
                        <li><a href="RegLog.jsp">Cart</a></li>
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
                <ul class="cd-primary-nav">
                    <%if (role.equals("customer")) {%>
                    <li class="cd-label">Information</li>
                    <li><a href="#0">My Information</a></li>
                    <li class="cd-label">Product</li>
                    <li><a href="#0">My Photo</a></li>
                    <li class="cd-label">Follow us</li>
                    <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                    <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                    <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                    <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>

                    <%} else if (role.equals("merchant")) {%>
                    <li class="cd-label">Information</li>
                    <li><a href="#0">My Information</a></li>
                    <li class="cd-label">Manage</li>
                    <li><a href="#0">Add Photo</a></li>
                    <li><a href="#0">Remove Photo</a></li>
                    <li class="cd-label">Payment</li>
                    <li><a href="#0">Call Payment</a></li>

                    <li class="cd-label">Follow us</li>
                    <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                    <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                    <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                    <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>

                    <%} else if (role.equals("admin")) {%>
                    <li class="cd-label">User</li>
                    <li><a href="#0">Merchant</a></li>
                    <li><a href="#0">Customer</a></li>
                    <li class="cd-label">Product</li>
                    <li><a href="#0">Enable Photo</a></li>
                    <li><a href="#0">Delete Photo</a></li>
                    <li><a href="#0">Photo Information</a></li>
                    <li class="cd-label">Payment</li>
                    <li><a href="#0">Set Payment</a></li>
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
                    <h3>Data Table</h3>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <%
                List<Product> products = new LinkedList<Product>();
                if (role.equals("customer")) {
                    products = (List) session.getAttribute("searchcustomer");
            %>
            <table class="table-fill">
                <thead>
                    <tr>
                        <th class="text-left">Photo</th>
                        <th class="text-left">Name</th>
                        <th class="text-left">Price</th>
                        <th class="text-left">Info</th>
                        <th class="text-left">Download</th>

                    </tr>
                </thead>
                <tbody class="table-hover">
                    <tr>
                        <%for (Product product : products) {%>
                        <td class=""> <img src="PhotoStore<%=File.separator + product.getmID() + File.separator + product.getAddress()%>" alt="re1" /></td>
                        <td class="text-left"><%=product.getName()%></td>
                        <td class="text-left">$<%=product.getPrice()%></td>

                        <td class=""><a href="#" class="myButton" >Get Info</a></td>
                        <td class=""><a href="#" class="myButton">Remove</a></td>
                        <%}%>
                    </tr>

                </tbody>
            </table>
            <%} else if (role.equals("merchant")) {
                products = (List) session.getAttribute("searchmerchant");
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
                    <tr>
                        <%for (Product product : products) {%>
                        <td class=""> <img src="PhotoStore<%=File.separator + product.getmID() + File.separator + product.getAddress()%>" alt="re1" /></td>
                        <td class="text-left"><%=product.getName()%></td>
                        <td class="text-left">$<%=product.getPrice()%></td>
                        <td class="text-left"><%=product.getDate()%></td>
                        <td class="text-left">$<%=product.getSaleAmount()%></td>
                        <td class=""><a href="#" class="myButton" >Get Info</a></td>
                        <td class=""><a href="#" class="myButton">Remove</a></td>
                        <%}%>
                    </tr>

                </tbody>
            </table>


            <%}%>

            <script src="js/jquery-2.1.1.js"></script> 
            <script src="js/main.js"></script>



    </body>
</html>
