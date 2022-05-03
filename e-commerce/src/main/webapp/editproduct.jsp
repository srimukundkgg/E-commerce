<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product</title>
</head>
<body>
	<% 
		String id=request.getParameter("id");
		try{
			Connection connection=ConnectDB.getCon();
			Statement statement=connection.createStatement();
			ResultSet resultset=statement.executeQuery("select * from product where id='"+id+"'");
			while(resultset.next()){
	%>
	<form action="editproductaction.jsp" method="post">
	<div class="content">
	<div class="container">
			<h3>Enter ID</h3>	
			<input class="input" type="text" name="id" value="<%=resultset.getString(1)%>" required><br><br>
			<h3>Enter Name</h3>
			<input class="input" type="text" name="name" value="<%=resultset.getString(2)%>" required><br><br>
            <h3>Enter Price</h3>
            <input class="input" type="text" name="price" value="<%=resultset.getString(3)%>" required><br><br>
            <h3>Availability</h3>
           		<select class="input" name="availability">
           		<option value="Yes">Yes</option>
           		<option value="No">No</option>
           		</select><br><br>
		<button class="button">Save</button>
	</div>
	</div>
</form>		
<% 		
	}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>

</body>
</html>
