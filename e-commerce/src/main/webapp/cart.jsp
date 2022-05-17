<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My cart</title>
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
    <br><br><center><h2>My Cart</h2><br><br>
    <table>
    <tr>
    	<th scope="col">S.No</th>
    	<th scope="col">ID</th>
    	<th scope="col">Name</th>
    	<th scope="col">price</th>
    	<th scope="col">Quantity</th>
    	<th scope="col">total</th>
    	<th scope="col">Remove</th>
    </tr>
    <% 
    	try{
 		Connection connection=ConnectDB.getCon();
    	Statement statement=connection.createStatement();
    	ResultSet resultset=statement.executeQuery("select * from cart where email='"+email+"' order by quantity");
    	int sno=0;
    	while(resultset.next()){
    		
    %> 	
    <tr>
    <%sno+=1;%>
    	<td><%out.println(sno);%></td>
    	<td><%=resultset.getString(1)%></td>
    	<td><%=resultset.getString(3)%></td>
    	<td><%=resultset.getInt(5)%></td>
    	<td><%=resultset.getInt(4)%></td>
    	<td><%=resultset.getInt(6)%></td>
    	<td><a href="remove.jsp?id=<%=resultset.getString(1)%>">Remove</a></td>
    </tr>	
    <% 
    	}	
  %>  
   </center></table><br><br>
<% 
	int total=0;
	ResultSet resultset1=statement.executeQuery("select sum(totalprice) from cart where email='"+email+"'");
	if(resultset1.next()){
		total=resultset1.getInt(1); 
	}
%>
<table>
<center><h4>Total:<%out.println(total);%></h4><br>
<a href="order.jsp">Order</a></center><br>
<% 
    	}
    catch(Exception e){
    	System.out.println(e);
    }
%>
<%
	String message=request.getParameter("message");
	if("removed".equals(message)){
		out.println("Product removed Successfully");
	}
%>
</body>
</html>