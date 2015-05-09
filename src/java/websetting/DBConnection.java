/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package websetting;

/**
 *
 * @author niponsarikan
 */
public class DBConnection {
    
    private String db_driver = "com.mysql.jdbc.Driver";
    private String db_url = "jdbc:mysql://database.it.kmitl.ac.th:3306/it_56070078?zeroDateTimeBehavior=convertToNull";
    private String db_user = "it_56070078";
    private String db_pass = "yK4uxP6hOw";

    public String getDb_driver() {
        return db_driver;
    }

    public void setDb_driver(String db_driver) {
        this.db_driver = db_driver;
    }

    public String getDb_url() {
        return db_url;
    }

    public void setDb_url(String db_url) {
        this.db_url = db_url;
    }

    public String getDb_user() {
        return db_user;
    }

    public void setDb_user(String db_user) {
        this.db_user = db_user;
    }

    public String getDb_pass() {
        return db_pass;
    }

    public void setDb_pass(String db_pass) {
        this.db_pass = db_pass;
    }
    
}
