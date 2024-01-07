<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="CSS/style.css">
</head>
<body>
	
	<p id="mid">
	<div id="container">
	<h1>Login</h1>
    <form action="login" method="post">
    			<br>
    			<label for="email">User Name:</label>
    			<input type="text" id="username" name="username" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                
                
				<input type="radio" id="user" name="userType" value="user" >  User
				<br>
				<input type="radio" id="admin" name="userType" value="admin" >  Admin
    			<br>
    			<br>
    <input type="submit" name="Submit" value="Login">
    
    <div class="signup-link">
    <p align="center">Don't have an account? <a href="insertcustomer.jsp"> Sign up</a></p>
    </div>
    
    </form>
    </div>
	</p>
	
</body>
</html>
