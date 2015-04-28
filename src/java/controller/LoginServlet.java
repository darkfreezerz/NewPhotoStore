package controller;

/**
 *
 * @author HenGz
 */

import database.RegLogDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String username = request.getParameter("username");
            String pwd = request.getParameter("password");
            
            RegLogDB logDB = new RegLogDB();
            List<String> log = logDB.checkLogin(username, pwd);
            
            //out.print(log.get(0));
            
            if(log.get(0).equals("admin") || log.get(0).equals("merchant") || log.get(0).equals("customer")){
                HttpSession session = request.getSession();
                session.setAttribute("role", log.get(0));
                session.setAttribute("userid", log.get(1));
                //getServletContext().getRequestDispatcher("Home.jsp").forward(request,response);
                //send to home page
                response.sendRedirect("Home.jsp");
            
            }
            else{
                //getServletContext().getRequestDispatcher("register.html").forward(request,response);
                //send back to login and register page
                HttpSession session = request.getSession();
                session.setAttribute("loginflag", "error");
                response.sendRedirect("RegLog.jsp");
                
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
