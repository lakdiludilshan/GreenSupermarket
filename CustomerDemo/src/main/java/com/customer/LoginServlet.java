package com.customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	PrintWriter out = response.getWriter();
    	response.setContentType("text/html");
    	
    	String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isTrue;
        
        isTrue = CustomerDBUtil.validate(username,password);
        
        if(isTrue == true) {
        	RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
            dis.forward(request, response);
        }
        else if ("admin".equals(username) && "admin".equals(password)) {
        	RequestDispatcher dis = request.getRequestDispatcher("allcustomers.jsp");
            dis.forward(request, response);
        }
        else {
        	out.println("<script type='text/javascript'>");
        	out.println("alert('Your username or password is incorrect');");
        	out.println("location='login.jsp'");
        	out.println("</script>");
        }   
    }
}
