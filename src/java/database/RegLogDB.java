/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import bean.User;
import java.io.File;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;
import websetting.DBConnection;

/**
 *
 * @author niponsarikan
 */
public class RegLogDB extends HttpServlet {

    private Connection conn;
    
    //  *** Information Can Change Depend on Computer Mysql Directories ^_^  eiei
    DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();

    public RegLogDB() {
        try {
            Class.forName(db_driver);

            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    /* 
     
     Check to find duplicate user id 
     If duplicate return false
     Otherwise return true
     
     */
    public boolean checkDuplicate(String username) {
        boolean status = false;
        try {
            PreparedStatement admin = conn.prepareStatement("select * from Admin where A_Username = ?;");
            PreparedStatement merchant = conn.prepareStatement("select * from Merchant where M_Username = ?;");
            PreparedStatement customer = conn.prepareStatement("select * from Customer where C_Username = ?;");

            admin.setString(1, username);
            merchant.setString(1, username);
            customer.setString(1, username);
            ResultSet ad = admin.executeQuery();
            ResultSet mer = merchant.executeQuery();
            ResultSet cus = customer.executeQuery();

            status = !(ad.next() || mer.next() || cus.next());

        } catch (SQLException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public void addCustomer(User customer) {
        try {
            PreparedStatement cus = conn.prepareStatement("insert into Customer values(default,?,?,?,?,?,?,'Yes',now(),0)");
            cus.setString(1, customer.getFirstname());
            cus.setString(2, customer.getLastname());
            cus.setString(3, customer.getUsername());
            cus.setString(4, customer.getPassword());
            cus.setString(5, customer.getEmail());
            cus.setString(6, customer.getPhone());
            cus.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addMerchant(User merchant,String path) {
        try {
            PreparedStatement mer = conn.prepareStatement("insert into Merchant values(default,?,?,?,?,?,?,?,?,?,?,?,?,'Yes',now(),0)");
            PreparedStatement max_id = conn.prepareStatement("select max(m_id) from Merchant");
            mer.setString(1, merchant.getFirstname());
            mer.setString(2, merchant.getLastname());
            mer.setString(3, merchant.getUsername());
            mer.setString(4, merchant.getPassword());
            mer.setString(5, merchant.getEmail());
            mer.setString(6, merchant.getPhone());
            mer.setString(7, merchant.getPaypal());
            mer.setString(8, merchant.getAddress());
            mer.setString(9, merchant.getDistinct());
            mer.setString(10, merchant.getProvince());
            mer.setString(11, merchant.getZipcode());
            mer.setString(12, merchant.getCountry());
            mer.executeUpdate();
            ResultSet rs = max_id.executeQuery();
            rs.next();
            String id = rs.getString(1);
            RegLogDB obj = new RegLogDB();
            obj.createFolder(path,id);
            
        } catch (SQLException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /*
    
     Check id&password when login
     if correct return role and id
     Otherwise return none
    
     */
    public List checkLogin(String username, String pass) {
        List<String> status = new LinkedList<String>();
        try {
            PreparedStatement admin = conn.prepareStatement("select * from Admin where A_Username = ? and A_Password =?;");
            PreparedStatement merchant = conn.prepareStatement("select * from Merchant where M_Username = ? and M_password=? and M_Status ='Yes';");
            PreparedStatement customer = conn.prepareStatement("select * from Customer where C_Username = ? and C_Password=? and C_Status ='Yes';");

            admin.setString(1, username);
            merchant.setString(1, username);
            customer.setString(1, username);

            admin.setString(2, pass);
            merchant.setString(2, pass);
            customer.setString(2, pass);

            ResultSet ad = admin.executeQuery();
            ResultSet mer = merchant.executeQuery();
            ResultSet cus = customer.executeQuery();

            if(ad.next()){
                status.add("admin");
                status.add(ad.getString(1));
            }
            else if(mer.next()){
                status.add("merchant");
                status.add(mer.getString(1));
            }
            else if(cus.next()){
                status.add("customer");
                status.add(cus.getString(1));
            }
            else{
                status.add("none");
                status.add("none");
            }

        } catch (SQLException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);

        }
        return status;
    }
    
    public void createFolder(String path,String mID){
        
        
        File file = new File(path+File.separator+"PhotoStore"+File.separator+mID);
        
        File water = new File(path+File.separator+"Watermark"+File.separator+mID);
        
	if (!file.exists()&&!water.exists()) {
		if (file.mkdir()&&water.mkdir()) {
			System.out.println("Directory is created!");
		} else {
			System.out.println("Failed to create directory!");
		}
	}
    }


   /*public static void main(String[] args) {
       RegLogDB a = new RegLogDB();
       User user = new User("H","H","H","H","H","H","H","H","H","H","H","H");
       a.addMerchant(user);
       

   }*/


}
