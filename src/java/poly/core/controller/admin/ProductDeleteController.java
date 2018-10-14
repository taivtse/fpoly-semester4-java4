/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.core.dao.impl.ProductDaoImpl;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductDeleteAdminController", urlPatterns = {"/admin/product/delete"})
public class ProductDeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer productId = null;
        
        try {
            if (request.getParameter("productId") == null) {
                throw new NullPointerException();
            }
                productId = Integer.parseInt(request.getParameter("productId"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Mã sản phẩm không hợp lệ");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
            return;
        }

        try {
            new ProductDaoImpl().deleteById(productId);
            response.sendRedirect("/admin/product");
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Xoá sản phẩm thất bại");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
