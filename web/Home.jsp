<%-- 
    Document   : Home
    Created on : Apr 28, 2015, 6:36:40 PM
    Author     : niponsarikan
--%>

<%@page import="java.io.File"%>
<%@page import="bean.Product"%>
<%@page import="database.SearchEngine"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
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
        <style type="text/css" media="all">
            @import url("css/reset.css");
            @import url("css/style.css");
            @import url("http://weloveiconfonts.com/api/?family=entypo");
            @import url("css/button.css");
        </style>

        <title>Full-Screen Pop-Out Navigation</title>
    </head>
    <body>

        <!--<div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999">
            <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </div>-->
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


        <section class="cd-intro">
            <h1>Best Photo with you</h1>
        </section>
        <main class="cd-main-content">
            <div class="cd-container">
                <p> <br><br><br><br><br><br></p>
                <form action="search.do" method="post" class="form-wrapper cf">
                    <input type="text"  name="picturename" placeholder="Search Some Photo ......" >
                    <button type="submit"  >Search</button>
                </form>


                <% SearchEngine search = new SearchEngine();

                    List<Product> newP = new LinkedList<Product>();
                    List<Product> topP = new LinkedList<Product>();
                    newP = search.Searchnew();
                    topP = search.Searchtop();
                    HttpSession picture = request.getSession();

                    picture.setAttribute("searchNew", newP);
                    picture.setAttribute("searchTop", topP);


                %>
                <div class="body" align="center">
                    <ul class="hoverbox">
                        <h1 style="font-size:24px;">Best Seller</h1>
                        <br>
                        <% for (Product product : topP) {%>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="AddToCart.jsp?pointer=<%= topP.indexOf(product)%>&sflag=top"  ><img src="Watermark<%= File.separator + product.getmID() + File.separator + "re" + product.getId() + ".jpg"%>" alt="description" /> <img src="Watermark<%= File.separator + product.getmID() + File.separator + product.getId() + "_wm.jpg"%>" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a>
                        </div>
                        <% }%>



                        <br>
                        <br>
                        <br>
                        <br>



                        <h1 style="font-size:24px;">New Release</h1>
                        <br>
                        <% for (Product product : newP) {%>
                        <div style="display:inline-table;width:212px;height:212px;background:rgba(153,102,0,.3);text-align:center;margin-bottom:4px;" >
                            <li> <a href="AddToCart.jsp?pointer=<%= newP.indexOf(product)%>&sflag=new"  ><img src="Watermark<%= File.separator + product.getmID() + File.separator + "re" + product.getId() + ".jpg"%>" alt="description" /> <img src="Watermark<%= File.separator + product.getmID() + File.separator + product.getId() + "_wm.jpg"%>" alt="description" class="preview" style="max-height:400px;max-width:400px" /></a>
                        </div>
                        <% }%>


                    </ul>
                    <br>
                    <br>
                    <br>
                    <h1 style="font-size:18px;text-align:Center">Explore mutiple category of images,at ridiculously great prices.</h1>
                    <br>
                    <div id="polaroid"> <a href="search.do?cat=4">
                            <figure> <img src="img/animal.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Animal</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=2">
                            <figure> <img src="img/place.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Place</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=1">
                            <figure> <img src="img/people.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>People</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=3">
                            <figure> <img src="img/nature.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Nature</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=5">
                            <figure> <img src="img/food.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Food</figcaption>
                            </figure>
                        </a> <a href="search.do?cat=6">
                            <figure> <img src="img/graphic.jpg" width="200" height="200" alt="Red mushroom" />
                                <figcaption>Graphic</figcaption>
                            </figure>
                        </a>
                        </figure>
                    </a> <a href="search.do?cat=7">
                    <figure> <img src="img/things.jpg" width="200" height="200" alt="Red mushroom" />
                        <figcaption>Things</figcaption>
                    </figure>
                </a>
                </figure>
            </a> <a href="search.do?cat=8">
            <figure> <img src="img/other.jpg" width="200" height="200" alt="Red mushroom" />
                <figcaption>Other</figcaption>
            </figure>
        </a> </div>
</div>
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
</main>
</body>
</html>
