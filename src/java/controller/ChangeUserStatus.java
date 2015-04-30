/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import database.ManageUser;
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
@WebServlet(name = "ChangeUserStatus", urlPatterns = {"/changeuserstatus.do"})
public class ChangeUserStatus extends HttpServlet {

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
            ManageUser manage = new ManageUser();
            String managerole = request.getParameter("managerole");
            String index = request.getParameter("index");
            String status = request.getParameter("status");
            User user = new User();
            HttpSession session = request.getSession();
            List<User> users = new LinkedList<User>();
            users = (List<User>) session.getAttribute("userdata");
            user = users.get(Integer.parseInt(index));
            
            
            if(managerole.equals("customer")){
                if(status.equals("Yes")){
                   manage.removeCustomer(user.getId());
                }
                else{
                    
                    manage.enCustomer(user.getId());
                }
            }
            else{
                if(status.equals("Yes")){
                    manage.removeMerchant(user.getId());
                }
                else{
                    manage.enMerchant(user.getId());
                }
            }
            response.sendRedirect("showuserdata.do?userrole="+managerole);
            
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
