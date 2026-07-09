package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		List<Menu> allMenuItems = menuDAOImpl.getMenuByRestaurant(restaurantId);
		Restaurant selectedRestaurant = restaurantDAOImpl.getRestaurant(restaurantId);
		
		req.setAttribute("allMenuItems", allMenuItems);
		req.setAttribute("selectedRestaurant", selectedRestaurant);
		
		RequestDispatcher rd = req.getRequestDispatcher("views/menu.jsp");
		
		rd.forward(req, resp);
		
	}
}
