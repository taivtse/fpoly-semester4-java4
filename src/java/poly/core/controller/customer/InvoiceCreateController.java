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
import poly.core.dao.impl.InvoiceDaoImpl;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.Invoice;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "InvoiceCreateCustomerController", urlPatterns = {"/customer/invoice/create"})
public class InvoiceCreateController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User currentSessionCustomerUser = (User) request.getSession().getAttribute("customerUser");

        if (currentSessionCustomerUser == null) {
            request.getRequestDispatcher("/view/customer/login.jsp").forward(request, response);
            return;
        }

        Integer cartId;
        try {
            if (request.getParameter("cartId") == null) {
                response.sendRedirect("/");
                return;
            }
            cartId = Integer.parseInt(request.getParameter("cartId"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Mã sản phẩm không hợp lệ");
            request.getRequestDispatcher("/view/customer/error.jsp").forward(request, response);
            return;
        }

        Cart cart = new CartDaoImpl().getById(cartId);
        cart.setStatus(1);

        try {
            new CartDaoImpl().update(cart);
            
            Invoice invoice = new Invoice(cart, currentSessionCustomerUser);
            new InvoiceDaoImpl().insert(invoice);
            response.sendRedirect("/customer/invoice");
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Tạo đơn đặt hàng thất bại");
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
