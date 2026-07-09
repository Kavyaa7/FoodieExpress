package com.tap.servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.DAOImpl.OrderItemDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Order;
import com.tap.model.OrderItem;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		User user = (User)session.getAttribute("loggedInUser");
		int restaurantId = (int)session.getAttribute("restaurantId");
		float finalAmount = (float)session.getAttribute("finalAmount");
		
		if(user==null) {
			RequestDispatcher rd = req.getRequestDispatcher("views/login.jsp");
			rd.forward(req, resp);
		}
		
		if(user!= null && cart != null && !cart.getCartItems().isEmpty()) {
			
			String paymentMethod = req.getParameter("paymentMethod");
			
			Order order = new Order();
			
			order.setUserId(user.getId());
			order.setRestaurantId(restaurantId);
			order.setTotalAmount(finalAmount);
			order.setPaymentMethod(paymentMethod);
			order.setStatus("confirmed");
			order.setOrderDate(new Timestamp(System.currentTimeMillis()));
			
			OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
			int orderId = orderDAOImpl.addOrder(order);
			
			OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
			
			
			Map<Integer, CartItem> cartItems = cart.getCartItems();
			
			for(CartItem cartItem:cartItems.values()) {
				
				OrderItem orderItem = new OrderItem();
				orderItem.setOrderId(orderId);
				orderItem.setMenuId(cartItem.getMenuId());
				orderItem.setItemName(cartItem.getName());
				orderItem.setQuantity(cartItem.getQuantity());
				orderItem.setItemTotal(cartItem.getPrice()*cartItem.getQuantity());
				
				orderItemDAOImpl.addOrderItem(orderItem);
				
			}
			
			session.removeAttribute("cart");
			session.removeAttribute("restaurantId");
			session.removeAttribute("finalAmount");
			
			resp.sendRedirect("views/orderConfirmation.jsp");

		}
		
		else {
			resp.sendRedirect("views/cart.jsp");
		}
		
	}
}
