<%@ page import="java.util.List" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.product.ProductDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<title>GS Dashboard</title>
<style>
    #customCard {
        max-width: 250px;
        max-height: 350px;
    }
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="Images/1.jpg" alt="Image 1" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="Images/2.jpg" alt="Image 2" class="d-block w-100">
        </div>
        <div class="carousel-item">
            <img src="Images/3.jpg" alt="Image 3" class="d-block w-100">
        </div>
    </div>

    <!-- Controls -->
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container text-center">
    <h1 class="display-4 font-weight-bold mt-5">WELCOME TO STORE</h1>
    <p class="lead">
        One-stop-shop for all your medicinal and grocery needs. Conveniently order high-quality products directly acquired from authorized dealers and suppliers.
    </p> 
    <br>
    <a href="products.jsp" class="btn btn-primary" style="font-size: 24px; padding: 16px 32px;">Shop Now</a>
        
    
</div>
<br>
<br>

<div class="container">
    <h1>Featured List</h1>
    <br>
    <br>
<div class="row row-cols-4">
        <div class="col">
            <div id="customCard" class="card mb-4">
                <div class="card-body">
                    <img alt="" class="mb-2" src="Images/choco.jpg" width="200px" height="200px">
                    <h5 class="card-title">
                        <a href="your-target-page.html" style="color: black; text-decoration: none;">
                            Choco-Mo
                        </a>
                    </h5>
                    <h6 class="card-subtitle mb-2 " style="color:#f85606">LKR 180</h6>
                    <p class="card-text">Stock: 12</p>
                </div>
            </div>
        </div>
       
    

        <div class="col">
            <div id="customCard" class="card mb-4">
                <div class="card-body">
                    <img alt="" class="mb-2" src="Images/stella.jpg" width="200px" height="200px">
                    <h5 class="card-title">
                        <a href="your-target-page.html" style="color: black; text-decoration: none;">
                            Stella Noodles
                        </a>
                    </h5>
                    <h6 class="card-subtitle mb-2 " style="color:#f85606">LKR 170</h6>
                    <p class="card-text">Stock: 12</p>
                </div>
            </div>
        </div>
        
         <div class="col">
            <div id="customCard" class="card mb-4">
                <div class="card-body">
                    <img alt="" class="mb-2" src="Images/mariee.webp" width="200px" height="200px">
                    <h5 class="card-title">
                        <a href="your-target-page.html" style="color: black; text-decoration: none;">
                            Marie Biscuit
                        </a>
                    </h5>
                    <h6 class="card-subtitle mb-2 " style="color:#f85606">LKR 130</h6>
                    <p class="card-text">Stock: 35</p>
                </div>
            </div>
        </div>
        
        <div class="col">
            <div id="customCard" class="card mb-4">
                <div class="card-body">
                    <img alt="" class="mb-2" src="Images/maliban.jpg" width="200px" height="200px">
                    <h5 class="card-title">
                        <a href="your-target-page.html" style="color: black; text-decoration: none;">
                            Maliban Malt
                        </a>
                    </h5>
                    <h6 class="card-subtitle mb-2 " style="color:#f85606">LKR 360</h6>
                    <p class="card-text">Stock: 54</p>
                </div>
            </div>
        </div>
       
    
    </div>
</div>
<br>
<br>

<div class="container">
    <h1>Recently Added</h1>
    <br>
    <br>
<div class="row">
        <%
            List<Product> pro = ProductDBUtil.getAllProducts();
            if (!pro.isEmpty()) {
                int count = 0;
                for (Product pros : pro) {
                    if (count < 6) { 
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
                    <h6 class="card-subtitle mb-2 " style="color:#f85606">LKR <%=pros.getPrice()%></h6>
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
        <%
            count++;
                    }
                }
        }
        %>
    </div>
</div>

<br>
<br>

<%@ include file="footer.jsp" %>


</body>
</html>