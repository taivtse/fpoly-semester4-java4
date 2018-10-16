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
import poly.core.dao.impl.UserDaoImpl;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "LoginCustomerController", urlPatterns = {"/customer/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Đăng nhập");
        request.setAttribute("breadcrumb", breadcrumb);

        request.getRequestDispatcher("/view/customer/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = new UserDaoImpl().getUserByUsernameAndPassword(username, password);
            if (user == null) {
                throw new NullPointerException();
            }

            request.getSession().setAttribute("customerUser", user);
            response.sendRedirect("/");
        } catch (NullPointerException ex) {
            //        Set breadcrumb
            List<String> breadcrumb = new ArrayList<>();
            breadcrumb.add("Đăng nhập");
            request.setAttribute("breadcrumb", breadcrumb);

            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Tài khoản hoặc mật khẩu không hợp lệ");
            request.getRequestDispatcher("/view/customer/login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
