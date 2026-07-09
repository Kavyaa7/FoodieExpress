package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/food_delivery";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Kavya@29";
    private static Connection con;
    
    public static Connection getConnection(){

       try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            //System.out.println("MySQL Driver Loaded Successfully");
            
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            
        } catch (SQLException e) {
			e.printStackTrace();
		}
       
       return con;
       
    }
}
