package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteRestaurant")
public class AdminDeleteRestaurantServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect(req.getContextPath() + "/views/admin/adminLogin.jsp");
            return;
        }

        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));

        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
        restaurantDAOImpl.deleteRestaurant(restaurantId);

        resp.sendRedirect(req.getContextPath() + "/adminDashboard");
    }
}