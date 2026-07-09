package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAO.OrderDAO;
import com.tap.DAO.RestaurantDAO;
import com.tap.DAO.UserDAO;
import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.Order;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    private UserDAO userDAO;
    private OrderDAO orderDAO;
    private RestaurantDAO restaurantDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAOImpl();
        orderDAO = new OrderDAOImpl();
        restaurantDAO = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/views/admin/adminLogin.jsp");
            return;
        }

        List<User> users = userDAO.getAllUsers();
        List<Order> orders = orderDAO.getAllOrders();
        List<Restaurant> restaurants = restaurantDAO.getAllRestaurants();

        request.setAttribute("users", users);
        request.setAttribute("orders", orders);
        request.setAttribute("restaurants", restaurants);

        request.getRequestDispatcher("/views/admin/adminHome.jsp")
                .forward(request, response);
    }
}