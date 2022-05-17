<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./product.css">
<meta charset="UTF-8">
<title>Add new product</title>
</head>
<body>
	<div class="header">    
    <div class="container">
        <div class="navbar">
			<nav>
			<ul id="menuitems">
			<li><a href="productadd.jsp">Add New Product </a></li>
            <li><a href="productaddedit.jsp">Edit Products</a></li>
            <li><a href="logout.jsp">Logout</a></li>
            </ul>
            </nav>
            </div>
		</div>
	</div>
<% 
	String message=request.getParameter("message");
	if("valid".equals(message)){ %>
	<h3>Product Added Successfully!</h3>
	<% } %>
<% 
	if("invalid".equals(message)){ %>
	<h3>Something went wrong! Try Again!</h3> 
	<% } %>
	<div class="productadding">
	<form action="productaddAction.jsp" method="post">
	<h2>Enter product details:</h2><br><br>
	<div class="content">
	<div class="container">
			<h3>Enter Product ID</h3>
			<input class="input" type="text" name="id" placeholder="Enter product ID" required><br><br>
			<h3>Enter Name</h3>
			<input class="input" type="text" name="name" placeholder="Enter product name" required><br><br>
            <h3>Enter Price</h3>
            <input class="input" type="text" name="price" placeholder="Enter product price" required><br><br>
            <h3>Availability</h3>
           		<select class="input" name="availability"  required>
           		<option value="Yes">Yes</option>
           		<option value="No">No</option>
           		</select><br><br>
		<button class="button">Save</button>
	</div>
	</div>
	</form>
	</div>
</body>
</html>