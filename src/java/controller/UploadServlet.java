/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import bean.Product;
import database.ManageProduct;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/*import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;*/
import tool.WatermarkImage;

/**
 *
 * @author HenGz
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/upload.do"})
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //private final String UPLOAD_DIRECTORY = "/Users/niponsarikan/Desktop/File";
    private final String UPLOAD_DIRECTORY = "PhotoStore";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("userid");
        

        // gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
       
        // constructs path of the directory to save uploaded file
        String savePath = appPath +File.separator + UPLOAD_DIRECTORY + File.separator + uid;
        String savePathWaterMark = appPath + File.separator + "Watermark" + File.separator + uid;

        //process only if its multipart content
        
        WatermarkImage addMark = new WatermarkImage();
        
        ManageProduct ManagePro = new ManageProduct();
        Product pd = new Product();

        

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                //out.print(multiparts);
                for (FileItem item : multiparts) {
                   /* if (!item.isFormField()) {
                     String name = new File(item.getName()).getName();
                     item.write(new File(savePath + File.separator + uid + ));
                         
                        
                     } else{
                     String fieldName = item.getFieldName();
                     String fieldValue = item.getString();
                     out.println(fieldName +" "+ fieldValue);
                     if(fieldName.equals("namepic")){
                            
                     }
                     }*/
                    if (item.isFormField()) {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("namepic")) {
                            pd.setName(fieldValue);
                        } else if (fieldName.equals("pricepic")) {
                            pd.setPrice(Double.parseDouble(fieldValue));
                        } else if (fieldName.equals("description")) {
                            pd.setDescription(fieldValue);
                        } else if (fieldName.equals("catalog")) {
                            pd.setCateID(fieldValue);
                        }
                    } else {
                        continue;
                    }
                    pd.setmID(uid);
                }
                ManagePro.addProduct(pd, appPath);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        //String name = new File(item.getName()).getName();
                        String photo_id_main = String.valueOf(ManagePro.maxID());
                        item.write(new File(savePath + File.separator + photo_id_main + ".jpg"));

                    }
                }
                
                String photo_id = String.valueOf(ManagePro.maxID());

                //out.print(photo_id + " " + savePath + " " + savePathWaterMark);

                //File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");

                File sourceImageFile = new File(savePath + File.separator + photo_id  + ".jpg");
                File watermarkImageFile = new File(appPath +  File.separator + "water1600.png");
                File destImageFile = new File(savePathWaterMark + File.separator + photo_id + "_wm.jpg");
                File resizeImageWatermark = new File(savePathWaterMark + File.separator +  "re" + photo_id + ".jpg");
                
                addMark.addImageWatermark(watermarkImageFile, sourceImageFile, destImageFile, resizeImageWatermark);
                
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }
        } else {
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");

        }
        response.sendRedirect("Upload.jsp");

        // request.getRequestDispatcher("/ResultPage.jsp").forward(request, response);
    }

}
//test
