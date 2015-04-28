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
public class MerchantPayment {
    int MpayId ;
    double Mpaycost;
    String MpayStatus;
    int mID;
    int aID;
    String Mpaydate;
    String MPaypal;

    public String getMPaypal() {
        return MPaypal;
    }

    public void setMPaypal(String MPaypal) {
        this.MPaypal = MPaypal;
    }

    public int getMpayId() {
        return MpayId;
    }

    public void setMpayId(int MpayId) {
        this.MpayId = MpayId;
    }

    public double getMpaycost() {
        return Mpaycost;
    }

    public void setMpaycost(double Mpaycost) {
        this.Mpaycost = Mpaycost;
    }

    public String getMpayStatus() {
        return MpayStatus;
    }

    public void setMpayStatus(String MpayStatus) {
        this.MpayStatus = MpayStatus;
    }

    public String getMpaydate() {
        return Mpaydate;
    }

    public void setMpaydate(String Mpaydate) {
        this.Mpaydate = Mpaydate;
    }

    public int getmID() {
        return mID;
    }

    public void setmID(int mID) {
        this.mID = mID;
    }

    public int getaID() {
        return aID;
    }

    public void setaID(int aID) {
        this.aID = aID;
    }
    
    
}
