/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;


import bean.Product;
import bean.User;
import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import websetting.DBConnection;

/**
 *
 * @author niponsarikan
 */
public class ManageProduct {

    private Connection conn;
   

    //  *** Information Can Change Depend on Computer Mysql Directories ^_^  eiei
    DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();

    public ManageProduct() {
        try {
            
            Class.forName(db_driver);

            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public void addProduct(Product photo,String path) {
        try {
            PreparedStatement pro = conn.prepareStatement("insert into product values(default,?,?,now(),?,default,'Not',?,?,0,default)");
            PreparedStatement pID = conn.prepareStatement("select max(p_id) from product");
            PreparedStatement add = conn.prepareStatement("update product set p_address =?,p_watermarkurl=? where p_id =?");
            pro.setString(1, photo.getName());
            pro.setDouble(2, photo.getPrice());
            pro.setString(3, photo.getDescription());
            pro.setInt(4, Integer.parseInt(photo.getCateID()));
            pro.setInt(5, Integer.parseInt(photo.getmID()));
            pro.executeUpdate();
            ResultSet rs = pID.executeQuery();
            rs.next();
            String url = rs.getString(1);
            //add.setString(1, "./PhotoStore/" + photo.getmID() + "/" + url + ".jpg");
            //add.setString(2, "./Watermark/" + photo.getmID() + "water/" + url + ".jpg");
            add.setString(1 ,url + ".jpg");
            add.setString(2,url + "_wm.jpg");
            add.setInt(3, Integer.parseInt(url));
            add.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Remove Product (Set to unavailable)
    public void removeProduct(String pID) {
        try {
            PreparedStatement del = conn.prepareStatement("update product set p_status ='No' where p_id =?");
            del.setInt(1, Integer.parseInt(pID));
            del.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Set Product to available in store
    public void enProduct(String pID) {
        try {
            PreparedStatement del = conn.prepareStatement("update product set p_status ='Yes' where p_id =?");
            del.setInt(1, Integer.parseInt(pID));
            del.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Delete photo from Database
    public void delProductData(String pID,String path) {
        try {
            PreparedStatement url = conn.prepareStatement("select p_address,p_watermarkurl,m_id from product where p_id =?");
            PreparedStatement del = conn.prepareStatement("delete from product where p_id=?");
            ManageProduct manage = new ManageProduct();
            url.setInt(1, Integer.parseInt(pID));
            ResultSet rs = url.executeQuery();
            rs.next();
            String address = rs.getString(1);
            String watermark = rs.getString(2);
            String folder = rs.getString(3);
            del.setInt(1, Integer.parseInt(pID));
            del.executeUpdate();
            manage.delPhoto(path+File.separator+"PhotoStore"+File.separator+folder+File.separator+address);
            manage.delPhoto(path+File.separator+"Watermark"+File.separator+folder+File.separator+watermark);
            manage.delPhoto(path+File.separator+"Watermark"+File.separator+folder+File.separator+"re"+address);

        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Use to delete Photo in folder
    public void delPhoto(String url) {
        try {
            File file = new File(url);

            if (file.delete()) {
                System.out.println(file.getName() + " is deleted!");
            } else {
                System.out.println("Delete operation is failed.");
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
        
        
    }
    
   public int maxID(){
       int value = 0;
        try {
            PreparedStatement max = conn.prepareStatement("select max(P_ID) from product ;");
            ResultSet rs = max.executeQuery();
            rs.next();
            value = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return value;
   }
    
    
   

    


    public static void main(String[] args) {
        
        //String UPLOAD_DIRECTORY = "/Users/niponsarikan/Desktop/File";
        //ManageProduct a = new ManageProduct();
        List <User> a = new LinkedList<User>();
        
       
        for(int i=0;i<5;i++){
            User b = new User();
            b.setId(Integer.toString(i));
            a.add(b);
        }
        
       
            
            
        
        
        
        //System.out.print(System.getProperty("path.separator"));
         //java.util.Date dt = new java.util.Date();
        //java.text.SimpleDateFormat sdf= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //String currentTime = sdf.format(dt);
    }

}
