/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.customer;

import java.io.IOException;
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
@WebServlet(name = "CartDeleteCustomerController", urlPatterns = {"/user/cart/delete"})
public class CartDeleteController extends HttpServlet {

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
        
        
//        Get product
        Product product = new ProductDaoImpl().getById(productId);

//        Get cart detail of product in cart
        CartDetail cartDetail = new CartDetailDaoImpl().getByCartAndProduct(cart, product);

        try {
            new CartDetailDaoImpl().delete(cartDetail);
            response.sendRedirect(request.getHeader("referer"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Xoá sản phẩm trong giỏ hàng thất bại");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
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
