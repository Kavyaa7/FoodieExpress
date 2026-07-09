package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/acceptOrder")
public class AcceptOrderServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int orderId = Integer.parseInt(req.getParameter("orderId"));
		
		OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
		Order order = orderDAOImpl.getOrderById(orderId);
		
		if(order!=null) {
			orderDAOImpl.updateOrderStatus(orderId,"out_for_delivery");
		}
			
		resp.sendRedirect(req.getContextPath() + "/deliveryDashboard.jsp");
	}
}