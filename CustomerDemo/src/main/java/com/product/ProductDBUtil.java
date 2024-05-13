package com.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.product.Product;

import jakarta.servlet.http.Part;

public class ProductDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean  insertproduct(String title, String description, String category, String price, String stock, String image) {
		
		boolean isSuccess =  false;
		
		try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "INSERT INTO product (title , description , category , price , stock, image)" +
		             "VALUES ('" + title + "', '" + description + "','" + category + "', '" + price + "','"+ stock +"','"+ image +"')";
			int rs = stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		}  
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
			
		}
	
	public static List<Product> getAllProducts() {
	    List<Product> pro = new ArrayList<>();
	    
	    try {
	    	con = DBConnect.getConnection();
	    	
	        String sql = "SELECT * FROM product";
	        
	        try (PreparedStatement preparedStatement = con.prepareStatement(sql)) {
	            try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                while (resultSet.next()) {
	                    int pid = resultSet.getInt("pid");
	                    String title = resultSet.getString("title");
	                    String description = resultSet.getString("description");
	                    String category = resultSet.getString("category");
	                    String price = resultSet.getString("price");
	                    String stock = resultSet.getString("stock");
	                    String image = resultSet.getString("image");

	                    
	                    pro.add(new Product(pid, title, description, category, price, stock, image));
	                }
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return pro;
	}
	
	
	public static boolean updateproduct(String pid, String title, String description, String category, String price, String stock) {
		
		String url = "jdbc:mysql://localhost:3306/supermarket";
	    String user = "root";
	    String pass ="1234";

	    Connection con = null;
	    PreparedStatement stmt = null;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        con = DriverManager.getConnection(url, user, pass);
	        
	        String query = "UPDATE product SET title=?, description=?, category=?, price=?, stock=? WHERE pid=?";
	        stmt = con.prepareStatement(query);
	        stmt.setString(1, title);
	        stmt.setString(2, description);
	        stmt.setString(3, category);
	        stmt.setString(4, price);
	        stmt.setString(5, stock);
	        stmt.setString(6, pid);
	        stmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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

	public static boolean deleteproduct(int pid) {
	    String url = "jdbc:mysql://localhost:3306/supermarket";
	    String user = "root";
	    String pass = "1234";

	    try (Connection con = DriverManager.getConnection(url, user, pass)) {
	       
	        String deleteQuery = "DELETE FROM product WHERE pid = ?";

	        try (PreparedStatement preparedStatement = con.prepareStatement(deleteQuery)) {
	            preparedStatement.setInt(1, pid);
	            int rowsAffected = preparedStatement.executeUpdate();

	            return rowsAffected > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}

}
