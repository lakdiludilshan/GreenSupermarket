package com.order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.order.OrderDBUtil;

public class OrderCancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oid = Integer.parseInt(request.getParameter("oid"));
		
		   OrderDBUtil.cancelOrder(oid);

	        response.sendRedirect("orderlist.jsp");
	}

}
