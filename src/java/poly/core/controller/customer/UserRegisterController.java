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
import poly.core.dao.impl.RoleDaoImpl;
import poly.core.dao.impl.UserDaoImpl;
import poly.core.persistence.entity.User;
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "RegisterCustomerController", urlPatterns = {"/customer/register"})
public class UserRegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Đăng ký tài khoản");
        request.setAttribute("breadcrumb", breadcrumb);

        request.getRequestDispatcher("/view/customer/user-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

//        Check duplicate username
        if (new UserDaoImpl().getUserByUsername(username) != null) {
            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Username đã tồn tại");
            request.getRequestDispatcher("/view/customer/user-register.jsp").forward(request, response);
            return;
        }
        
//        TODO: check any field is empty

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setAddress(address);
        user.setPhone(phone);
        user.setEmail(email);
        user.setRole(new RoleDaoImpl().getById(2));

        try {
            new UserDaoImpl().insert(user);
            request.getSession().setAttribute("customerUser", user);
            response.sendRedirect("/");
        } catch (Exception e) {
            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Đăng ký tài khoản thất bại");
            request.getRequestDispatcher("/view/customer/user-register.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
