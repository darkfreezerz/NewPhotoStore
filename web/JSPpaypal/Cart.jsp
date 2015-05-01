<%-- 
    Document   : Cart
    Created on : Mar 11, 2015, 12:37:08 AM
    Author     : niponsarikan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
    if (request.getParameter("submit") != null) {
        HttpSession amount = request.getSession();
        HttpSession paytype = request.getSession();
        paytype.setAttribute("pay", (String)request.getParameter("paywith"));
        amount.setAttribute("Payment_Amount", "5");
        response.sendRedirect("BillingPage.jsp");
    }    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action='Cart.jsp' METHOD='POST'>
            Paypal : <input type="radio" name="paywith" value="Paypal" checked="checked" /> (Recommended)<br>
            
            <input type='image' name='submit' value="click" src='https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif' border='0' align='top' alt='Check out with PayPal'/>
        </form>
    </body>
</html>
