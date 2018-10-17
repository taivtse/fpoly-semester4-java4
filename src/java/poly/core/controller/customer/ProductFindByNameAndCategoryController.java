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
@WebServlet(name = "ProductFindByNameAndCategoryCustomerController", urlPatterns = {"/product/search"})
public class ProductFindByNameAndCategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Sản phẩm");
        breadcrumb.add("Tìm kiếm");

        Integer searchCategoryId = null;
        String searchName = null;
        List<Product> productList = null;

        try {
            searchCategoryId = Integer.parseInt(request.getParameter("searchCategoryId"));
            searchName = request.getParameter("searchName");
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Danh mục không hợp lệ");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
            return;
        }

        Category category;

//            get by categoryid
        if (searchCategoryId != -1) {
            category = new CategoryDaoImpl().getById(searchCategoryId);
            productList = new ProductDaoImpl().getBySearchNameAndCategory(searchName, category);
        } else {
            productList = new ProductDaoImpl().getBySearchName(searchName);
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
