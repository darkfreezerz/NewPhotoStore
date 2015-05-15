<%-- 
    Document   : SearchCategoryResult
    Created on : Apr 30, 2015, 7:59:02 PM
    Author     : HenGzTy
--%>

<%@page import="java.io.File"%>
<%@page import="database.SearchEngine"%>
<%@page import="bean.Product"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Product> products = new LinkedList<Product>();
    products = (List) session.getAttribute("searchKeyWord");

    String keyword = (String) session.getAttribute("keyword");
%>

<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/polaroid.css">
        <!-- CSS reset -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
        <!-- Resource style -->
         <style type="text/css" media="all">
            @import url("css/reset.css");
            @import url("css/style.css");
            @import url("http://weloveiconfonts.com/api/?family=entypo");
            @import url("css/button.css");
        </style>
        <script src="js/modernizr.js"></script><!-- Modernizr -->

        <title>Full-Screen Pop-Out Navigation</title>
    </head>
    <body>

        <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999">
            <a href="Home.jsp"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </a> </div>
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
        <br><br>

        <form action="search.do" method="post" class="form-wrapper cf">
            <input type="text"  name="picturename" placeholder="Search Some Photo ......" >
            <button type="submit"  >Search</button>
        </form>

        <div class="body" align="center"style="margin-left: auto;margin-right: auto;">
            <ul class="hoverbox">
                <h1 style="font-size:24px;"></h1>
                <br>
                <br>
                <% for (Product product : products) {%>
                <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                    <li> <a href="AddToCart.jsp?pointer=<%= products.indexOf(product)%>"  ><img src="Watermark<%= File.separator + product.getmID() + File.separator + "re" + product.getId() + ".jpg"%>" alt="description" /> <img src="Watermark<%= File.separator + product.getmID() + File.separator + product.getId() + "_wm.jpg"%>" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a>
                </div>
                <% }%>
                </div>
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
<script src="js/main.js"></script> <!-- Resource jQuery --> 