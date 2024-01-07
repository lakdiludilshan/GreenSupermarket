<%@ page import="java.util.List" %>
<%@ page import="com.order.Order" %>
<%@ page import="com.order.OrderDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Order List</title>
</head>
<body>

<%@ include file="adminheader.jsp" %>

<br>


    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Order List
                        <a href="#" class="btn btn-primary float-end">Orders</a>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Oder ID</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>Stock Ordered</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<Order> pre = OrderDBUtil.getAllOrders();
                            if (!pre.isEmpty()) {
                                for (Order pros : pre) {
                                    int oid = pros.getOid();
                                    String title = pros.getTitle();
                                    String des = pros.getDescription();
                                    String price = pros.getPrice();
                                    String stockb = pros.getStockb();
                                   
                            %>
                            <tr>
                                <td><%= oid %></td>
                                <td><%= title %></td>
                                <td><%= des %></td>
                                <td><%= price %></td>
                                <td><%= stockb %></td>
                                <td>
                                    <div class="buttons">
                                        <form action="cancelord" method="POST" class="d-inline">
                                            <input type="hidden" name="oid" value="<%= pros.getOid() %>">
                                            <button type="submit" name="cancel" value="<%= pros.getOid() %>" class="btn btn-danger">Cancel</button>
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