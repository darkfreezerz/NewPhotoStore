<%-- 
    Document   : ShowProductInfo
    Created on : May 1, 2015, 7:19:40 PM
    Author     : niponsarikan
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
                        String role = (String) session.getAttribute("role");
                        if (role.equals("customer")) {
                            products = (List) session.getAttribute("searchcustomer");
                        } else if (role.equals("merchant")) {
                            products = (List) session.getAttribute("searchmerchant");
                        }
                        else if(role.equals("admin")){
                            products = (List) session.getAttribute("searchadmin");
                        }
                        Product product = products.get(Integer.parseInt(index));

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
                                                        <div class="tab" id="tab1" > <a href="#"><img src="PhotoStore<%=File.separator + product.getmID() + File.separator + product.getId() + ".jpg"%>" style="max-width: 800px;max-height: 800px" /></a></div>
                                                        <div><br>
                                                                <h1 style="font:bold; font-size: 35px" > <%= product.getName()%> </h1>
                                                        </div>

                                                    </div>

                                                    <br> 
                                                        <br> 
                                                            <br> 
                                                                <br> 
                                                                    <br>   

                                                                        <div class="span-5 last" align="left" style="margin-left: 300px">
                                                                          
                                                                                 <p style="font-size: 24px" >Description <%= product.getDescription()%> </p><br>
                                                                                <p style="font-size: 24px" >Category: <%=product.getCateName()%></p><br>
                                                                                   
                                                                                        <p style="font-size: 24px" >Release Date : <%= product.getDate()%></p><br>
                                                                                            <p style="font-size: 24px" >By : <%= product.getmFirstName() + " " + product.getmLastName()%></p><br>
                                                                                                <p style="font-size: 24px" >Price : $<%= product.getPrice()%></p>

                                                                                                <%
                                                                                                    if (role.equals("merchant") || role.equals("admin")) {%>
                                                                                                <p style="font-size: 24px" >Sale Count : <%= product.getSalecount()%></p><br>
                                                                                                    <p style="font-size: 24px" >SaleAmount : $<%= product.getSaleAmount()%></p><br>

                                                                                                        <%}

                                                                                                        %>


                                                                                                        </div><br>
                                                                                                            <% if (session.getAttribute("role").equals("customer")) {%>
                                                                                                            <a href="downloadservlet.do?Pindex=<%= product.getId() %>&Uindex=<%=product.getmID() %>" class="myButton">Download</a>
                                                                                                            <% } else {%>
                                                                                                            <a href="downloadservlet.do?Pindex=<%= product.getId() %>&Uindex=<%=product.getmID() %>" class="myButton">Download</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                            <a href="removephoto.do?index=<%=product.getId() %>&status=<%=product.getStatus() %>" class="myButton">Delete</a>
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
                                                                                                            <br><br><br>
                                                                                                            <script src="js/jquery-2.1.1.js"></script> 
                                                                                                            <script src="js/main.js"></script> <!-- Resource jQuery -->
                                                                                                            </body>
                                                                                                            </html>

