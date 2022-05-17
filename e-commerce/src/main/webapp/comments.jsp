<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Comments</title>

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
    	String id=request.getParameter("id");
    %>
	<center><h2>Add your Comments and ratings</h2><br><br>
	<form action="commentsaction.jsp?id=<%=id%>" method="post">
	<textarea rows="5" cols="50" name="comments" placeholder="Comment here" required></textarea><br><br>
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
  	<div class="com">
  	<h2>Comments</h2><br><br></center>
  	<% 
  	    try{
  		Connection connection=ConnectDB.getCon();
  		Statement statement=connection.createStatement();
		ResultSet resultset=statement.executeQuery("select * from comment where id='"+id+"'");
		while(resultset.next()){
	 %>	<center> <%	out.println(resultset.getString(2)+" : Rating - " + resultset.getInt(4) + "/5");
		  %></center> 
		  <br>
		 <div class="c"> <p><%out.println(resultset.getString(3)); 
		 if(email.equals(resultset.getString(2))){
		%>	 <a href="editcomment.jsp?comments=<%=resultset.getString(3)%>">Edit</a>
	  			<a href="deletecomment.jsp?comments=<%=resultset.getString(3)%>">Delete</a>
		<%  }	
		 %>
	   </p></div>
		  <br><br>
	<%	  
		}
  	    }
  		catch(Exception e){
  			System.out.println(e);
  		}
  	%>
 </div>
</body>
</html>