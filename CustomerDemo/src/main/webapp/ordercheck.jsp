<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.paypal.base.rest.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Out</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>

<%@ include file="header.jsp" %>

<br>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Order Check Out
                        <a href="products.jsp" class="btn btn-primary float-end">BACK</a>
                    </h4>
                </div>
                <div class="card-body">
                    <%
                        String url = "jdbc:mysql://localhost:3306/supermarket";
                        String user = "root";
                        String pass = "1234";

                        Connection con = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection(url, user, pass);

                            String idParameter = request.getParameter("pid");
                            int pid = 0; // Default value or another suitable value

                            if (idParameter != null && !idParameter.isEmpty()) {
                                try {
                                    pid = Integer.parseInt(idParameter);
                                } catch (NumberFormatException e) {
                                    // Handle the case where the parameter is not a valid integer
                                    e.printStackTrace();
                                }
                            }

                            String query = "SELECT * FROM product WHERE pid=?";
                            stmt = con.prepareStatement(query);
                            stmt.setInt(1, pid);
                            rs = stmt.executeQuery();

                            if (rs.next()) {
                                String productId = rs.getString("pid");
                                String productTitle = rs.getString("title");
                                String productDescription = rs.getString("description");
                                String productCategory = rs.getString("category");
                                String productPrice = rs.getString("price");
                                String stock = rs.getString("stock");
                    %>
                    
 <script>
    function executeFunc() {
        var productTitle = '<%=productTitle%>';
        var productDescription = '<%=productDescription%>';
        var productPrice = '<%=productPrice%>';
        var stockb = '1';

        secretFunction1(productTitle, productDescription, productPrice, stockb);
        secretFunction2(productTitle);
    }

    function secretFunction1(productTitle, productDescription, productPrice, stockb) {
        
        
        
        var xhr = new XMLHttpRequest();
        var url = 'order.jsp';

        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        var params = 'productTitle=' + encodeURIComponent(productTitle) +
                     '&productDescription=' + encodeURIComponent(productDescription) +
                     '&productPrice=' + encodeURIComponent(productPrice) +
                     '&stockb=' + encodeURIComponent(stockb);

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                
                console.log(xhr.responseText);
            }
        };

        xhr.send(params);
    }

    function secretFunction2(productTitle) {
       
        window.location.href = 'mail.jsp?productTitle=' + encodeURIComponent(productTitle);
    }
</script>

        
                    
                    <form action="processPayment.jsp" method="post">
                        <input type="hidden" name="productId" value="<%=productId%>">
                        <input type="hidden" name="productTitle" value="<%=productTitle%>">
                        <input type="hidden" name="productDescription" value="<%=productDescription%>">
                        <input type="hidden" name="productCategory" value="<%=productCategory%>">
                        <input type="hidden" name="productPrice" value="<%=productPrice%>">
                        <input type="hidden" name="paymentMethod" value="Paypal">

                        <div class="mb-3">
                            <label><b>Product ID</b></label>
                            <input type="text" class="form-control" value="<%=productId%>" disabled>
                        </div>
                        <div class="mb-3">
                            <label><b>Product Title</b></label>
                            <input type="text" class="form-control" value="<%=productTitle%>" disabled>
                        </div>
                        <div class="mb-3">
                            <label>Product Description</label>
                            <input type="text" class="form-control" value="<%=productDescription%>" disabled>
                        </div>
                        <div class="mb-3">
                            <label>Category</label>
                            <input type="text" class="form-control" value="<%=productCategory%>" disabled>
                        </div>
                        <div class="mb-3">
                            <label><b>Price</b></label>
                            <input type="number" class="form-control" value="<%=productPrice%>" disabled>
                        </div>
                        <div class="mb-3">
                            <label><b>Payment Method</b></label>
                            <input type="text" class="form-control" value="Paypal" disabled>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-danger" onclick="executeFunc()">Purchase Product</button>
                        </div>
                    </form>
                    <%
                            } else {
                    %>
                    <h4>No Such ID Found</h4>
                    <%
                            }
                        } catch (ClassNotFoundException | SQLException e) {
                            e.printStackTrace();
                        } finally {
                        	
                        	
                        	
                        	
                            try {
                            	
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (con != null) con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                            
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
