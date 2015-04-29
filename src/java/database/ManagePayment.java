/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import bean.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import websetting.DBConnection;

/**
 *
 * @author niponsarikan
 */
public class ManagePayment {

    public Connection conn;
    DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();

    public ManagePayment() {
        try {

            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // use For Customer 
    public void addPurchase(String cID) {
        try {
            PreparedStatement add = conn.prepareStatement("insert into Purchase_Order values(default,now(),?);");
            add.setInt(1, Integer.parseInt(cID));
            add.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Use For customer
    public void addOrderDescript(List<Product> cart) {
        ManagePayment manage = new ManagePayment();
        try {
            for (Product product : cart ) {
                PreparedStatement add = conn.prepareStatement("insert into Order_Des values('No',?,?);");
                add.setInt(1,Integer.parseInt(product.getId()));
                add.setInt(2, manage.getMaxOID());
                add.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addReciept(double pricesum){
        ManagePayment manage = new ManagePayment();
         try {
            PreparedStatement add = conn.prepareStatement("insert into Reciept values(default,?,?);");
            add.setDouble(1, pricesum);
            add.setInt(2, manage.getMaxOID());
            add.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getMaxOID() {
        int id = 0;
        try {
            PreparedStatement get = conn.prepareStatement("select max(O_ID) from Purchase_Order;");
            ResultSet rs = get.executeQuery();
            rs.next();
            id = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }

        return id;

    }

    //Use For merChant
    public void requestPayment(String mID, double salesum) {
        try {
            ManagePayment manage = new ManagePayment();
            PreparedStatement re = conn.prepareStatement("update product natural join order_des set PaymentStatus = 'Yes' where m_id = ?;");
            re.setInt(1, Integer.parseInt(mID));
            re.executeUpdate();
            manage.setPayment(mID, salesum);

        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //add to M_Payment
    public void setPayment(String mID, double salesum) {
        try {
            PreparedStatement set = conn.prepareStatement("insert into M_Payment values(default,?,'No',now(),?,default)");
            set.setDouble(1, salesum);
            set.setInt(2, Integer.parseInt(mID));
            set.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //use to set when payment is already (Use For admin)
    public void setResponePayment(String Paymentid, String aID) {
        try {
            PreparedStatement set = conn.prepareStatement("update M_Payment set Mpay_Status ='Yes' ,A_ID = ? where MPay_ID = ?;");
            set.setInt(1, Integer.parseInt(aID));
            set.setInt(2, Integer.parseInt(Paymentid));
            set.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ManagePayment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
