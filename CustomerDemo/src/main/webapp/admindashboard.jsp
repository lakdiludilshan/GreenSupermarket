<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="adminheader.jsp" %>
<br>
<br>
<form action="allcustomers.jsp" method="post">
<button type="button" class="btn btn-primary btn-lg">Customers</button>
</form>
<br>
<form action="productlist.jsp" method="post">
<button type="button" class="btn btn-primary btn-lg">Products</button>
</form>
<br>
<form action="orderlist.jsp" method="post">
<button type="button" class="btn btn-primary btn-lg">Orders</button>
</form>


<br>

</body>
</html>