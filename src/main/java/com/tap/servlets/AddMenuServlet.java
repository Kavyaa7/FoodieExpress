package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		Restaurant restaurant = restaurantDAOImpl.getRestaurant(restaurantId);
		
		req.setAttribute("restaurant", restaurant);
		
		req.getRequestDispatcher("/views/addMenu.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		String itemName = req.getParameter("itemName");
		String description = req.getParameter("description");
		float price = Float.parseFloat(req.getParameter("price"));
		String imageUrl = req.getParameter("imageUrl");
		boolean isAvailable = Boolean.parseBoolean(req.getParameter("isAvailable"));
		
		Menu menu = new Menu();
		menu.setAvailable(isAvailable);
		menu.setDescription(description);
		menu.setImageUrl(imageUrl);
		menu.setItemName(itemName);
		menu.setPrice(price);
		menu.setRestaurantId(restaurantId);
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		menuDAOImpl.addMenuItem(menu);
		
		resp.sendRedirect(req.getContextPath()+"/restaurantDashboard");
	}

}
