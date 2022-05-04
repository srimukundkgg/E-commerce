<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goshop products</title>
<link rel="stylesheet" href="./homestyle.css">
</head>
<body>
	<div class="header">    
    <div class="container">
        <div class="navbar">
           <div class="logo">
               <a href="./home.jsp"><img src="logo.jpeg" width="125px"></a>
           </div>
        <nav>
            <ul id="MenuItems">
                <li><a href="./home.jsp">Home</a></li>
                <li><a href="productview.jsp">Products</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact</a></li>
                <li><a href="./Signin.jsp">Account</a></li>
            </ul>
        </nav>    
    </div>
    </div>
    </div>
    <br><br><center><h2>Our products</h2></center><br><br>
		<center><table>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col">Availability</th>	
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