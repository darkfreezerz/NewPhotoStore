/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author HenGzTy
 */
public class ProductSold {
    private int p_id;
    private int m_id;
    private String p_name;
    private String p_address;
    private int p_salecount;
    private double p_price;
    private String payment_status;
    private double sale_amount;
    
    public ProductSold(){
        
    }
    
    public ProductSold(int m_id, int p_id, String p_name, String p_address, double p_price, int p_salecount, String payment_status, double sale_amount){
        this.m_id = m_id;
        this.p_id = p_id;
        this.p_name = p_name;
        this.p_address = p_address;
        this.p_price = p_price;
        this.p_salecount = p_salecount;
        this.payment_status = payment_status;
        this.sale_amount = sale_amount;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public int getP_salecount() {
        return p_salecount;
    }

    public void setP_salecount(int p_salecount) {
        this.p_salecount = p_salecount;
    }

    public double getP_price() {
        return p_price;
    }

    public void setP_price(double p_price) {
        this.p_price = p_price;
    }

    public String getPayment_status() {
        return payment_status;
    }

    public void setPayment_status(String payment_status) {
        this.payment_status = payment_status;
    }

    public double getSale_amount() {
        return sale_amount;
    }

    public void setSale_amount(double sale_amout) {
        this.sale_amount = sale_amount;
    }
    
    
    
}
