<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goshop</title>
<link rel="stylesheet" href="./homestyle.css">
<link rel="stylesheet" href="./style.css">
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
<div class="account-page">
        <div class="container">
            <div class="row">
               <div class="col-1">
                    <div class="form-container">
                        <div class="form-btn">
                        <form id="RegForm" action="SigninAction.jsp" method="post">
                        	<span onclick="Login()"></span>
                        	<br><h2>Login</h2><br>
                            <input type="text" name="name" placeholder="Username"><br><br>
                            <input type="password" name="password" placeholder="Password"><br><br>
                            <button class="btn">Login</button><br><br>
                            <a href="./Register.jsp">Register</a><br><br>
                            <a href="./Forgotpass.jsp">Forgot Password</a><br><br>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div> 	
    </div>
<div>
<%
	String message=request.getParameter("message");
	if("notexist".equals(message)){%>
		<center><h2>Incorrect Username or password</h2></center><br>	
<% 	} %>
<% 
	if("invalid".equals(message)){%>
		<center><h2>Something went wrong! Try again</h2></center><br>
<% } %>	
</div>    
<div class="footer">
        <div class="container">
            <div class="row">
                <div class="footer-col-1">
                    <h3>Download Our App</h3>
                    <a href="./home.jsp">Download App for Android and Ios mobile phone</a>
                </div>
                <div class="footer-col-2">
                    <img src="logo.jpeg" width="125px">
                    <p>Our Purpose Is To Sustainably Make the pleasure Android
                    Benefits of Sports Accessible to the Many.</p>
                </div>
                <div class="footer-col-3">
                    <h3>Useful Links</h3>
                    <ul>
                        <li>Coupons</li>
                        <li>Blog post</li>
                        <li>Return Policy</li>
                        <li>Join Affiliates</li>
                    </ul>
                </div>
                <div class="footer-col-4">
                    <h3>Follow Us</h3>
                    <ul>
                        <li>Facebook</li>
                        <li>Twitter</li>
                        <li>Instagram</li>
                        <li>YouTube</li>
                    </ul>
                </div>
            </div>
            <hr>
            <p class="copyright"> Copyright 2021 - Goshop</p>
        </div>
    </div>
</body>
</html>