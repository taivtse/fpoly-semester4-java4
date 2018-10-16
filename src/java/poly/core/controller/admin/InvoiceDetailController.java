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
import poly.core.dao.impl.CartDetailDaoImpl;
import poly.core.dao.impl.InvoiceDaoImpl;
import poly.core.persistence.entity.Cart;
import poly.core.persistence.entity.CartDetail;
import poly.core.persistence.entity.Invoice;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "InvoiceDetailAdminController", urlPatterns = {"/admin/invoice/detail"})
public class InvoiceDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Chi tiết đơn đặt hàng");

        Integer invoiceId = null;
        try {
            if (request.getParameter("invoiceId") == null) {
                response.sendRedirect("/");
                return;
            }

            invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.TYPE_ERROR, "Mã đơn đặt hàng không hợp lệ");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
            return;
        }

//        Get product information
        Invoice invoice = new InvoiceDaoImpl().getById(invoiceId);
        
        if (invoice == null) {
            request.setAttribute(WebConstant.TYPE_ERROR, "Không tồn tại đơn hàng mang mã: #" + invoiceId);
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
            return;
        }
        
        Cart cart = invoice.getCart();
        List<CartDetail> cartDetailsInInvoice = new CartDetailDaoImpl().getCartDetailItems(cart);
        
        request.setAttribute("breadcrumb", breadcrumb);
        request.setAttribute("invoice", invoice);
        request.setAttribute("cartDetailsInInvoice", cartDetailsInInvoice);
        request.getRequestDispatcher("/view/admin/invoice-detail.jsp").forward(request, response);
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
