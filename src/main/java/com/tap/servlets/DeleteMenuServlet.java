package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.MenuDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		menuDAOImpl.deleteMenuItem(menuId);
		
		resp.sendRedirect(req.getContextPath()+"/views/restaurantDashboard.jsp");
	}
}
