package com.tap.utility;

import java.util.List;
import java.util.Scanner;

import com.tap.DAOImpl.UserDAOImpl;
import com.tap.model.User;

public class Testing {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		UserDAOImpl udao = new UserDAOImpl();
		
//		System.out.println("Enter the username: ");
//		String name = sc.next();
//		System.out.println("Enter the email: ");
//		String email = sc.next();
//		System.out.println("Enter the password: ");
//		String pwd = sc.next();
//		System.out.println("Enter the address: ");
//		String address = sc.next();
//		System.out.println("Enter the phone number: ");
//		String phoneNum = sc.next();
//		System.out.println("Enter the role: ");
//		String role = sc.next();
//	
//		User u = new User(name, email, pwd, phoneNum, address, role);
//		
//		udao.addUser(u);
//	
//		System.out.println("User added");
		
		System.out.println("Enter the user id: ");
		int id = sc.nextInt();
		
		User u =   udao.getUser(id);
		System.out.println(u);
		
		u.setPassword("kavya@123");
		udao.updateUser(u);
		
		System.out.println(u);
		
		
		
		

	}

}
