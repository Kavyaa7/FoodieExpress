package com.tap.servlets;

import java.io.IOException;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registerServlet")
public class RegisterServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("fullName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phone = req.getParameter("phone");
		String role = req.getParameter("role");
		String address = req.getParameter("address");
		
		User user = new User();
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhoneNumber(phone);
		user.setRole(role);
		user.setAddress(address);
		
		UserDAOImpl userDAOImpl = new UserDAOImpl();
		
		int i = userDAOImpl.addUser(user);
		
		if(i>0) 
			resp.sendRedirect("views/login.jsp");

		else
			resp.sendRedirect("views/register.jsp");

	}

}
