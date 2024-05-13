<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
	<link rel="stylesheet" href="CSS/style.css">
</head>
<body>

<p>
<div id="container">
<h1>Sign Up</h1>
<br>
<form action="insert" method="post">
		<label for="firstname">Name:</label>
		<input type="text" name="name"><br>
		
		<label for="email">Email Address:</label>
		<input type="text" name="email"><br>
		
		<label for="phone">Phone Number:</label>
		<input type="text" name="phno"><br>
		
		<label for="username">Username:</label>
		<input type="text" name="uname"><br>
		
		<label for="password">Password:</label>
		<input type="text" name="psw"><br>
		
		<input type="submit" name="submit" value="Sign Up">
	</form>
	 <div class="login-link"> 
        <p align="center"> Already have an account? <a href="login.jsp">Login</a></p>
     </div>
</div>
</p>

	
        

</body>
</html>