/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;


import bean.Product;
import database.RegLogDB;
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
 * @author Koshiz
 */
public class Cart {

    private Connection conn;

    //  *** Information Can Change Depend on Computer Mysql Directories ^_^  eiei
    DBConnection db = new DBConnection();
    private String db_driver = db.getDb_driver();
    private String db_url = db.getDb_url();
    private String db_user = db.getDb_user();
    private String db_pass = db.getDb_pass();
    List<Product> cart;

    public Cart() {
        try {
            this.cart = new LinkedList<Product>();
            Class.forName(db_driver);
            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Product> getCart() {
        return cart;
    }

    public void setCart(List<Product> cart) {
        this.cart = cart;
    }

    public void addItem(String pid) {

        try {
            String sql = "select * from Product natural join Merchant where P_ID = '" + pid + "'";
            PreparedStatement add = conn.prepareStatement(sql);
            ResultSet rs = add.executeQuery();
            int check = 0;
            for (Product c : cart) {
                if (pid.equals(c.getId())) {
                    check = 1;
                    break;
                }
            }
            if (check == 0) {
                while (rs.next()) {
                    Product product = new Product();
                    product.setId(pid);
                    product.setmID(rs.getString("M_ID"));
                    product.setAddress(rs.getString("P_Address"));
                    product.setDate(rs.getString("P_Date"));
                    product.setDescription(rs.getString("P_Des"));
                    product.setName(rs.getString("P_Name"));
                    product.setPrice(rs.getDouble("P_Price"));
                    product.setStatus(rs.getString("P_Status"));
                    product.setWatermark(rs.getString("P_WatermarkUrl"));
                    cart.add(product);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }
    
    
        
        
        
      

    public double PriceSum(List<Product> cart) {
        double sum = 0;
        for (Product c : cart) {
            sum += c.getPrice();
        }
        return sum;

    }

    public void removeItem(String pid) {
        for (Product c : cart) {
            if (pid.equals(c.getId())) {
                cart.remove(c);
            }
        }
    }

    /*public static void main(String[] args) {
     Cart x = new Cart();
     x.addItem("7");
     x.addItem("9");
     x.removeItem("7");
     System.out.println(x.PriceSum(x.getCart()));
        
     }*/
    
    /*public static void main(String[] args){
        
        Cart cart = new Cart();
        System.out.print(cart.CheckProductHave("7", "0"));
        
        
    }*/
}
