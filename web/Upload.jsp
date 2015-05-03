<%-- 
    Document   : Upload
    Created on : Apr 29, 2015, 12:13:42 AM
    Author     : HenGzTy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="css/style" rel="stylesheet" type="text/css">

        <style type="text/css" media="all">
            @import url("css/upload.css");
            @import url("css/style.css");
            @import url("http://weloveiconfonts.com/api/?family=entypo");
        </style>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/reset.css">
        <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
        <!-- Resource style -->
        <script src="js/modernizr.js"></script><!-- Modernizr -->
    </head>

    <body>


        <div>
            <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"><a href="Home.jsp"> <img src="img/web-logo.png" width="100" height="50"  style="float:left;margin-left:50px;margin-top:15px"> </a> </div>
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
            <form action="upload.do" method="post" enctype="multipart/form-data" >
                <div class="choose ">
                    <div class="buttonchoose roundedCorners animation"  style="margin-left:2%; height:40px; width:300px; font-size:30px;">
                        <input type="file" name="file" value="" style="opacity: 0.5; margin-top:5px;"/>
                    </div>


                    <h1 style="float:left; margin:10px;">Name</h1>
                    <input type="name" name="namepic"	 	style="margin:10px;width:710px; padding-left:15px; display:block;border-radius:5px; border:#000; background-color:#B4B4B4;">
                    <h1 style="float:left; margin:10px;">Price (USD)</h1><br><br>
                    <input type="price" name="pricepic" 	style="margin:10px;width:200px; padding-left:15px; display:block;border-radius:5px; border:#000; background-color:#B4B4B4;">
                    <h1 style="float:left; margin:10px;">Catalog</h1>
                    <div class="dropdown" style="margin-left:10px;">
                        <select name="catalog" class="dropdown-select">
                            <option value="">Select…</option>
                            <option value="1">People</option>
                            <option value="2">Place</option>
                            <option value="3">Nature</option>
                            <option value="4">Animal</option>
                            <option value="5">Food</option>
                            <option value="6">Graphic</option>
                            <option value="7">Things</option>
                            <option value="8">Other..</option>
                        </select>
                    </div>
                    <br>
                    <br>

                    <h1 style="float:left; margin:10px;">Description</h1>
                    <TEXTAREA type="description" name="description"  style="border-radius:10px;border-color:#F36; padding: 15px; margin:10px; border: #09F; width:700px; height:300px;"  ></TEXTAREA>
                    <button>Upload</button>
                </div>
            </form>
            <div class="wrapper">
                <div class="social">&#62220;</div>
                <div class="social">&#62217;</div>
                <div class="social">&#62223;</div>
                <div class="social">&#62232;</div>
                <div class="social">&#62235;</div>
                <div class="social">&#62226;</div>
                <div class="social">&#62214;</div>
            </div>


            <script src="js/jquery-2.1.1.js"></script> 
            <script src="js/main.js"></script> <!-- Resource jQuery --> 
    </body>
</html>
