<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Customer</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

 <%@ include file="adminheader.jsp" %>

<br>
    <div class="container mt-5">


        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Add New Customer
                            <a href="allcustomers.jsp" class="btn btn-danger float-end">BACK</a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="addcustomer" method="POST">

                            <div class="mb-3">
                                <label>Name</label>
                                <input type="text" name="name" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                <label>Email Address</label>
                                <input type="email" name="email" class="form-control" >
                            </div>
                            
                            <div class="mb-3">
                                <label>Phone Number</label>
                                <input type="text" name="phno" class="form-control">
                            </div>
                            
                             <div class="mb-3">
                                <label>User Name</label>
                                <input type="text" name="uname" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                <label>Password</label>
                                <input type="password" name="psw" class="form-control">
                            </div>
                            
                            <div class="mb-3">
                                <button type="submit" name="submitUser" class="btn btn-primary">Submit Customer</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>