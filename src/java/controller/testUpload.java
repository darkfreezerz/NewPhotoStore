package controller;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import tool.WatermarkImage;

/**
 *
 * @author niponsarikan
 */
@WebServlet(name = "java", urlPatterns = {"/test.do"})
public class testUpload extends HttpServlet {
//File savedFile = new File(getServletContext().getRealPath("/upload/"), fullFile.getName());
    // private final String UPLOAD_DIRECTORY = "/Users/niponsarikan/NetBeansProjects/UpDown/Up";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     try(PrintWriter out = response.getWriter()){
         String name = request.getParameter("name");
         out.print(name);
     }
  

       // request.getRequestDispatcher("/ResultPage.jsp").forward(request, response);

    }

}
