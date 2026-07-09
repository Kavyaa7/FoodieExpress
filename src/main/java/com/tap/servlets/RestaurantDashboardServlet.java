package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.DAOImpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/restaurantDashboard")
public class RestaurantDashboardServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		User loggedInUser = (User)session.getAttribute("loggedInUser");
		
		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		
		if(loggedInUser!=null) {
			Restaurant restaurant = restaurantDAOImpl.getRestaurantByUser(loggedInUser.getId());
			
			if(restaurant!=null) {
			List<Menu> menu = menuDAOImpl.getMenuByRestaurant(restaurant.getRestaurantId());
			
			req.setAttribute("restaurant", restaurant);
			req.setAttribute("menu", menu);
			
			RequestDispatcher rd = req.getRequestDispatcher("views/restaurantDashboard.jsp");
			rd.forward(req, resp);
			}
			
			else {
				resp.sendRedirect("views/login.jsp");
			}
		}
		
		else {
			resp.sendRedirect("views/login.jsp");
		}
		
	
	}

}
