package com.tap.servlets;

import java.io.IOException;

import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User admin = userDAO.login(email, password);

        if (admin != null && "super_admin".equalsIgnoreCase(admin.getRole())) {

            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);

            response.sendRedirect(request.getContextPath() + "/views/admin/adminHome.jsp");

        } else {

            request.setAttribute("error", "Invalid Admin Credentials");
            request.getRequestDispatcher("/views/admin/adminLogin.jsp").forward(request, response);

        }
    }
}