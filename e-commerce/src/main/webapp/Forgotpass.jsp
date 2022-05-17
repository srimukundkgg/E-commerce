<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
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
	<br><center><h2>Forgot Password</h2><br>	
	<div id="container2">
		<div class="signup">
		<form action="ForgotpassAction.jsp" method="post">
			<input type="email" name="email" placeholder="Enter email" required><br><br>
			<input type="password" name="newpass" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title=" must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" placeholder="Enter new password" required><br><br>
			<input type="submit">
		</form>
		<h2><a href="Signin.jsp"></a></h2>
		</div>
	</div>
<% 
	String message=request.getParameter("message");
	if("done".equals(message)){ %>
		<h1>Password Changed Successfully!</h1>
		<a href="./home.jsp"><button>Home</button></a>
	<% } %>
<% 
	if("invalid".equals(message)){ %>
		<h1>Something went wrong pls try again!</h1>
		<a href="./home.jsp"><button>Home</button></a></center>
	<% } %>		
</body>
</html>