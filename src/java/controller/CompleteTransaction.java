/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Product;
import database.Cart;
import database.ManagePayment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author niponsarikan
 */
@WebServlet(name = "CompleteTransaction", urlPatterns = {"/complete.do"})
public class CompleteTransaction extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             
           Cart cart = new Cart();
           HttpSession session = request.getSession();
         
        
           cart = (Cart) session.getAttribute("cart");
           List<Product> products = new LinkedList<Product>();
           products = cart.getCart();
           
          ManagePayment manage = new ManagePayment();
          manage.addPurchase((String) session.getAttribute("userid"));
          manage.addOrderDescript(products);
          manage.addReciept( Double.parseDouble((String) session.getAttribute("amount")));
          manage.addSalecount(products);
          manage.addBuyamount(Double.parseDouble((String) session.getAttribute("amount")), (String) session.getAttribute("userid"));
         session.setAttribute("cart", "");
         session.setAttribute("cartflag", 0);
          
         response.sendRedirect("Home.jsp");
            
        }
    }
    
    public static  void main (String[] args){
        ManagePayment manage = new ManagePayment();
        manage.addReciept(300);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
