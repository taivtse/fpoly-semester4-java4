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
import poly.web.common.WebConstant;

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "UserDeleteController", urlPatterns = {"/admin/user/delete"})
public class UserDeleteController extends HttpServlet {

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

        boolean isDeleted = new UserDaoImpl().deleteById(userId);
        if (isDeleted) {
            response.sendRedirect("/admin/user");
        } else {
            request.setAttribute(WebConstant.MESSAGE_ERROR, "Quá trình xoá thất bại");
            request.getRequestDispatcher("/view/admin/error.jsp").forward(request, response);
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