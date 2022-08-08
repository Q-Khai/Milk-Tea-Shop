/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.shopping.Cart;
import sample.shopping.TeaSell;

/**
 *
 * @author TQK
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShoppingController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
//            String pPrice = request.getParameter("price");
            double price = Double.parseDouble(request.getParameter("price"));
//            String quantityDB = request.getParameter("quantity");
            int quantityDB = Integer.parseInt(request.getParameter("quantity"));
            TeaSell tea= new TeaSell(productID,productName, image, price, 1, quantityDB);
            HttpSession session = request.getSession();
//            if (session != null) {
            Cart cart = (Cart) session.getAttribute("CART");
            
            if (cart == null) {
                cart = new Cart();
            }
            cart.add(tea);
//                url = SUCCESS;

            ArrayList<TeaSell> listTeaSell = new ArrayList<>();
            for (Map.Entry<String, TeaSell> entry : cart.getCart().entrySet()) {
                listTeaSell.add(entry.getValue());
            }
            session.setAttribute("LIST_CART", listTeaSell);
            session.setAttribute("CART", cart);
            url = SUCCESS;
//            }
        } catch (Exception e) {
            log("Error at AddController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}