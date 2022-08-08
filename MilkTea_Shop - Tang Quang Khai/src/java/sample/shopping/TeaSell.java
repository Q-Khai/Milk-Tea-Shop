/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

/**
 *
 * @author TQK
 */
public class TeaSell {
    private String pID;
    private String pName;
    private String pImage;
    private double pPrice;
    private int pQuantity;
    private int pQuantityDB;

    public TeaSell() {
    }

    public TeaSell(String pID, String pName, String pImage, double pPrice, int pQuantity, int pQuantityDB) {
        this.pID = pID;
        this.pName = pName;
        this.pImage = pImage;
        this.pPrice = pPrice;
        this.pQuantity = pQuantity;
        this.pQuantityDB = pQuantityDB;
    }

    public String getpID() {
        return pID;
    }

    public void setpID(String pID) {
        this.pID = pID;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public double getpPrice() {
        return pPrice;
    }

    public void setpPrice(double pPrice) {
        this.pPrice = pPrice;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public int getpQuantityDB() {
        return pQuantityDB;
    }

    public void setpQuantityDB(int pQuantityDB) {
        this.pQuantityDB = pQuantityDB;
    }

    
    
    
    
}
