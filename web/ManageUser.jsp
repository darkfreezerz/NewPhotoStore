<%-- 
    Document   : ManageProduct
    Created on : Apr 28, 2015, 6:48:26 PM
    Author     : niponsarikan
--%>

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
                    <li><a href="Home.jsp">Home</a></li>
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
            <br>
            <div class="table-title" align="center" >
                <div style="padding:10px; width:300px;height:50px;background-color:rgba(255,255,255,.3); border-radius:10px;">
                    <h3>Product Data</h3>
                    <br>
                </div>
                <br>
                <br>
            </div>
            <%
                List<User> users = new LinkedList<User>();
                String managerole = (String) session.getAttribute("managerole");
                if (managerole.equals("customer")) {
                    users = (List) session.getAttribute("userdata");
            %>
            <table class="table-fill">
                <thead>
                    <tr>
                        <th class="text-left">First name</th>
                        <th class="text-left">Last name</th>
                        <th class="text-left">Email</th>
                        <th class="text-left">Buy Amount</th>
                        <th class="text-left">Available Status</th>

                        <th class="text-left">Info</th>
                        <th class="text-left">Change Status</th>


                    </tr>
                </thead>
                <tbody class="table-hover">
                    <%for (User user : users) {%>
                    <tr>


                        <td class="text-left"><%=user.getFirstname()%></td>
                        <td class="text-left"><%=user.getLastname()%></td>
                        <td class="text-left"><%=user.getEmail()%></td>
                        <td class="text-left">$<%=user.getBuyamount()%></td>
                        <td class="text-left"><%=user.getStatus()%></td>


                        <td class=""><a href="#" class="myButton" >Get Info</a></td>
                        <td class=""><a href="changeuserstatus.do?managerole=<%=managerole%>&index=<%=users.indexOf(user)%>&status=<%=user.getStatus() %>" class="myButton">Change</a></td>

                    </tr>
                    <%}%>

                </tbody>
            </table>
            <%} else if (managerole.equals("merchant")) {
                users = (List) session.getAttribute("userdata");%>
            <table class="table-fill">
                <thead>
                    <tr>
                        <th class="text-left">First name</th>
                        <th class="text-left">Last name</th>
                        <th class="text-left">Email</th>
                        <th class="text-left">Sale Amount</th>
                        <th class="text-left">Available Status</th>

                        <th class="text-left">Info</th>
                        <th class="text-left">Change Status</th>


                    </tr>
                </thead>
                <tbody class="table-hover">
                    <%for (User user : users) {%>
                    <tr>

                        <td class="text-left"><%=user.getFirstname()%></td>
                        <td class="text-left"><%=user.getLastname()%></td>
                        <td class="text-left"><%=user.getEmail()%></td>
                        <td class="text-left">$<%=user.getSaleamount()%></td>
                        <td class="text-left"><%=user.getStatus()%></td>


                        <td class=""><a href="#" class="myButton" >Get Info</a></td>
                        <td class=""><a href="changeuserstatus.do?managerole=<%=managerole%>&index=<%=users.indexOf(user)%>&status=<%=user.getStatus() %>" class="myButton">Change</a></td>

                    </tr>
                    <%}%>

                </tbody>
            </table>


            <%}%>

            <script src="js/jquery-2.1.1.js"></script> 
            <script src="js/main.js"></script>



    </body>
</html>
