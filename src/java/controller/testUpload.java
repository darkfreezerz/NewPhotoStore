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
@WebServlet(name = "java", urlPatterns = {"/testupload.do"})
public class testUpload extends HttpServlet {
//File savedFile = new File(getServletContext().getRealPath("/upload/"), fullFile.getName());
    // private final String UPLOAD_DIRECTORY = "/Users/niponsarikan/NetBeansProjects/UpDown/Up";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        WatermarkImage addMark = new WatermarkImage();
        
        String uid = "1";
        
        String appPath = request.getServletContext().getRealPath("");
        appPath = appPath.replace(File.separator + "build" + File.separator + "web", "");
        
        
        String savePath = appPath + File.separator + "web" + File.separator + "PhotoStore" ;
        String savePathWaterMark = appPath + File.separator + "web" + File.separator + "Watermark" ;

        //process only if its multipart content
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                PrintWriter out = response.getWriter();
                out.print(savePath+ " " + savePathWaterMark + " " + appPath);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        item.write(new File(savePath + File.separator + "1.jpg" ));

                    }
                }
                
                File sourceImageFile = new File(savePath + File.separator + "1.jpg");
                File watermarkImageFile = new File(appPath + File.separator + "web" + File.separator + "water1600.png");
                File destImageFile = new File(savePathWaterMark + File.separator + "1" + "_wm.jpg");
                File resizeImageWatermark = new File(savePathWaterMark + File.separator +  "re" + "1" + ".jpg");
                
                addMark.addImageWatermark(watermarkImageFile, sourceImageFile, destImageFile, resizeImageWatermark);

                //File uploaded successfully
                request.setAttribute("message", "File Uploaded Successfully");
            } catch (Exception ex) {
                request.setAttribute("message", "File Upload Failed due to " + ex);
            }

        } else {
            request.setAttribute("message",
                    "Sorry this Servlet only handles file upload request");
        }

       // request.getRequestDispatcher("/ResultPage.jsp").forward(request, response);

    }

}
