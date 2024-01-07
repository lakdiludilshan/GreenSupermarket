<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.product.ProductDBUtil" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>

<%@ include file="adminheader.jsp" %>

<br>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Product Edit 
                        <a href="productlist.jsp" class="btn btn-danger float-end">BACK</a>
                    </h4>
                </div>
                <div class="card-body">
                    <%
                    String url = "jdbc:mysql://localhost:3306/supermarket";
                    String user = "root";
                    String pass = "1234";

                    Class.forName("com.mysql.jdbc.Driver");

                    Connection con = DriverManager.getConnection(url, user, pass);

                    String idParameter = request.getParameter("pid");
                    int pid = 0; 

                    if (idParameter != null && !idParameter.isEmpty()) {
                        try {
                            pid = Integer.parseInt(idParameter);
                        } catch (NumberFormatException e) {
                            
                        }
                    }

                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    if (pid > 0) {
                        try {
                            String query = "SELECT * FROM product WHERE pid=?";
                            stmt = con.prepareStatement(query);
                            stmt.setInt(1, pid);
                            rs = stmt.executeQuery();
                            if (rs.next()) {
                                String id = rs.getString("pid");
                                String title = rs.getString("title");
                               	String description = rs.getString("description");
                               	String category = rs.getString("category");
                                String price = rs.getString("price");
                                String stock = rs.getString("stock");
                    %>
                    <form action="updatepro" method="POST">
                        <input type="hidden" name="pid" value="<%= pid %>">
                        <div class="mb-3">
                            <label>Product Title</label>
                            <input type="text" name="title" value="<%= title %>" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Product Description</label>
                            <input type="text" name="description" value="<%= description %>" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Category</label>
                            <input type="text" name="category" value="<%= category %>" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Price</label>
                            <input type="text" name="price" value="<%= price %>" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label>Stock</label>
                            <input type="text" name="stock" value="<%= stock %>" class="form-control">
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary">Update Product</button>
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
                            if (rs != null) rs.close();
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