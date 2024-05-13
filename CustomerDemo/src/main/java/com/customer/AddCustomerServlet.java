package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phno");
		String username = request.getParameter("uname");
		String password = request.getParameter("psw");
		
		boolean isTrue;
		
		isTrue = CustomerDBUtil.addcustomer(name,email,phone,username,password);
		
		if (isTrue==true)
		{
			RequestDispatcher dis = request.getRequestDispatcher("allcustomers.jsp");
			dis.forward(request, response);
		}
		else
		{
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		doGet(request, response);
	}

}
