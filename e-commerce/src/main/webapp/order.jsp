<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order details</title>
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
        <%String email=(String)session.getAttribute("email");%>
            <ul id="MenuItems">
            	<li><a href=""><%out.println(email); %></a></li>
                <li><a href="productsignin.jsp">Products</a></li>
                <li><a href="">About</a></li>
                <li><a href="">Contact</a></li>
         		<li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>    
        <a href="./cart.jsp">
        <img src="./cart.png" width="30px" height="30px">
        </a>
         </div>
    </div>
    </div>
    <form action="orderaction.jsp" method="post">
    <center><div class="details">
    <br><h2>Order Details</h2><br><br>
   	<input type="text" name="username" placeholder="Name" required><br><br>
   	<input type="number" name="phoneno" placeholder="phone number"  required><br><br>
   	<textarea name="address" placeholder="Address" required></textarea><br><br>
   	<input type="text" name="city" placeholder="City" required><br><br>
   	<input type="text" name="state" placeholder="State" required><br><br>
   	<input type="number" name="pincode" placeholder="Pincode" required><br>,<br>
    </div></center>
    <%
    try{
 	Connection connection=ConnectDB.getCon();
	int total=0;
	Statement statement=connection.createStatement();
	ResultSet resultset1=statement.executeQuery("select sum(totalprice) from cart where email='"+email+"'");
	if(resultset1.next()){
		total=resultset1.getInt(1); 
	}
  %>
  <center><h4>Total:<%out.println(total);%></h4><br> 
 <%  }  catch(Exception e){
    	System.out.println(e);
    }
%>
<button>BUY</button><br><br>
</form></body></html>