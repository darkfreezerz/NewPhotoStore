/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author niponsarikan
 */
public class Product {

    private String id;
    private String name;
    private double price;
    private String date;
    private String description;
    private String address;
    private String status;
    private String cateID;
    private String mID;
    private int salecount;
    private String watermark;

   

  

   
    
    //Use for Show
    private String cateName;
    private String mFirstName;
    private String mLastName;
    private double SaleAmount;

    

    public Product() {

    }

    //For Adding Product
    public Product(String name, double price, String des,String cateID,String mID) {
        this.name = name;
        this.price = price;
        this.description = des; 
        this.cateID = cateID;
        this.mID = mID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCateID() {
        return cateID;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public String getmID() {
        return mID;
    }

    public void setmID(String mID) {
        this.mID = mID;
    }

    public int getSalecount() {
        return salecount;
    }

    public void setSalecount(int salecount) {
        this.salecount = salecount;
    }

    
    
    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }

    public String getmFirstName() {
        return mFirstName;
    }

    public void setmFirstName(String mFirstName) {
        this.mFirstName = mFirstName;
    }

    public String getmLastName() {
        return mLastName;
    }

    public void setmLastName(String mLastName) {
        this.mLastName = mLastName;
    }
    
    public double getSaleAmount() {
        return SaleAmount;
    }

    public void setSaleAmount(double SaleAmount) {
        this.SaleAmount = SaleAmount;
    }
    
     public String getWatermark() {
        return watermark;
    }

    public void setWatermark(String watermark) {
        this.watermark = watermark;
    }
    
    
}
