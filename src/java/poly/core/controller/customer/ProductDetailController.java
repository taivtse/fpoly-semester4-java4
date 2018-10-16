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
import poly.core.dao.impl.ProductDaoImpl;
import poly.core.persistence.entity.Product;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductDetailCustomerController", urlPatterns = {"/product/detail"})
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Sản phẩm");
        
        Integer productId = null;
        try {
            if (request.getParameter("productId") == null) {
                response.sendRedirect("/");
                return;
            }

            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (Exception e) {
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
            return;
        }

//        Get product information
        Product product = new ProductDaoImpl().getById(productId);
        
//        Get related product
        List<Product> relatedProducts = new ProductDaoImpl().getRelated(product);

        breadcrumb.add(product.getName());
        request.setAttribute("breadcrumb", breadcrumb);
        request.setAttribute("product", product);
        request.setAttribute("relatedProducts", relatedProducts);
        request.getRequestDispatcher("/view/customer/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
