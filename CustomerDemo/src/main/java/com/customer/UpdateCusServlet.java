 package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UpdateCusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email"); 
		String phone = request.getParameter("phone"); 
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
boolean isTrue;
		
		isTrue = CustomerDBUtil.updatecustomer(id,name,email,phone,username,password);
		
		if(isTrue == true) {
	        response.sendRedirect("allcustomers.jsp");

		} 
		
	}

}
