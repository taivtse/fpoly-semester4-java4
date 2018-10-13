/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import poly.core.dao.impl.CategoryDaoImpl;
import poly.core.dao.impl.ProductDaoImpl;
import poly.core.persistence.entity.Category;
import poly.core.persistence.entity.Product;
import poly.core.util.FileUtil;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductUpdateController", urlPatterns = {"/admin/product/update"})
public class ProductUpdateController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");
        if (action == null) {
            Product product = new ProductDaoImpl().getById(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/view/admin/product-update.jsp").forward(request, response);
            return;
        }

        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Part image = request.getPart("image");
        String imageUrl = image.getSubmittedFileName();

        Category category = new CategoryDaoImpl().getById(categoryId);

        Product product = new ProductDaoImpl().getById(id);
        product.setCategory(category);
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);
        if (!imageUrl.equals("")) {
            product.setImageUrl(imageUrl);
        }
        
        boolean isUpdated = new ProductDaoImpl().update(product);
        if (isUpdated) {
            if (!imageUrl.equals("")) {
                String uploadRootPath = request.getServletContext().getRealPath(File.separator + "resources" + File.separator + "image" + File.separator);
                boolean uploadedImage = new FileUtil().uploadFile(imageUrl, image, uploadRootPath);
                if (!uploadedImage) {
                    request.getRequestDispatcher("/view/admin/error-404.jsp").forward(request, response);
                }
            }

            response.sendRedirect("/admin/product");
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
