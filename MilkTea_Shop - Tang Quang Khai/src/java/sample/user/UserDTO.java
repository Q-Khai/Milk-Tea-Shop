/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author TQK
 */
public class UserDTO {
    private String userID;
    private String roleID;
    private String fullName;
    private String password;
    private String address;
    private String phone;
    private String email;

    public UserDTO() {
        this.userID = "";
        this.roleID = "";
        this.fullName = "";
        this.password = "";
        this.address = "";
        this.phone = "";
        this.email = "";
    }

    public UserDTO(String userID, String roleID, String fullName, String password, String address, String phone, String email) {
        this.userID = userID;
        this.roleID = roleID;
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
