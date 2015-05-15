<%-- 
    Document   : ShowProfileinfo
    Created on : Apr 30, 2015, 11:07:25 PM
    Author     : niponsarikan
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
        <link href="css/profile.css" rel="stylesheet" type="text/css">
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
        <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"> <a href="Home.jsp"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </a></div>
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


        <div class="shadow">

            <div id="content-wrapper">
                <div id="aboutme" class="active" >
                    <h5 class="textborder">My Profile Information</h5>
                    <%if (role.equals("merchant")) {
                            User user = new User();
                            user = (User) session.getAttribute("profiledata");


                    %>
                    <br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">First name</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getFirstname()%></h2></div>


                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Last name</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getLastname()%></h2></div>
                    <br><br><br>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Tel</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getPhone()%></h2></div>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Email</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getEmail()%></h2></div>
                    <br><br><br>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Address</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getAddress()%></h2></div>


                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Distinct</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getDistinct()%></h2></div>

                    <br><br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Province</h3>
                        <h2 style="float:left; margin:10px; ">:: <%=user.getProvince()%></h2></div>


                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Country</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getCountry()%></h2></div>

                    <br><br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Zipcode</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getZipcode()%></h2></div>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Paypal</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getPaypal()%></h2></div>
                    <br><br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Sale Amount</h3>
                        <h2 style="float:left; margin:10px; ">: $ <%=user.getSaleamount()%></h2></div>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Register Date/Time</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getDate()%></h2></div>
                    <br><br><br>



                    <%} else if (role.equals("customer")) {
                        User user = new User();
                        user = (User) session.getAttribute("profiledata");
                    %>
                    <br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">First name</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getFirstname()%></h2></div>


                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Last name</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getLastname()%></h2></div>
                    <br><br><br>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Tel</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getPhone()%></h2></div>

                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Email</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getEmail()%></h2></div>
                    <br><br><br>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Buy Amount</h3>
                        <h2 style="float:left; margin:10px; ">: $ <%=user.getBuyamount()%></h2></div>
                    <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Register Date/Time</h3>
                        <h2 style="float:left; margin:10px; ">: <%=user.getDate()%></h2></div>



                        <%}%>
                    
                    <br><br><br>
                    <a href="EditProfile.jsp" class="myButton" >Edit</a>
                    <br><br><br>
                </div>
            </div>
            ::after
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
    </body>
</html>

