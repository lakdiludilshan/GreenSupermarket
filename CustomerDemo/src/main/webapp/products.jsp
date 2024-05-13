<%@ page import="java.util.List" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.product.ProductDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GM Products</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<br>

<div class="container">
    <h1 class="text-center">Product List</h1>
    <br>
    <br>
    <div class="row">
        <%
            List<Product> pro = ProductDBUtil.getAllProducts();
            if (!pro.isEmpty()) {
                for (Product pros : pro) {
        %>
        <div class="col-sm-4">
            <div class="card mb-4">
                <div class="card-body">
                    <img alt="" class="mb-2" src="Images/<%=pros.getImage()%>" width="200px" height="200px">
                    <h5 class="card-title">
                        <a href="your-target-page.html" style="color: black; text-decoration: none;">
                            <%=pros.getTitle()%>
                        </a>
                    </h5>
                    <h6 class="card-subtitle mb-2 text-muted">LKR <%=pros.getPrice()%></h6>
                    <p class="card-text">Stock: <%=pros.getStock()%></p>
                    <div class="buttons" style="text-align: right">
                                        <form action="ordercheck.jsp?pid=<%= pros.getPid() %>" method="POST" class="d-inline">
                                            <input type="hidden" name="pid" value="<%= pros.getPid() %>">
                                            <button type="submit" name="deleted" value="<%= pros.getPid() %>" class="btn btn-danger">Buy Now</button>
                                        </form>
                                    </div>
                </div>
            </div>
        </div>
        <%-- Remove these extra line breaks <br> <br> --%>
        <%
                }
            } else {
        %>
        <div class="col">
            <p>No Products found.</p>
        </div>
        <%
            }
        %>
    </div>
</div>

<%@ include file="footer.jsp" %>
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</body>
</html>