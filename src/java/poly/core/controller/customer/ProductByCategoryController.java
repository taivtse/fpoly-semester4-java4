/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.customer;

import java.io.IOException;
import java.util.ArrayList;
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
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductByCategoryCustomerController", urlPatterns = {"/product"})
public class ProductByCategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Sản phẩm");
        
        Integer categoryId = null;
        List<Product> productList = null;
        
        try {
            if (request.getParameter("categoryId") != null) {
                categoryId = Integer.parseInt(request.getParameter("categoryId"));
            }
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Danh mục không hợp lệ");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
            return;
        }

        if (categoryId != null) {
            Category category = new CategoryDaoImpl().getById(categoryId);
            productList = new ProductDaoImpl().getByCategory(category);
            breadcrumb.add(category.getName());
        } else {
            productList = new ProductDaoImpl().getAll();
        }

        request.setAttribute("breadcrumb", breadcrumb);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/view/customer/index.jsp").forward(request, response);
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
