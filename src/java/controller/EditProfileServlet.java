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
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/editprofileservlet.do"})
public class EditProfileServlet extends HttpServlet {

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
           User user = new User();
           ManageUser edit = new ManageUser();
           String role = (String) session.getAttribute("role");
           String userid = (String) session.getAttribute("userid");
           String Name = request.getParameter("firstname"); 
           String LastName = request.getParameter("lastname");
           String Email = request.getParameter("email");
           String Tel = request.getParameter("tel");
           String Paypal = request.getParameter("paypal");
           String Address = request.getParameter("address");
           String Distinct = request.getParameter("distinct"); 
           String Province = request.getParameter("province");
           String Zipcode = request.getParameter("zipcode"); 
           String Country = request.getParameter("country");
           
           if(role.equals("merchant")){
             edit.editmer(userid, Name, LastName, Email, Tel, Paypal, Address, Distinct, Province, Zipcode, Country);
           }
           else{
               edit.editcus(userid, Name, LastName,  Email, Tel);
           }
           response.sendRedirect("showprofileinfo.do");
           
           
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
