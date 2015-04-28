package controller;

/**
 *
 * @author HenGz
 */

import bean.User;
import database.RegLogDB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "checkServlet", urlPatterns = {"/check.do"})
public class CheckServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           

            // gets absolute path of the web application
            String appPath = request.getServletContext().getRealPath("");
            appPath = appPath.replace(File.separator + "build" + File.separator + "web", "");

            // all for insert into database
            String id = request.getParameter("id");
            String pwd = request.getParameter("pwd");
            String name = request.getParameter("name");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String tel = request.getParameter("tel");
            String address = request.getParameter("address");
            String distinct = request.getParameter("distinct");
            String province = request.getParameter("province");
            String zipcode = request.getParameter("zipcode");
            String country = request.getParameter("country");
            String ppid = request.getParameter("ppid");
            String check = request.getParameter("role");
            
             out.print("KUY");

            Boolean s = !(address.equals("")) && !(distinct.equals("")) && !(province.equals("")) && !(zipcode.equals("")) && !(country.equals("")) && !(ppid.equals(""));

            User registcus = new User(id, pwd, name, lname, email, tel);
            User registmer = new User(id, pwd, name, lname, email, tel, address, distinct, province, zipcode, country, ppid);
            RegLogDB Re = new RegLogDB();
            

            if (check == null) {
                //Register for customer
                Re.addCustomer(registcus);
                response.sendRedirect("RegLog.jsp");
            } else if (check.equals("photographer") && s) {
                //Register for photographer
                Re.addMerchant(registmer, appPath);
                response.sendRedirect("RegLog.jsp");
            } else {
                //Insert data not for photographer but check photographer
                //getServletContext().getRequestDispatcher("/register.html").forward(request,response);
                response.sendRedirect("RegLog.jsp#toregister");
            }

        }
    }

    /*public static void main(String[] args) {
     RegLogDB a = new RegLogDB();
     User user = new User("H","H","H","H","H@hot","123","H","H","H","H","H","H");
     a.addMerchant(user);
       

     }*/
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
