package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editRestaurant")
public class AdminEditRestaurantServlet extends HttpServlet {

    private RestaurantDAOImpl restaurantDAOImpl;

    @Override
    public void init() throws ServletException {
        restaurantDAOImpl = new RestaurantDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect(req.getContextPath() + "/views/admin/adminLogin.jsp");
            return;
        }

        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        Restaurant restaurant = restaurantDAOImpl.getRestaurant(restaurantId);

        req.setAttribute("restaurant", restaurant);

        req.getRequestDispatcher("/views/admin/updateRestaurant.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("admin") == null) {
            resp.sendRedirect(req.getContextPath() + "/views/admin/adminLogin.jsp");
            return;
        }

        Restaurant restaurant = new Restaurant();
        restaurant.setRestaurantId(Integer.parseInt(req.getParameter("restaurantId")));
        restaurant.setRestaurantName(req.getParameter("restaurantName"));
        restaurant.setAddress(req.getParameter("address"));
        restaurant.setCuisineType(req.getParameter("cuisineType"));
        restaurant.setRating(Float.parseFloat(req.getParameter("rating")));
        restaurant.setDeliveryTime(Integer.parseInt(req.getParameter("deliveryTime")));
        restaurant.setActive(Boolean.parseBoolean(req.getParameter("isActive")));
        restaurant.setImagePath(req.getParameter("imagePath"));
        restaurant.setUserId(Integer.parseInt(req.getParameter("userId")));

        restaurantDAOImpl.updateRestaurant(restaurant);

        resp.sendRedirect(req.getContextPath() + "/adminDashboard");
    }
}