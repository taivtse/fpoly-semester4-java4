/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.core.dao.impl.CategoryDaoImpl;
import poly.core.dao.impl.ProductDaoImpl;
import poly.core.persistence.entity.Category;
import poly.core.persistence.entity.Product;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductViewController", urlPatterns = {"/client/product"})
public class ProductViewController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Integer categoryId = null;
        List<Product> productList = null;
        
        try {
            if (request.getParameter("category") != null) {
                categoryId = Integer.parseInt(request.getParameter("category"));
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/view/web/error-404.html").forward(request, response);
        }

        if (categoryId != null) {
            Category category = new CategoryDaoImpl().getById(categoryId);
            productList = new ProductDaoImpl().getByProperties("category", category, null, null, null, null);
        } else {
            productList = new ProductDaoImpl().getAll();
        }

        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/view/web/index.jsp").forward(request, response);

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
