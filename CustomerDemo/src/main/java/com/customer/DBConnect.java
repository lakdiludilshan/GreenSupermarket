package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static String url = "jdbc:mysql://localhost:3306/supermarket";
	private static String username = "root";
	private static String password = "1234";
	private static Connection con;
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
		}
		catch(Exception e)
		{
			System.out.println("Databse Connection is not success");	
		}
		return con;
	}
	

}
