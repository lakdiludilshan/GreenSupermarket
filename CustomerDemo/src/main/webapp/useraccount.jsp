<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hotel</title>
</head>
<body>

    <table border="1">
    <c:forEach var="cus" items="${cusDetails}">
    
    
    <c:set var="id" value="${cus.id}"/>
    <c:set var="name" value="${cus.name}"/>
    <c:set var="email" value="${cus.email}"/>    
    <c:set var="phone" value="${cus.phone}"/>
    <c:set var="username" value="${cus.username}"/>
    <c:set var="password" value="${cus.password}"/>
    
        	<tr>
            	<td>CustomerID</td>
            	<td>${cus.id}</td>
            </tr>
            <tr>
            	<td>Name</td>
            	<td>${cus.name}</td>
            </tr>
            <tr>
            	<td>Email</td>
            	<td>${cus.email}</td>
            </tr>
            <tr>
            	<td>Phone</td>
            	<td>${cus.phone}</td>
            </tr>
            <tr>
            	<td>UserName</td>
            	<td>${cus.username}</td>
            </tr>
            <tr>
            	<td>Password</td>
            	<td>${cus.password}</td>
            </tr>
      
        </c:forEach>
    </table>
    
    <c:url value="updatecustomer.jsp" var="cusupdate">
    
    	<c:param name="id" value="${id}"/>				//this area will call in updatecustomer.jsp page %>
    	<c:param name="name" value="${name}"/>		//update info
    	<c:param name="email" value="${email}"/>
    	<c:param name="phone" value="${phone}"/>
    	<c:param name="uname" value="${username}"/>
    	<c:param name="pass" value="${password}"/>
    
    </c:url>
    <br>
   <a href="${cusupdate}"><input type="button" name="update" value="Update Info"></a>
   
    <c:url value="deletecustomer.jsp" var="cusdelete">
    
    	<c:param name="id" value="${id}"/>				//this area will call in updatecustomer.jsp page %>
    	<c:param name="name" value="${name}"/>		//update info
    	<c:param name="email" value="${email}"/>
    	<c:param name="phone" value="${phone}"/>
    	<c:param name="uname" value="${username}"/>
    	<c:param name="pass" value="${password}"/>
    
    </c:url>
   
   <a href="${cusdelete}"><input type="button" name="delete" value="Delete Info"></a>
   
   
</body>
</html>

