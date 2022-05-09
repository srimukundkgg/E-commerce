<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit product</title>
<link rel="stylesheet" href="./product.css">
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
	if("done".equals(message)){ %>
		<center><h2>Successfully updated</h2></center><br>
	<% } %>
<% 
    if("invalid".equals(message)){ %>
    	<center><h2>Something went wrong!</h2></center><br>
    <% } %>			
		<center><h2>Edit products</h2></center><br><br>
		<center><table>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col">Availability</th>
				<th scope="col">Edit</th>		
			</tr>
			<% 
				try{
					Connection connection=ConnectDB.getCon();
					Statement statement=connection.createStatement();
					ResultSet resultset=statement.executeQuery("select * from product order by id asc");
					while(resultset.next()){
			%>
			<tr>
				<td><%=resultset.getString(1) %></td>
				<td><%=resultset.getString(2) %></td>
				<td><%=resultset.getString(3) %></td>
				<td><%=resultset.getString(4) %></td>
				<td><a href="editproduct.jsp?id=<%=resultset.getString(1) %>">Edit</a></td>
			</tr>
			<% }
				}		
				catch(Exception e){
					System.out.println(e);
				}
			%>
	</table></center>	
		
</body>
</html>		