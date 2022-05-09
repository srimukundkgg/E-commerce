<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
	<div id="container">
		<div class="signup">
		<form action="ForgotpassAction.jsp" method="post">
			<input type="email" name="email" placeholder="Enter email" required>
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
		<a href="./home.jsp"><button>Home</button></a>
	<% } %>		
</body>
</html>