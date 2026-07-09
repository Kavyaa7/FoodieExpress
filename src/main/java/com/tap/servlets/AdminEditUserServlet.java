package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editUser")
public class AdminEditUserServlet extends HttpServlet {
	
	UserDAOImpl userDAOImpl;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		
		userDAOImpl = new UserDAOImpl();
		User user = userDAOImpl.getUser(userId);
		
		req.setAttribute("user", user);
		
		req.getRequestDispatcher("/views/admin/updateUser.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));

		User user = new User();
		user.setId(userId);
		user.setName(req.getParameter("name"));
		user.setEmail(req.getParameter("email"));
		user.setRole(req.getParameter("role"));

		userDAOImpl.updateUser(user);

		resp.sendRedirect(req.getContextPath()+"/adminDashboard");
	}

}
