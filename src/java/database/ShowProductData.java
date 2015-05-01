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
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import websetting.DBConnection;

/**
 *
 * @author niponsarikan
 */
public class ShowProductData {
    
    public Connection conn;
     DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();
    
    
    public ShowProductData(){
        try {
            
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //Return all Product data (Use For admin)
    public List ShowAllProduct(){
        List <Product> products = new LinkedList<Product>();
        try {
            String sql = "select *,P_Price*P_SaleCount \"SaleAmount\" "
                    + "from Category "
                    + "natural join Product "
                    + "natural join Merchant where P_Status in('Yes','No');";
            PreparedStatement data = conn.prepareStatement(sql);
            ResultSet rs = data.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setmID(rs.getString(1));
                product.setCateID(rs.getString(2));
                product.setCateName(rs.getString(3));
                product.setId(rs.getString(5));
                product.setName(rs.getString(6));
                product.setPrice(rs.getDouble(7));
                product.setDate(rs.getString(8));
                product.setDescription(rs.getString(9));
                product.setAddress(rs.getString(10));
                product.setStatus(rs.getString(11));
                product.setSalecount(rs.getInt(12));
                product.setWatermark(rs.getString(13));
                product.setmFirstName(rs.getString(14));
                product.setmLastName(rs.getString(15));
                product.setSaleAmount(rs.getDouble(29));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    
    //Return all Product (Use for merchant)
    public List ShowAllMerchantProduct(String mID){
        List <Product> products = new LinkedList<Product>();
        try {
            String sql = "select *,P_Price*P_SaleCount \"SaleAmount\" "
                    + "from Category "
                    + "natural join Product "
                    + "natural join Merchant where M_ID = ? and P_Status = 'Yes';";
            PreparedStatement data = conn.prepareStatement(sql);
            data.setString(1,mID);
            ResultSet rs = data.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setmID(rs.getString(1));
                product.setCateID(rs.getString(2));
                product.setCateName(rs.getString(3));
                product.setId(rs.getString(5));
                product.setName(rs.getString(6));
                product.setPrice(rs.getDouble(7));
                product.setDate(rs.getString(8));
                product.setDescription(rs.getString(9));
                product.setAddress(rs.getString(10));
                product.setStatus(rs.getString(11));
                product.setSalecount(rs.getInt(12));
                product.setWatermark(rs.getString(13));
                product.setmFirstName(rs.getString(14));
                product.setmLastName(rs.getString(15));
                product.setSaleAmount(rs.getDouble(29));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    // Return All Customer Product use For Download (For Customer)
    public List ShowAllCustomerProduct(String cID){
        List <Product> products = new LinkedList<Product>();
        try {
            String sql =    "select * " +
                            " from Product" +
                            " natural join Order_Des" +
                            " natural join Purchase_Order " +
                            " natural join Category natural join Merchant" +
                            " where Customer_C_ID = ?;";
            PreparedStatement data = conn.prepareStatement(sql);
            data.setString(1,cID);
            ResultSet rs = data.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setmID(rs.getString(1));
                product.setCateID(rs.getString(2));
                product.setCateName(rs.getString(16));
                
                product.setId(rs.getString(4));
                product.setName(rs.getString(5));
                product.setPrice(rs.getDouble(6));
                product.setDate(rs.getString(7));
                product.setDescription(rs.getString(8));
                product.setAddress(rs.getString(9));
                product.setStatus(rs.getString(10));
                product.setSalecount(rs.getInt(11));
                product.setWatermark(rs.getString(12));
                product.setmFirstName(rs.getString(18));
                product.setmLastName(rs.getString(19));
                
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    //Return all Product data that use for delete or enable (Use For admin)
    public List ShowEnDelProduct(){
        List <Product> products = new LinkedList<Product>();
        try {
            String sql = "select *,P_Price*P_SaleCount \"SaleAmount\" "
                    + " from Category "
                    + " natural join Product "
                    + " natural join Merchant where P_Status = 'Not';";
            PreparedStatement data = conn.prepareStatement(sql);
            ResultSet rs = data.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setmID(rs.getString(1));
                product.setCateID(rs.getString(2));
                product.setCateName(rs.getString(3));
                product.setId(rs.getString(5));
                product.setName(rs.getString(6));
                product.setPrice(rs.getDouble(7));
                product.setDate(rs.getString(8));
                product.setDescription(rs.getString(9));
                product.setAddress(rs.getString(10));
                product.setStatus(rs.getString(11));
                product.setSalecount(rs.getInt(12));
                product.setWatermark(rs.getString(13));
                product.setmFirstName(rs.getString(14));
                product.setmLastName(rs.getString(15));
                product.setSaleAmount(rs.getDouble(29));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
     //Return all Product data that use for disable (Use For admin)
    public List ShowAdDisProduct(){
        List <Product> products = new LinkedList<Product>();
        try {
            String sql = "select *,P_Price*P_SaleCount \"SaleAmount\" "
                    + " from Category "
                    + " natural join Product "
                    + " natural join Merchant where P_Status = 'Yes';";
            PreparedStatement data = conn.prepareStatement(sql);
            ResultSet rs = data.executeQuery();
            while(rs.next()){
                Product product = new Product();
                product.setmID(rs.getString(1));
                product.setCateID(rs.getString(2));
                product.setCateName(rs.getString(3));
                product.setId(rs.getString(5));
                product.setName(rs.getString(6));
                product.setPrice(rs.getDouble(7));
                product.setDate(rs.getString(8));
                product.setDescription(rs.getString(9));
                product.setAddress(rs.getString(10));
                product.setStatus(rs.getString(11));
                product.setSalecount(rs.getInt(12));
                product.setWatermark(rs.getString(13));
                product.setmFirstName(rs.getString(14));
                product.setmLastName(rs.getString(15));
                product.setSaleAmount(rs.getDouble(29));
                products.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return products;
    }
    
    // Show sum of sale amount (Use for Admin)
    public double ShowSumSaleAmount(){
        double saleamount = 0;
        try {
            PreparedStatement sum = conn.prepareStatement("select sum(r_cost) from Reciept;");
            ResultSet  rs =  sum.executeQuery();
            rs.next();
            saleamount = rs.getDouble(1);
        } catch (SQLException ex) {
            Logger.getLogger(ShowProductData.class.getName()).log(Level.SEVERE, null, ex);
        }
        return saleamount;
    }
    
    public static void main(String[] args) {
        ShowProductData a = new ShowProductData();
        System.out.println(a.ShowSumSaleAmount());
    }
    
    
    
    
    
    
    
}
