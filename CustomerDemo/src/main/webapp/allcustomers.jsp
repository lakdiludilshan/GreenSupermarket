<%@ page import="java.util.List" %>
<%@ page import="com.customer.Customer" %>
<%@ page import="com.customer.CustomerDBUtil" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Customers</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="adminheader.jsp" %>

<br>


    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Customer List
                        <a href="addcustomer.jsp" class="btn btn-primary float-end">Add User</a>
                    </h4>
                </div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>UserName</th>
                                <th>Password</th>
                                
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            List<Customer> cus = CustomerDBUtil.getAllCustomer();
                            if (!cus.isEmpty()) {
                                for (Customer cuss : cus) {
                                    int id = cuss.getId();
                                    String name = cuss.getName();
                                    String email = cuss.getEmail();
                                    String phone = cuss.getPhone();
                                    String username = cuss.getUsername();
                                    String password = cuss.getPassword();
                                    

                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= name %></td>
                                <td><%= email %></td>
                                <td><%= phone %></td>
                                <td><%= username %></td>
                                <td><%= password %></td>
                                
                                <td>
                                    <div class="buttons">
                                    
                                        <form action="delete" method="POST" class="d-inline">
                                            <input type="hidden" name="id" value="<%= cuss.getId() %>">
                                            <button type="submit" name="submitt" value="<%= cuss.getId() %>" class="btn btn-danger">Delete</button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">No customer details found.</td>
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