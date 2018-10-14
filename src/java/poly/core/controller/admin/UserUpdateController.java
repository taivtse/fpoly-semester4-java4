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
import poly.core.dao.impl.RoleDaoImpl;
import poly.core.dao.impl.UserDaoImpl;
import poly.core.persistence.entity.Role;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "UserUpdateAdminController", urlPatterns = {"/admin/user/update"})
public class UserUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer userId = null;
        try {
            if (request.getParameter("userId") == null) {
                throw new NullPointerException();
            }
            userId = Integer.parseInt(request.getParameter("userId"));
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Mã người dùng không hợp lệ");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
            return;
        }

        //        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Người dùng");
        breadcrumb.add("Cập nhật");
        request.setAttribute("breadcrumb", breadcrumb);

        User user = new UserDaoImpl().getById(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/view/admin/user-update.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer userId = Integer.parseInt(request.getParameter("userId"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        
        Role role = new RoleDaoImpl().getById(roleId);
        User user = new UserDaoImpl().getById(userId);
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setRole(role);
        
        try {
            new UserDaoImpl().update(user);

            response.sendRedirect("/admin/user");
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Cập nhật người dùng thất bại");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
