/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;


import bean.User;
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
public class ShowUserData {

    private Connection conn;
     DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();
    public ShowUserData() {
        try {

            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    // Return customer data (eg.name lastname) 
    public User showCustomerData(String uID) {
        User user = new User();
        try {
            PreparedStatement data = conn.prepareStatement("select * from Customer where C_ID = ?;");
            data.setString(1, uID);
            ResultSet rs = data.executeQuery();
            rs.next();
            user.setId(rs.getString(1));
            user.setFirstname(rs.getString(2));
            user.setLastname(rs.getString(3));
            user.setUsername(rs.getString(4));
            user.setPassword(rs.getString(5));
            user.setEmail(rs.getString(6));
            user.setPhone(rs.getString(7));
            user.setStatus(rs.getString(8));
            user.setDate(rs.getString(9));
            user.setBuyamount(rs.getString(10));

        } catch (SQLException ex) {
            Logger.getLogger(ShowUserData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    //Return Merchant data
    public User showMerchantData(String uID) {
        User user = new User();
        try {
            PreparedStatement data = conn.prepareStatement("select * from Merchant where M_ID = ?;");
            data.setString(1, uID);
            ResultSet rs = data.executeQuery();
            rs.next();
            user.setId(rs.getString(1));
            user.setFirstname(rs.getString(2));
            user.setLastname(rs.getString(3));
            user.setUsername(rs.getString(4));
            user.setPassword(rs.getString(5));
            user.setEmail(rs.getString(6));
            user.setPhone(rs.getString(7));
            user.setPaypal(rs.getString(8));
            user.setAddress(rs.getString(9));
            user.setDistinct(rs.getString(10));
            user.setProvince(rs.getString(11));
            user.setZipcode(rs.getString(12));
            user.setCountry(rs.getString(13));
            user.setStatus(rs.getString(14));
            user.setDate(rs.getString(15));
            user.setSaleamount(rs.getString(16));

        } catch (SQLException ex) {
            Logger.getLogger(ShowUserData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    // Return Admin data
    public User showAdminData(String uID) {
        User user = new User();
        try {
            PreparedStatement data = conn.prepareStatement("select * from Customer where C_ID = ?;");
            data.setString(1, uID);
            ResultSet rs = data.executeQuery();
            rs.next();
            user.setId(rs.getString(1));
            user.setFirstname(rs.getString(2));
            user.setLastname(rs.getString(3));
            user.setUsername(rs.getString(4));
            user.setPassword(rs.getString(5));

        } catch (SQLException ex) {
            Logger.getLogger(ShowUserData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    // Return All customer data 
    public List showAllCustomer() {

        List<User> users = new LinkedList<User>();
        try {

            PreparedStatement data = conn.prepareStatement("select * from Customer order by C_Status desc;");
            ResultSet rs = data.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getString(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setUsername(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPhone(rs.getString(7));
                user.setStatus(rs.getString(8));
                user.setDate(rs.getString(9));
                user.setBuyamount(rs.getString(10));
                users.add(user);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShowUserData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    
    //Return all Merchant Data
    public List showAllMerchant() {
        List<User> users = new LinkedList<User>();
        try {
            PreparedStatement data = conn.prepareStatement("select * from Merchant order by M_Status desc;");

            ResultSet rs = data.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getString(1));
                user.setFirstname(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setUsername(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setEmail(rs.getString(6));
                user.setPhone(rs.getString(7));
                user.setPaypal(rs.getString(8));
                user.setAddress(rs.getString(9));
                user.setDistinct(rs.getString(10));
                user.setProvince(rs.getString(11));
                user.setZipcode(rs.getString(12));
                user.setCountry(rs.getString(13));
                user.setStatus(rs.getString(14));
                user.setDate(rs.getString(15));
                user.setSaleamount(rs.getString(16));
                users.add(user);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ShowUserData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

}
