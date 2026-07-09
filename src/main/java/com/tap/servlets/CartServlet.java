package com.tap.servlets;

import java.io.IOException;
import java.util.Map;

import com.tap.DAOImpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	
	MenuDAOImpl menuDAO = new MenuDAOImpl();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Cart cart = (Cart)session.getAttribute("cart");
		Integer restaurantId = (Integer)session.getAttribute("restaurantId");
		
		String action = req.getParameter("action");
		Integer newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
		
		if(cart==null || newRestaurantId!=restaurantId) {
			cart = new Cart();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", restaurantId);
		}
		
		if(action.equals("add")) {
			addItemToCart(req,cart);
		}
		
		else if(action.equals("update")) {
			updateCart(req,cart);
		}
		
		else if(action.equals("delete")) {
			removeItemFromCart(req,cart);
		}
		
		resp.sendRedirect("views/cart.jsp");
	}

	private void removeItemFromCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		
		cart.removeItem(menuId);
	}

	private void updateCart(HttpServletRequest req, Cart cart) {
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		cart.updateItem(menuId,quantity);
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {

		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		
		Menu menuItem = menuDAO.getMenuItem(menuId);
		
		int restaurantId = menuItem.getRestaurantId();
		HttpSession session = req.getSession();
		session.setAttribute("restaurantId", restaurantId);
		
		float price = menuItem.getPrice();
		String itemName = menuItem.getItemName();
		
		if(menuItem!=null) {
		CartItem cartItem = new CartItem(menuId, restaurantId, itemName, price, quantity);
		
		cart.addItem(cartItem);

		}
		
		
	}
}
