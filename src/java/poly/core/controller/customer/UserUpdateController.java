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
@WebServlet(name = "UserUpdateCustomerController", urlPatterns = {"/customer/update"})
public class UserUpdateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        Set breadcrumb
        List<String> breadcrumb = new ArrayList<>();
        breadcrumb.add("Cập nhật thông tin cá nhân");
        request.setAttribute("breadcrumb", breadcrumb);
        
        request.getRequestDispatcher("/view/customer/user-update.jsp").forward(request, response);
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

//        Check change username
        User currentSessionCustomerUser = (User) request.getSession().getAttribute("customerUser");
        if (!currentSessionCustomerUser.getUsername().equals(username)) {
            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Không được thay đổi username");
            request.getRequestDispatcher("/view/customer/user-update.jsp").forward(request, response);
            return;
        }
        
//        TODO: check any field is empty

        User user = new UserDaoImpl().getUserByUsername(username);
        user.setPassword(password);
        user.setFullname(fullname);
        user.setAddress(address);
        user.setPhone(phone);
        user.setEmail(email);

        try {
            new UserDaoImpl().update(user);
            request.getSession().setAttribute("customerUser", user);
            
            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_SUCCESS);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Cập nhật thông tin thành công");
        } catch (Exception e) {
            request.setAttribute(WebConstant.ALERT, WebConstant.TYPE_ERROR);
            request.setAttribute(WebConstant.MESSAGE_RESPONSE, "Cập nhật thông tin thất bại");
        }
        request.getRequestDispatcher("/view/customer/user-update.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
