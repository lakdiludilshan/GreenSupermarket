<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Details</title>
</head>
<body>

	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");  //called from useraccount.jsp
	String phone = request.getParameter("phone");
	String username = request.getParameter("uname");
	String password = request.getParameter("pass");
	%>
	
	<h2>Customer Account Deletion</h2>
	
	<form action="delete" method="post">
		Customer ID<input type="text" name="cusid" value="<%=id%>" readonly><br>
		Name <input type="text" name="name" value="<%=name%>" readonly><br>
		Email <input type="text" name="email" value="<%=email%>" readonly><br>
		Phone No <input type="text" name="phno" value="<%=phone%>" readonly><br>
		UserName <input type="text" name="uname" value="<%=username%>" readonly><br>
		
		
		<input type="submit" name="submit" value="Delete Customer">
	</form>


</body>
</html>