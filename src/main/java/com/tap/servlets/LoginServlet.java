package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

	private UserDAOImpl dao;

	@Override
	public void init() {

		dao = new UserDAOImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String email = req.getParameter("email");

		String password = req.getParameter("password");

		User user = dao.login(email, password);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loggedInUser", user);

			if (user.getRole().equalsIgnoreCase("customer")) {
				resp.sendRedirect("home");
			} else if (user.getRole().equalsIgnoreCase("restaurant_admin")) {
				resp.sendRedirect(req.getContextPath()+ "/restaurantDashboard");

			} else if (user.getRole().equalsIgnoreCase("delivery_agent")) {
				resp.sendRedirect(req.getContextPath()+"/deliveryAgent");
			}

		}

		else {
			RequestDispatcher rd = req.getRequestDispatcher("views/login.jsp");
			rd.forward(req, resp);
		}
	}

}
