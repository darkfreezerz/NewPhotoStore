/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import websetting.DBConnection;

/**
 *
 * @author niponsarikan
 */
public class ManageUser {

    private Connection conn;

    //  *** Information Can Change Depend on Computer Mysql Directories ^_^  eiei
    DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();

    public ManageUser() {
        try {
            Class.forName(db_driver);

            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    //Enable Customer
    public void enCustomer(String cID) {
        try {
            PreparedStatement en = conn.prepareStatement("update Customer set c_status ='Yes' where c_id =?");
            en.setInt(1, Integer.parseInt(cID));
            en.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Enable Mechant
    public void enMerchant(String mID) {
        try {
            PreparedStatement en = conn.prepareStatement("update Merchant set m_status ='Yes' where m_id =?;");
            en.setInt(1, Integer.parseInt(mID));
            en.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Remove Customer (Set to unavailable)
    public void removeCustomer(String cID) {
        try {
            PreparedStatement del = conn.prepareStatement("update Customer set c_status ='No' where c_id =?");
            del.setInt(1, Integer.parseInt(cID));
            del.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Remove Merchant (Set to unavailable)
    public void removeMerchant(String mID) {
        try {
            PreparedStatement del = conn.prepareStatement("update Merchant set m_status ='No' where m_id =?");
            del.setInt(1, Integer.parseInt(mID));
            del.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ManageProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editcus(String C_ID, String C_Name, String C_LastName,  String C_Email, String C_Tel) {
        try {
            PreparedStatement edit = conn.prepareStatement("update Customer set c_name='" + C_Name + "',c_lastname='" 
                    + C_LastName 
                     + "',c_email='"
                    + C_Email + "',c_tel='"
                    + C_Tel + "'"
                    + "Where c_id="
                    + C_ID );
            edit.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void editmer(String M_ID, String M_Name, String M_LastName, String M_Email, String M_Tel, String M_Paypal, String M_Address, String M_Distinct, String M_Province, String M_Zipcode, String M_Country) {

        try {
            PreparedStatement edit = conn.prepareStatement("update Merchant set m_name='" + M_Name + "',m_lastname='"
                    + M_LastName + "',m_Email='"
                    + M_Email + "',m_tel='"
                    + M_Tel + "',m_paypal='"
                    + M_Paypal + "',m_address='"
                    + M_Address + "',m_district='"
                    + M_Distinct + "',m_province='"
                    + M_Province + "',m_zipcode='"
                    + M_Zipcode + "',m_country='"
                    + M_Country + "'"
                    + " Where m_id="
                    + M_ID );
            edit.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManageUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   /* public static void main(String[] args) {
        ManageUser m = new ManageUser();
        m.editcus("11", "test" , "test", "test", "qwerty", "test");
    }*/

    

}
