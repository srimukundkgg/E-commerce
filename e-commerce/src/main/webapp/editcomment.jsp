<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Comments and ratings</title>
<link rel="stylesheet" href="./product.css">
</head>
<body>
	<div class="head">    
    <div class="container">
        <div class="navbar">
           <div class="logo">
               <a href="./home.jsp"><img src="logo.jpeg" width="125px"></a>
           </div>
        <nav>
        <%String email=(String)session.getAttribute("email");
         %>
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
    </div><br>
	<% 
		String id="";
		String comments=request.getParameter("comments");
		try{
			Connection connection=ConnectDB.getCon();
			Statement statement=connection.createStatement();
			ResultSet resultset=statement.executeQuery("select id from comment where comments='"+comments+"' and email='"+email+"'");
			if(resultset.next())
				id=resultset.getString(1);
			ResultSet resultset2=statement.executeQuery("select * from comment where id='"+id+"' and comments='"+comments+"' and email='"+email+"'");
			if(resultset2.next()){	
	%>
	<form action="editcommentaction.jsp?com=<%=comments%>" method="post">
		<div class="container">
		<center><h2>Edit Comments and Ratings</h2>
			<textarea rows="5" cols="50" name="comments" placeholder="Comment here" required><%=resultset2.getString(3) %></textarea><br><br>
	<label>Rating:  </label>
   <select name="rating">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
	</select><br><br>
  	<input type="submit" value="Submit" name="submit"> 
  	<br><br>
		</div>
	</form></center>
	<% 		
	}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
</body>
</html>