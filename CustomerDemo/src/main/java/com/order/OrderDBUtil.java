package com.order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.order.DBConnect;
import com.order.Order;

import jakarta.servlet.http.Part;

public class OrderDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
    
    public static List<Order> getAllOrders() {
	    List<Order> pre = new ArrayList<>();
	    
	    try {
        	con = DBConnect.getConnection();
        	
        	String sql = "SELECT * FROM `order`";

	        
	        try (Connection con = DBConnect.getConnection();
	        	     PreparedStatement preparedStatement = con.prepareStatement(sql);
	        	     ResultSet resultSet = preparedStatement.executeQuery()) {
	           
	                while (resultSet.next()) {
	                    int oid = resultSet.getInt("oid");
	                    String title = resultSet.getString("title");
	                    String description = resultSet.getString("description");
	                    String price = resultSet.getString("price");
	                    String stockb = resultSet.getString("stockb");

	                    
	                    pre.add(new Order(oid, title, description, price, stockb));
	                
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return pre;
	}
    
    public static boolean cancelOrder(int oid) {
        String url = "jdbc:mysql://localhost:3306/supermarket";
        String user = "root";
        String pass = "1234";

        try (Connection con = DriverManager.getConnection(url, user, pass)) {
            String deleteQuery = "DELETE FROM `order` WHERE oid = ?";

            try (PreparedStatement preparedStatement = con.prepareStatement(deleteQuery)) {
                preparedStatement.setInt(1, oid);
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
