package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class AdminDeleteUser extends HttpServlet{
		
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		
		userDAOImpl.deleteUser(userId);
		
		resp.sendRedirect(req.getContextPath()+"/adminDashboard");
	}
}
