package com.tap.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("loggedInUser");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/views/login.jsp");
            return;
        }

        user.setName(req.getParameter("name"));
        user.setPhoneNumber(req.getParameter("phone"));
        user.setAddress(req.getParameter("address"));
        user.setLastLoginDate(new Timestamp(System.currentTimeMillis()));

        UserDAOImpl dao = new UserDAOImpl();
        dao.updateProfile(user);

        session.setAttribute("loggedInUser", user);

        resp.sendRedirect(req.getContextPath() + "/views/profile.jsp");
    }
}
