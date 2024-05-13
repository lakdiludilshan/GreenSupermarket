package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.customer.CustomerDBUtil;


public class DeleteCusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			int id = Integer.parseInt(request.getParameter("id"));

			
			CustomerDBUtil.deletecustomer(id);
			
		        
		        response.sendRedirect("allcustomers.jsp");
	
	}

}
