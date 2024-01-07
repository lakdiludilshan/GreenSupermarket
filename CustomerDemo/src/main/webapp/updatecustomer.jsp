<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.customer.Customer" %>
<%@ page import="com.customer.CustomerDBUtil" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Customer</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>

 <%@ include file="adminheader.jsp" %>

<br>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Update Customer
                            <a href="allcustomers.jsp" class="btn btn-danger float-end">BACK</a>
                        </h4>
                    </div>
                    <div class="card-body">

	<%
	 String url = "jdbc:mysql://localhost:3306/supermarket";
    String user = "root";
    String pass = "1234";

    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection(url, user, pass);

    String idParameter = request.getParameter("id");
    int id = 0; 

    if (idParameter != null && !idParameter.isEmpty()) {
        try {
            id = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            
        }
    }
	
    PreparedStatement stmt = null;
    ResultSet res = null;

    if (id > 0) {
        try {
            String query = "SELECT * FROM customer WHERE id=?";
            stmt = con.prepareStatement(query);
            stmt.setInt(1, id);
            res = stmt.executeQuery();
            if (res.next()) {
    
	String cid = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");  
	String phone = request.getParameter("phone");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	%>

	<form action="update" method="post">
		  <div class="mb-3">
		  
		  						 <label>Customer ID</label>
                                <input type="text" name="id"  class="form-control" value="<%=cid%>" readonly>
                            </div>
                              <div class="mb-3">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control" value="<%=name%>">
                            </div>
                            
                            <div class="mb-3">
                                <label>Email Address</label>
                                <input type="email" name="email" class="form-control" value="<%=email%>">
                            </div>
                            
                            <div class="mb-3">
                                <label>Phone Number</label>
                                <input type="text" name="phno" class="form-control" value="<%=phone%>">
                            </div>
                            
                             <div class="mb-3">
                                <label>User Name</label>
                                <input type="text" name="uname" class="form-control" value="<%=username%>">
                            </div>
                            
                            <div class="mb-3">
                                <label>Password</label>
                                <input type="password" name="psw" class="form-control" value="<%=password%>">
                            </div>
                            
                            <div class="mb-3">
                                <button type="submit" name="submit" class="btn btn-primary">Update Customer</button>
                            </div>
		
	</form>
	 <%
                        } else {
                    %>
                    <h4>No Such ID Found</h4>
                    <%
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (res != null) res.close();
                            if (stmt != null) stmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
                %>
	
	</div>
                </div>
            </div>
              </div>
        
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	
	
</body>
</html>