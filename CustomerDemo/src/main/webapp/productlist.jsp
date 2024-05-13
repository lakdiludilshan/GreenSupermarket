<%@ page import="java.util.List" %>
<%@ page import="com.product.Product" %>
<%@ page import="com.product.ProductDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Product List</title>
</head>
<body>

<%@ include file="adminheader.jsp" %>

<br>


    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Product List
                        <a href="addproduct.jsp" class="btn btn-primary float-end">Add Product</a>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Category</th>
                                <th>Price</th>
                                <th>Stock</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<Product> pro = ProductDBUtil.getAllProducts();
                            if (!pro.isEmpty()) {
                                for (Product pros : pro) {
                                    int pid = pros.getPid();
                                    String title = pros.getTitle();
                                    String des = pros.getDescription();
                                    String category = pros.getCategory();
                                    String price = pros.getPrice();
                                    String stock = pros.getStock();
                                   
                            %>
                            <tr>
                                <td><%= pid %></td>
                                <td><%= title %></td>
                                <td><%= des %></td>
                                <td><%= category %></td>
                                <td><%= price %></td>
                                <td><%= stock %></td>
                                <td>
                                    <div class="buttons">
                                        <a href="updateproduct.jsp?pid=<%= pros.getPid() %>" class="btn btn-primary">Edit</a>
                                        <form action="deletepro" method="POST" class="d-inline">
                                            <input type="hidden" name="pid" value="<%= pros.getPid() %>">
                                            <button type="submit" name="deleted" value="<%= pros.getPid() %>" class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">No Product details found.</td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>