/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.entity;

/**
 *
 * @author TQK
 */
public class TeaDTO {
    private String productID;
    private String categoryID;
    private String productName;
    private double price;
    private int quantity;
    private String image;
    private String status;

    public TeaDTO() {
//        this.productID = "";
//        this.categoryID = "";
//        this.productName = "";
//        this.price = 0;
//        this.quantity = 0;
//        this.image = "";
//        this.status = "";
    }

    public TeaDTO(String productID, String categoryID, String productName, double price, int quantity, String image, String status) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TeaDTO{" + "productID=" + productID + ", categoryID=" + categoryID + ", productName=" + productName + ", price=" + price + ", quantity=" + quantity + ", image=" + image + ", status=" + status + '}';
    }
    
    
}
