<%-- 
    Document   : AddToCart
    Created on : Apr 29, 2015, 11:43:29 PM
    Author     : HenGzTy
--%>

<%@page import="database.ManageProduct"%>
<%@page import="java.io.File"%>
<%@page import="java.util.LinkedList"%>
<%@page import="bean.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>

        <script src="js/modernizr.js"></script> <!-- Modernizr -->
        <style type="text/css" media="all">
            @import url("css/reset.css");
            @import url("css/style.css");
            @import url("http://weloveiconfonts.com/api/?family=entypo");
            @import url("css/button.css");
        </style>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="css/reset.css">
                <link href="css/SearchBox.css" rel="stylesheet" type="text/css">
                    <title>miniGallery</title>
                    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />


                    <!--[if IE 7]><link href="css/ie7-only.css" rel="stylesheet" type="text/css" media=screen><![endif]-->
                    <!--[if lt IE 7]><link href="css/ie6-only.css" rel="stylesheet" type="text/css" media=screen><![endif]-->
                    <script src="js/modernizr.js"></script><!-- Modernizr -->
                    <% String index = request.getParameter("pointer");
                        List<Product> products = new LinkedList<Product>();
                        products = (List) session.getAttribute("searchKeyWord");
                        Product product = products.get(Integer.parseInt(index));

                        ManageProduct mp = new ManageProduct();

                    %>
                    </head>
                    <body>
                        <div>
                            <div id="menu-bar" style="width:100%;height:80px;background-color:black;z-index:-9999"> <img src="img/web-logo.png" width="100" height="50" style="float:left;margin-left:50px;margin-top:15px"> </div>
                            <header class="cd-header">
                                <nav>
                                    <ul class="cd-secondary-nav">
                                        <li><a href="#0">Log In</a></li>
                                        <li><a href="#0">Register</a></li>
                                    </ul>
                                </nav>
                                <!-- cd-nav --> 

                                <a class="cd-primary-nav-trigger" href="#0"> <span class="cd-menu-text">manage</span><span class="cd-menu-icon"></span> </a> <!-- cd-primary-nav-trigger --> 
                            </header>
                            <nav>
                                <ul class="cd-primary-nav">
                                    <li class="cd-label">About us</li>
                                    <li><a href="#0">The team</a></li>
                                    <li><a href="#0">Our services</a></li>
                                    <li><a href="#0">Our projects</a></li>
                                    <li class="cd-label">Work with us</li>
                                    <li><a href="#0">Start a project</a></li>
                                    <li><a href="#0">Join In</a></li>
                                    <li><a href="#0">Create an account</a></li>
                                    <li class="cd-label">Follow us</li>
                                    <li class="cd-social cd-facebook"><a href="#0">Facebook</a></li>
                                    <li class="cd-social cd-instagram"><a href="#0">Instagram</a></li>
                                    <li class="cd-social cd-dribbble"><a href="#0">Dribbble</a></li>
                                    <li class="cd-social cd-twitter"><a href="#0">Twitter</a></li>
                                </ul>
                            </nav>

                            <br>
                                <br>
                                    <br>
                                        <br>
                                            <div class="container content"  >
                                                <div id="tab-container-1"  align="center">
                                                    <div class="span-13" >
                                                        <div class="tab" id="tab1" > <a href="#"><img src="Watermark<%=File.separator + product.getmID() + File.separator + product.getId() + "_wm.jpg"%>"  /></a></div>
                                                        <div><br>
                                                                <h1 style="font:bold; font-size: 35px" > <%= product.getName()%> </h1>
                                                        </div>

                                                    </div>

                                                    <br> 
                                                        <br> 
                                                            <br> 
                                                                <br> 
                                                                    <br>   

                                                                        <div class="span-5 last" >
                                                                            <h2 style="font:bold; font-size: 20px" >Description</h2><br>
                                                                                <p style="font-size: 15px" ><%= product.getDescription()%> </p><br>
                                                                                    <p style="font-size: 15px" >By : <%= product.getmFirstName() + " " + product.getmFirstName()%></p><br>
                                                                                        <p style="font-size: 15px" >Price : <%= product.getPrice()%>$</p>

                                                                                        </div><br>
                                                                                            <% if (session.getAttribute("role").equals("customer") && mp.CheckProductHave(product.getId(), (String) session.getAttribute("role"))) {%>
                                                                                            <a href="addtocart.do?pointer=<%= products.indexOf(product)%>" class="myButton">Add to Cart</a>
                                                                                            <% } else {%>

                                                                                            <% }%>
                                                                                            </div>

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
                                                                                            <script src="js/jquery-2.1.1.js"></script> 
                                                                                            <script src="js/main.js"></script> <!-- Resource jQuery -->
                                                                                            </body>
                                                                                            </html>

