/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package poly.core.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author vothanhtai
 */
@WebServlet(name = "UserViewController", urlPatterns = {"/admin/user"})
public class UserViewController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Integer roleId = null;
        List<User> userList = null;
        
        try {
            if (request.getParameter("role") != null) {
                roleId = Integer.parseInt(request.getParameter("role"));
            }
        } catch (Exception e) {
            request.getRequestDispatcher("/view/admin/error-404.jsp").forward(request, response);
        }

        if (roleId != null) {
            Role role = new RoleDaoImpl().getById(roleId);
            userList = new UserDaoImpl().getByProperties("role", role, null, null, null, null);
        } else {
            userList = new UserDaoImpl().getAll();
        }

        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/view/admin/user-view.jsp").forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
