/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author TQK
 */
public class UserDAO {
    private static final String LOGIN = "SELECT roleID, fullName, address, phone, email "
                                    + "FROM tblUsers "
                                    + "WHERE userID=? AND password=?";
//    private static final String REGISTER = "INSERT INTO tblUsers(userID, roleID, fullName, password, address, phone, email) VALUES (?, 'US', ?, ?, ?, ?, ?)";
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID); 
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String roleID = rs.getString("roleID");
                    String fullName = rs.getString("fullName");
                    String address = rs.getString("address");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    user = new UserDTO(userID, roleID, fullName, "***", address, phone, email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }
    
//    public boolean signup(UserDTO user) throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(REGISTER);
//                ptm.setString(1, user.getUserID());
//                ptm.setString(2, user.getFullName());
//                ptm.setString(3, user.getPassword());
//                ptm.setString(4, user.getAddress());
//                ptm.setString(5, user.getPhone());
//                ptm.setString(6, user.getEmail());
//                check = ptm.executeUpdate() > 0 ? true:false;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
    
}
