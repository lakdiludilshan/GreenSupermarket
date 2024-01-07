<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Add Products</title>
</head>
<body>

<%@ include file="adminheader.jsp" %>

<br>
    <div class="container mt-5">


        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>New Product 
                            <a href="productlist.jsp" class="btn btn-danger float-end">BACK</a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="addproduct" method="post">

                            <div class="mb-3">
                                <label><b>Product Title</b></label>
                                <input type="text" name="title" class="form-control" placeholder="Enter Product Title">
                            </div>
                            <div class="mb-3">
                                <label>Product Description</label>
                                <textarea class="form-control" name="description" placeholder="Describe the Product in detail" rows="4" cols="50"></textarea>
                            </div>
                            <div class="mb-3">
                                <label>Category</label>
                                <input type="text" name="category" class="form-control" placeholder="Enter Category">
                            </div>
                            <div class="mb-3">
                                <label><b>Price</b></label>
                                <input type="number" name="price" class="form-control" placeholder="Enter The Price">
                            </div>
                            <div class="mb-3">
                                <label>Stock</label>
                                <input type="number" name="stock" class="form-control" placeholder="Enter Stock amount">
                            </div>
                            <div class="mb-3">
                                <label>Image</label>
                                <input type="text" name="image" class="form-control" placeholder="Enter Image Name">
                            </div>
                            <div class="mb-3">
                                <button type="submit" name="submit" class="btn btn-primary">Save Product</button>
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