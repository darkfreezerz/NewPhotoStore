<%-- 
    Document   : Home
    Created on : Apr 28, 2015, 6:36:40 PM
    Author     : niponsarikan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
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
        <script src="js/modernizr.js"></script><!-- Modernizr -->

        <title>Full-Screen Pop-Out Navigation</title>
    </head>
    <body>

        <!--<div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999">
            <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </div>-->
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
                <li><a href="#0">Call Payment</a></li>

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
                 <li><a href="#0">Set Payment</a></li>
                <li class="cd-label">Follow us</li>
                <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                    <%}%>
            </ul>
        </nav>
            
           
        <section class="cd-intro">
            <h1>Full-Screen Pop-Out Naviion</h1>
        </section>
        <main class="cd-main-content">
            <div class="cd-container">
                <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore, quos, voluptate, sunt, in suscipit quibusdam quis dignissimos eligendi repellendus ipsam exercitationem adipisci nostrum fugit accusamus quae cum nisi accusantium eaque. </p>
                <form action="search.do" method="post" class="form-wrapper cf">
                    <input type="text"  name="picturename" placeholder="Search Some Photo ......" required>
                    <button type="submit"  >Search</button>
                </form>
                <div class="body" align="center">
                    <ul class="hoverbox">
                        <h1 style="font-size:24px;">Best Seller</h1>
                        <br>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <br>
                        <br>
                        <br>
                        <br>
                        <h1 style="font-size:24px;">New Release</h1>
                        <br>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="#" ><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" /> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg/780px-Abraham_Lincoln_head_on_shoulders_photo_portrait.jpg" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a> 
                        </div>
                        </li>
                    </ul>
                    <br>
                    <br>
                    <br>
                    <h1 style="font-size:18px;text-align:Center">Explore mutiple category of images,at ridiculously great prices.</h1>
                    <br>
                    <div id="polaroid"> <a href="search.do?cat=Animal">
                            <figure> <img src="img/animal.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Animal</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=Place">
                            <figure> <img src="img/place.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Place</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=People">
                            <figure> <img src="img/people.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>People</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=Nature">
                            <figure> <img src="img/nature.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Nature</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=Food">
                            <figure> <img src="img/food.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Food</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=Graphic">
                            <figure> <img src="img/graphic.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Graphic</figcaption>
                            </figure>
                        </a>
                        </figure>
                    </a> <a href="search.do?cat=Things">
                    <figure> <img src="img/things.jpg" width="200" height="200" alt="Red mushroom" />
                        <figcaption>Things</figcaption>
                    </figure>
                </a>
                </figure>
            </a> <a href="reglog.html">
            <figure> <img src="img/other.jpg" width="200" height="200" alt="Red mushroom" />
                <figcaption>Other</figcaption>
            </figure>
        </a> </div>
</div>
</div>
<script src="js/jquery-2.1.1.js"></script> 
<script src="js/main.js"></script> <!-- Resource jQuery --> 
</main>
</body>
</html>
