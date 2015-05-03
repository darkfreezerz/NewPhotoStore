<%-- 
    Document   : EditProfile
    Created on : May 1, 2015, 9:50:25 PM
    Author     : niponsarikan
--%>

<%@page import="bean.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html>
    <head>
        <style type="text/css" media="all">

            @import url("http://weloveiconfonts.com/api/?family=entypo");

        </style>
        <meta charset="utf-8">
        <title>Untitled Document</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/reset.css">

        <link rel="stylesheet" href="css/profile.css">
        <!-- CSS reset -->
        <link rel="stylesheet" href="css/style.css">
        <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
        <!-- Resource style -->
        <script src="js/modernizr.js"></script><!-- Modernizr -->
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


            <div class="shadow">

                <div id="content-wrapper">
                    <div id="aboutme" class="active" >
                        <h5 class="textborder">Edit Profile</h5>

                        <%if (role.equals("merchant")) {
                                User user = new User();
                                user = (User) session.getAttribute("profiledata");
                        %>
                        <form action="editprofileservlet.do" method="POST">
                            <br><br>
                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">First name: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px; height:25px; padding-left:5px; " type="text" name="firstname" value="<%=user.getFirstname()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Last name: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="lastname" value="<%=user.getLastname()%>" /></div>

                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Tel: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="email" value="<%=user.getEmail()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">E-mail: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="tel" value="<%=user.getPhone()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Address: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="address" value="<%=user.getAddress()%>" /></div>

                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Distinct: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="distinct" value="<%=user.getDistinct()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Province: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="province" value="<%=user.getProvince()%>" /></div>

                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Country: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="country" value="<%=user.getCountry()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Zipcode: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="zipcode" value="<%=user.getZipcode()%>" /></div>

                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Paypal Account: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="paypal" value="<%=user.getPaypal()%>" /></div>

                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px;opacity:0; ">Paypal: </h3>

                            </div><br>

                            <input type="submit" value="Confirm" class="myButton" />


                        </form>

                        <%} else if (role.equals("customer")) {
                            User user = new User();
                            user = (User) session.getAttribute("profiledata");
                        %>
                        <form action="editprofileservlet.do" method="POST">
                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">First name: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px; height:25px; padding-left:5px; " type="text" name="firstname" value="<%=user.getFirstname()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Last name: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="lastname" value="<%=user.getLastname()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">E-mail: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="email" value="<%=user.getEmail()%>" /></div>


                            <div class="box" style="display:inline-block; width:390px;"><h3 style="float:left; margin:10px; ">Tel: </h3>
                                <input style="margin-top:10px;width:230px; border-radius:10px;height:25px; padding-left:5px; " type="text" name="tel" value="<%=user.getPhone()%>" /></div>



                            <br><br><br>
                            <input type="submit" value="Confirm" class="myButton" />
                            <br><br><br>
                        </form>

                        <%}%>
                    </div>
                </div>
                ::after
            </div>



            <div class="wrapper">
                <div class="social">&#62220;</div>
                <div class="social">&#62217;</div>
                <div class="social">&#62223;</div>
                <div class="social">&#62232;</div>
                <div class="social">&#62235;</div>
                <div class="social">&#62226;</div>
                <div class="social">&#62214;</div>
            </div>
            <br><br><br>
            <script src="js/jquery-2.1.1.js"></script> 
            <script src="js/main.js"></script> <!-- Resource jQuery -->
    </body>
</html>
