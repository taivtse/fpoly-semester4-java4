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
@WebServlet(name = "UserViewAdminController", urlPatterns = {"/admin/user"})
public class UserViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Người dùng");
        
        Integer roleId = null;
        List<User> userList = null;

        try {
            if (request.getParameter("roleId") != null) {
                roleId = Integer.parseInt(request.getParameter("roleId"));
            }
        } catch (Exception e) {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Mã vai trò không hợp lệ");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
            return;
        }

        if (roleId != null) {
            Role role = new RoleDaoImpl().getById(roleId);
            
//            Add item to breadcrumb
            breadcrumb.add(role.getName());
            
            userList = new UserDaoImpl().getByRole(role);
        } else {
            userList = new UserDaoImpl().getAll();
        }
        
        request.setAttribute("breadcrumb", breadcrumb);
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/view/admin/user-view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
