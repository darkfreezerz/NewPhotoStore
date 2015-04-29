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

/**
 *
 * @author Koshiz
 */
public class SearchEngine {

    private Connection conn;

    //  *** Information Can Change Depend on Computer Mysql Directories ^_^  eiei
    private String db_driver = "com.mysql.jdbc.Driver";
    private String db_url = "jdbc:mysql://localhost:3306/Photo?zeroDateTimeBehavior=convertToNull";
    private String db_user = "root";
    private String db_pass = "root";

    public SearchEngine() {
        try {

            Class.forName(db_driver);

            conn = DriverManager.getConnection(db_url, db_user, db_pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegLogDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List SearchAll() {
        List<Product> products = new LinkedList<Product>();
        try {

            String sql = "SELECT * FROM product "
                    + "NATURAL JOIN category "
                    + "NATURAL JOIN merchant "
                    + "WHERE P_Status = 'Yes' ";
            PreparedStatement search = conn.prepareStatement(sql);
            ResultSet rs = search.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("P_ID"));
                product.setAddress(rs.getString("P_Address"));
                product.setCateID(rs.getString("Cate_ID"));
                product.setCateName(rs.getString("Cate_Name"));
                product.setDate(rs.getString("P_Date"));
                product.setDescription(rs.getString("P_Des"));
                product.setName(rs.getString("P_Name"));
                product.setPrice(rs.getDouble("P_Price"));
                product.setStatus(rs.getString("P_Status"));
                product.setWatermark(rs.getString("P_WatermarkUrl"));
                product.setmFirstName(rs.getString("M_Name"));
                product.setmID(rs.getString("M_ID"));
                product.setmLastName(rs.getString("M_LastName"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(SearchEngine.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public List SearchKeyword(String keyword) {
        List<Product> products = new LinkedList<Product>();
        try {

            String sql = "SELECT * FROM product NATURAL JOIN category NATURAL JOIN merchant WHERE (P_Name LIKE '%"+keyword+"%' or P_Des LIKE '%"+keyword+"%' or Cate_Name LIKE '%"+keyword+"%' or Cate_Des LIKE '%"+keyword+"%' or M_Name LIKE '%"+keyword+"%' or M_LastName LIKE '%"+keyword+"%') and P_Status = 'Yes' ";
            PreparedStatement search = conn.prepareStatement(sql);
            ResultSet rs = search.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("P_ID"));
                product.setAddress(rs.getString("P_Address"));
                product.setCateID(rs.getString("Cate_ID"));
                product.setCateName(rs.getString("Cate_Name"));
                product.setDate(rs.getString("P_Date"));
                product.setDescription(rs.getString("P_Des"));
                product.setName(rs.getString("P_Name"));
                product.setPrice(rs.getDouble("P_Price"));
                product.setStatus(rs.getString("P_Status"));
                product.setWatermark(rs.getString("P_WatermarkUrl"));
                product.setmFirstName(rs.getString("M_Name"));
                product.setmID(rs.getString("M_ID"));
                product.setmLastName(rs.getString("M_LastName"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(SearchEngine.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    public List SearchCategory(String cateid) {
        List<Product> products = new LinkedList<Product>();
        try {

            String sql = "SELECT * FROM product NATURAL JOIN category NATURAL JOIN merchant WHERE (Cate_ID = "+cateid+") and P_Status = 'Yes' ";
            PreparedStatement search = conn.prepareStatement(sql);
            ResultSet rs = search.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getString("P_ID"));
                product.setAddress(rs.getString("P_Address"));
                product.setCateID(rs.getString("Cate_ID"));
                product.setCateName(rs.getString("Cate_Name"));
                product.setDate(rs.getString("P_Date"));
                product.setDescription(rs.getString("P_Des"));
                product.setName(rs.getString("P_Name"));
                product.setPrice(rs.getDouble("P_Price"));
                product.setStatus(rs.getString("P_Status"));
                product.setWatermark(rs.getString("P_WatermarkUrl"));
                product.setmFirstName(rs.getString("M_Name"));
                product.setmID(rs.getString("M_ID"));
                product.setmLastName(rs.getString("M_LastName"));
                products.add(product);

            }

        } catch (SQLException ex) {
            Logger.getLogger(SearchEngine.class.getName()).log(Level.SEVERE, null, ex);
        }

        return products;
    }

    /*public static void main(String[] args) {
        SearchEngine x = new SearchEngine();
        List<Product> xx = x.SearchKeyword("a");
        System.out.println(xx.get(0).getName());
    }*/
}
