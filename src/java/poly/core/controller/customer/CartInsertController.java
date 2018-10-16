/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.customer;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.core.dao.impl.CartDaoImpl;
import poly.core.dao.impl.CartDetailDaoImpl;
import poly.core.dao.impl.ProductDaoImpl;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.CartDetail;
import poly.core.persistence.entity.Product;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "CartInsertCustomerController", urlPatterns = {"/customer/cart/insert"})
public class CartInsertController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentSessionCustomerUser = (User) request.getSession().getAttribute("customerUser");

        if (currentSessionCustomerUser == null) {
            request.getRequestDispatcher("/view/customer/login.jsp").forward(request, response);
            return;
        }

        Integer productId;
        try {
            if (request.getParameter("productId") == null) {
                response.sendRedirect("/");
                return;
            }
            productId = Integer.parseInt(request.getParameter("productId"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Mã sản phẩm không hợp lệ");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
            return;
        }

        Cart cart = new CartDaoImpl().getCurrentCartByUser(currentSessionCustomerUser);
        
//        Check user is already have cart
        if (cart == null) {
            cart = new Cart(currentSessionCustomerUser, new Date());

            try {
//                If user does not have cart -> create new cart
                new CartDaoImpl().insert(cart);
            } catch (Exception e) {
                request.setAttribute(WebConstant.MESSAGE_ERROR, "Quá trình tạo giỏ hàng thất bại");
                request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
                return;
            }
        }

//        Get product
        Product product = new ProductDaoImpl().getById(productId);

        CartDetail cartDetail = null;

//        Check cart detail is already exist by cart and product
        try {
            cartDetail = new CartDetailDaoImpl().getByCartAndProduct(cart, product);
            cartDetail.setProductQuantity(cartDetail.getProductQuantity() + 1);
        } catch (Exception e) {
//            if does not already exsist
            cartDetail = new CartDetail(cart, product, 1);
        }

        try {
            new CartDetailDaoImpl().saveOrUpdate(cartDetail);
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Thêm sản phẩm vô giỏ hàng thất bại");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
