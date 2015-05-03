/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import database.ShowUserData;
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
@WebServlet(name = "ShowProfileInfo", urlPatterns = {"/showprofileinfo.do"})
public class ShowProfileInfo extends HttpServlet {

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
           HttpSession session = request.getSession();
           String role = (String) session.getAttribute("role");
           String userid = (String) session.getAttribute("userid");
           ShowUserData show = new ShowUserData();
           User user = new User();
             List<User> users = new LinkedList<User>();
           if(role.equals("merchant")){
               user = show.showMerchantData(userid);
               session.setAttribute("profiledata", user);
                response.sendRedirect("ShowProfileinfo.jsp");
           }
           else if(role.equals("admin")){
               String id = (String) request.getParameter("index");
               String userrole = (String) session.getAttribute("managerole");
               if(userrole.equals("merchant")){
                   user = show.showMerchantData(id);
                   session.setAttribute("profiledata", user);
               }
               else{
                   user = show.showCustomerData(id);
                   session.setAttribute("profiledata", user);
               }
              
                response.sendRedirect("Showprofileforad.jsp");
           }
           else{
               user = show.showCustomerData(userid);
               session.setAttribute("profiledata", user);
                response.sendRedirect("ShowProfileinfo.jsp");
           }
          
        }
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
