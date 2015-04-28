/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;


import bean.MerchantPayment;
import bean.ProductSold;
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
public class ShowPaymentData {
    public Connection conn;
   DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();
    
    public ShowPaymentData(){
        try {
            
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // user for merchant
    public List showMerchantSale(String mID){
        List <ProductSold> products = new LinkedList<ProductSold>();
        ShowPaymentData count = new ShowPaymentData();
        try {
            PreparedStatement show = conn.prepareStatement("select * from order_des natural join product "
                    + "where m_ID =? and PaymentStatus = 'No' ;");
            show.setInt(1, Integer.parseInt(mID));
            ResultSet rs = show.executeQuery();
            while(rs.next()){
                ProductSold product = new ProductSold();
                product.setP_id(rs.getInt("P_ID"));
                product.setM_id(rs.getInt("M_ID"));
                product.setP_name(rs.getString("P_Name"));
                product.setP_address(rs.getString("P_Address"));
                product.setP_salecount(count.SaleCount(rs.getString("P_ID")));
                product.setP_price(rs.getDouble("P_Price"));
                product.setPayment_status(rs.getString("PaymentStatus"));
                product.setSale_amount(product.getP_price()*product.getP_salecount());
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowPaymentData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    public int SaleCount(String p_id){
        int salecount = 0;
        try {
            PreparedStatement count = conn.prepareStatement("select count(p_id) from Order_Des where P_ID = ? and PaymentStatus = 'No'");
            count.setInt(1, Integer.parseInt(p_id));
            ResultSet rs = count.executeQuery();
            rs.next();
            salecount = rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(ShowPaymentData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return salecount;
    }
    public double SaleSum(List<ProductSold> products){
        double salesum = 0;
        for(ProductSold product:products){
            salesum += product.getSale_amount();
        }
        return salesum;
    }
    
     public List showAllmerchantPayList(){
         List <MerchantPayment> payments = new LinkedList<MerchantPayment>();
        try {
            PreparedStatement show = conn.prepareStatement("select * from M_payment order by MPay_Status;");
            ResultSet rs = show.executeQuery();
            while(rs.next()){
                MerchantPayment payment = new MerchantPayment();
                payment.setMpayId(rs.getInt("MPay_ID"));
                payment.setMpayStatus(rs.getString("MPay_Status"));
                payment.setMpaycost(rs.getDouble("MPay_Cost"));
                payment.setMpaydate(rs.getString("MPay_Date"));
                payment.setaID(rs.getInt("A_ID"));
                payment.setmID(rs.getInt("M_ID"));
                payment.setMPaypal(rs.getString("M_Paypal"));
                payments.add(payment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowPaymentData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
     }
    public static void main(String[] args){
        ShowPaymentData a = new ShowPaymentData();
        System.out.println(a.SaleCount("7"));
    }
         
}
