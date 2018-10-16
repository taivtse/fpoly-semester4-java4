/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.core.dao.impl.CartDetailDaoImpl;
import poly.core.dao.impl.InvoiceDaoImpl;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.CartDetail;
import poly.core.persistence.entity.Invoice;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "InvoiceViewAdminController", urlPatterns = {"/admin/invoice"})
public class InvoiceViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Đơn đặt hàng");
        
        List<Invoice> invoiceList = new InvoiceDaoImpl().getAll();
        
        for (Invoice invoice : invoiceList) {
            Cart cart = invoice.getCart();
            List<CartDetail> cartDetails = new CartDetailDaoImpl().getCartDetailItems(cart);
            cart.setCartDetails(new HashSet<>(cartDetails));
        }
        
        request.setAttribute("invoiceList", invoiceList);
        request.setAttribute("breadcrumb", breadcrumb);
        request.getRequestDispatcher("/view/admin/invoice-view.jsp").forward(request, response);
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
