<%-- 
    Document   : Landing
    Created on : Apr 28, 2015, 7:52:27 PM
    Author     : niponsarikan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           HttpSession start = request.getSession();
           start.setAttribute("role", "");
           response.sendRedirect("Home.jsp");
        %>
    </body>
</html>
