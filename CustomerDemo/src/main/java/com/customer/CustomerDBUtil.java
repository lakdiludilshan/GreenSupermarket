package com.customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



public class CustomerDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
    public static boolean validate(String username, String password)
    {
    	
        try
        {
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "select * from customer where username='"+username+"' and password='"+password+"'";
        	rs = stmt.executeQuery(sql);
        	
        	if(rs.next())
        	{
        		isSuccess=true;
        	}
        	else
        	{
        		isSuccess=false;
        	}
        }
        catch(Exception e) 
        {
        	e.printStackTrace();
        }
    	
    	return isSuccess;
    }

    public static List<Customer> getCustomer(String username) {
        ArrayList<Customer> customer = new ArrayList<>();

        try
        {	
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "select * customer where username='"+username+"'";
        	rs = stmt.executeQuery(sql);

        	if (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String email = rs.getString(3);
                    String phone = rs.getString(4);
                    String userU = rs.getString(5);
                    String passU = rs.getString(6);

                    Customer c = new Customer(id, name, email, phone, userU, passU);
                    customer.add(c);
                }
        } 
        catch (SQLException e) 
        {
            e.printStackTrace(); 
        }

        return customer;
    }
    
    public static boolean insertcustomer(String name, String email, String phone, String username, String password)
    {
    	boolean isSuccess = false;
    	
        try
        {
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "insert into customer values (0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"')";
        	int res = stmt.executeUpdate(sql);
        	
        	if(res >0)
        	{
        		isSuccess=true;
        	}
        	else
        	{
        		isSuccess=false;
        	}
        }
        catch(Exception e) 
        {
        	e.printStackTrace();
        }
    	
    	return isSuccess;
    }
    
    public static boolean addcustomer(String name, String email, String phone, String username, String password)
    {
    	boolean isSuccess = false;
    	
        try
        {
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "insert into customer values (0,'"+name+"','"+email+"','"+phone+"','"+username+"','"+password+"')";
        	int res = stmt.executeUpdate(sql);
        	
        	if(res >0)
        	{
        		isSuccess=true;
        	}
        	else
        	{
        		isSuccess=false;
        	}
        }
        catch(Exception e) 
        {
        	e.printStackTrace();
        }
    	
    	return isSuccess;
    }
    

    public static boolean updatecustomer(String id, String name, String email, String phone, String username, String password)
    {
    	String url = "jdbc:mysql://localhost:3306/supermarket";
	    String user = "root";
	    String pass ="1234";

	    Connection con = null;
	    PreparedStatement stmt = null;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection(url, user, pass);
	        
	        String query = "UPDATE customer SET name=?, email=?, phone=?, username=?, password=? WHERE id=?";
	        stmt = con.prepareStatement(query);
	        stmt.setString(1, name);
	        stmt.setString(2, email);
	        stmt.setString(3, phone);
	        stmt.setString(4, username);
	        stmt.setString(5, password);
	        stmt.setString(6, id);
	        stmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} finally {
	        try {
	            if (stmt != null) stmt.close();
	            if (con != null) con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return true;
	}
    
    
  
    public static List<Customer> getCustomerDetails(String Id) 
    {	
    	int convertedID = Integer.parseInt(Id);
        ArrayList<Customer> cus = new ArrayList<>();

        try
        {	
        	con = DBConnect.getConnection();
        	stmt = con.createStatement();
        	String sql = "select * from customer where id='"+convertedID+"'";
        	rs = stmt.executeQuery(sql);
        	
        	while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String email = rs.getString(3);
                String phone = rs.getString(4);
                String userU = rs.getString(5);
                String passU = rs.getString(6);
                
                Customer c = new Customer(id, name, email, phone, userU, passU);
                cus.add(c);
        	}
        	
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        return cus;
        }
    
    public static List<Customer> getAllCustomer() {
	    List<Customer> cus = new ArrayList<>();
	   
	    try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
	        String sql = "SELECT * FROM customer";
	        
	        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    int id = resultSet.getInt("id");
	                    String name = resultSet.getString("name");
	                    String email = resultSet.getString("email");
	                    String phone = resultSet.getString("phone");
	                    String userU = resultSet.getString("username");
	                    String passU = resultSet.getString("password");

	                    
	                    cus.add(new Customer(id, name, email, phone, userU, passU));
	                }
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return cus;
	}   
    
    
    public static boolean deletecustomer(int id) {
	    String url = "jdbc:mysql://localhost:3306/supermarket";
	    String user = "root";
	    String pass = "1234";
	    String deleteQuery = "DELETE FROM customer WHERE id = ?";

	    try (PreparedStatement preparedStatement = con.prepareStatement(deleteQuery)) {
	        preparedStatement.setInt(1, id);
	        int rowsAffected = preparedStatement.executeUpdate();

	        return rowsAffected > 0;
	    } catch (SQLException e) {
	        // Log the exception or throw a custom exception
	        e.printStackTrace();
	    } finally {
	        try {
	            con.close();
	        } catch (SQLException e) {
	            // Log the exception or throw a custom exception
	            e.printStackTrace();
	        }
	    }


	    return false; 
	}

}
