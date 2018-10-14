/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import poly.core.dao.impl.UserDaoImpl;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

@WebServlet(name = "LoginAdminController", urlPatterns = {"/admin/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/admin/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            User user = new UserDaoImpl().getUserByUsernameAndPassword(username, password);
            if (user.getRole().getId() == WebConstant.ROLE_ADMIN) {
                request.getSession().setAttribute("adminUser", user);
                response.sendRedirect("/admin/home");
                return;
            } else {
                request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Tài khoản của bạn không có quyền truy cập vào trang quản trị");
            }
        } catch (NullPointerException ex) {
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Tài khoản hoặc mật khẩu không hợp lệ");
        }
        
        request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
        request.getRequestDispatcher("/view/admin/login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
