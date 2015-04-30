<%-- 
    Document   : test
    Created on : Apr 30, 2015, 12:01:53 AM
    Author     : HenGzTy
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="bean.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  List<Product> cart = new LinkedList<Product>();

    cart = (List) session.getAttribute("cart");
    
    out.print(cart);

%>
