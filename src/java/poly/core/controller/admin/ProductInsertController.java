/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import poly.core.common.CoreConstant;
import poly.core.dao.impl.CategoryDaoImpl;
import poly.core.dao.impl.ProductDaoImpl;
import poly.core.persistence.entity.Category;
import poly.core.persistence.entity.Product;
import poly.core.util.FileUtil;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "ProductInsertAdminController", urlPatterns = {"/admin/product/insert"})
public class ProductInsertController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Sản phẩm");
        breadcrumb.add("Thêm mới");
        request.setAttribute("breadcrumb", breadcrumb);
        request.getRequestDispatcher("/view/admin/product-insert.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        int price = Integer.parseInt(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Part image = request.getPart("image");
        String imageUrl = image.getSubmittedFileName();
        
        Category category = new CategoryDaoImpl().getById(categoryId);
        
        Product product = new Product();
        product.setCategory(category);
        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);
        product.setDescription(description);
        product.setImageUrl(imageUrl);
        
        try {
            new ProductDaoImpl().insert(product);
            
//            Upload image
            String uploadRootPath = request.getServletContext().getRealPath(CoreConstant.IMAGE_URL);
            boolean uploadedImage = new FileUtil().uploadFile(imageUrl, image, uploadRootPath);
            if (!uploadedImage) {
                request.setAttribute(WebConstant.MESSAGE_ERROR, "Thêm hình ảnh sản phẩm thất bại");
                request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
                return;
            }
            
            response.sendRedirect("/admin/product");
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Thêm sản phẩm thất bại");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
