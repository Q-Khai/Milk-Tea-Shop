/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author TQK
 */
public class TeaDAO {

    private static final String GET_ALL = "SELECT * FROM tblProduct WHERE status = 'true'";
    private static final String GET_PRODUCT_BY_CATEGỎY = "SELECT * FROM tblProduct WHERE categoryID=? AND status = 'true'";
    private static final String GET_PRODUCT_BY_ID = "SELECT * FROM tblProduct WHERE productID=? AND status = 'true'";
    private static final String GET_ALL_CATEGORY = "SELECT * FROM tblCategory";
    private static final String GET_ALL_SHOPPING = "SELECT * FROM tblProduct WHERE status = 'true' AND quantity>=1";
    private static final String SEARCH = "SELECT * FROM tblProduct WHERE productName like ? AND status = 'true' AND quantity>=1";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, image=?, price=?, quantity=?, categoryID=? WHERE productID=?";
    private static final String DELETE = "UPDATE tblProduct SET status='false' WHERE productID=?";
    private static final String ADD_PRODUCT = "INSERT INTO tblProduct(productID, categoryID, productName, price, quantity, image, status)  VALUES(?,?,?,?,?,?,'true')";
    private static final String CHECK_DUPLICATE = "SELECT productName FROM tblProduct WHERE productID=?";

    public List<TeaDTO> getAllProduct() throws SQLException {
        List<TeaDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String status = rs.getString("status");
                    list.add(new TeaDTO(productID, categoryID, productName, price, quantity, image, status));
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
        return list;
    }

    public List<TeaDTO> getAllShopping() throws SQLException {
        List<TeaDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_SHOPPING);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String status = rs.getString("status");
                    list.add(new TeaDTO(productID, categoryID, productName, price, quantity, image, status));
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
        return list;
    }

    //get Category
    public List<Category> getAllCategory() throws SQLException {
        List<Category> listC = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CATEGORY);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    listC.add(new Category(categoryID, categoryName));
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
        return listC;
    }

    //Search
    public List<TeaDTO> getListProduct(String search) throws SQLException {
        List<TeaDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String status = rs.getString("status");
                    list.add(new TeaDTO(productID, categoryID, productName, price, quantity, image, status));
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
        return list;
    }

    public List<TeaDTO> getProductByCategory(String categoryID) throws SQLException {
        List<TeaDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_CATEGỎY);
                ptm.setString(1, categoryID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
//                    String categoryID = rs.getString("categoryID");
                    String productName = rs.getString("productName");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String status = rs.getString("status");
                    list.add(new TeaDTO(productID, categoryID, productName, price, quantity, image, status));
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
        return list;
    }

    public TeaDTO getProductByID(String productID) throws SQLException {
        TeaDTO tea = new TeaDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_PRODUCT_BY_ID);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    tea.setProductID(rs.getString("productID"));
                    tea.setCategoryID(rs.getString("categoryID"));
                    tea.setProductName(rs.getString("productName"));
                    tea.setPrice(rs.getDouble("price"));
                    tea.setQuantity(rs.getInt("quantity"));
                    tea.setImage(rs.getString("image"));
                    tea.setStatus(rs.getString("status"));

                }
                return tea;
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
        return null;
    }

    public boolean addProduct(String productID, String categoryID, String productName, String price, String quantity, String image)
            throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(ADD_PRODUCT);
            if (conn != null) {
                ptm.setString(1, productID);
                ptm.setString(2, categoryID);
                ptm.setString(3, productName);
                ptm.setString(4, price);
                ptm.setString(5, quantity);
                ptm.setString(6, image);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

//    check duplicate productID
    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                ptm.executeUpdate();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean updateProduct(String productID, String categoryID, String productName, String price, String quantity, String image)
            throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, productID);
                ptm.setString(2, categoryID);
                ptm.setString(3, productName);
                ptm.setString(4, price);
                ptm.setString(5, quantity);
                ptm.setString(6, image);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

//    public boolean updateProduct(TeaDTO tea ) 
//            throws SQLException {
//        boolean check = false;
//        Connection conn = null;
//        PreparedStatement ptm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(UPDATE);
//                ptm.setString(1, tea.getProductID());
//                ptm.setString(2, tea.getCategoryID());
//                ptm.setString(3, tea.getProductName());
//                ptm.setDouble(4, tea.getPrice());
//                ptm.setInt(5, tea.getQuantity());
//                ptm.setString(6, tea.getImage());
//                check = ptm.executeUpdate() > 0 ? true : false;
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
    public boolean deleteProduct(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

}
