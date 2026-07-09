package com.tap.servlets;

import java.io.IOException;
import java.util.List;

import com.tap.DAOImpl.OrderDAOImpl;
import com.tap.model.Order;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deliveryAgent")
public class DeliveryDashboardServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
		List<Order> confirmedOrders = orderDAOImpl.getConfirmedOrders();
		
		req.setAttribute("confirmedOrders", confirmedOrders);
		
		RequestDispatcher rd = req.getRequestDispatcher("/views/deliveryDashboard.jsp");
		rd.forward(req, resp);
	}
}
