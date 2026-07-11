package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static String HOST = System.getenv("DB_HOST");
	private static String PORT = System.getenv("DB_PORT");
	private static String DB   = System.getenv("DB_NAME");
	private static String USER = System.getenv("DB_USER");
	private static String PASS = System.getenv("DB_PASS");
	private static String URL  = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DB + "?useSSL=true&requireSSL=true";
	
    private static Connection con;
    
    public static Connection getConnection(){

       try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            //System.out.println("MySQL Driver Loaded Successfully");
            
            con = DriverManager.getConnection(URL, USER, PASS);
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            
        } catch (SQLException e) {
			e.printStackTrace();
		}
       
       return con;
       
    }
}
