<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	if("suryap@gmail.com".equals(email) && "Actorsurya1".equals(password)){
		session.setAttribute("email",email);
		response.sendRedirect("productadd.jsp");
	}
	else{
		int flag=0;
		try{
			Connection connection=ConnectDB.getCon();
			Statement statement=connection.createStatement();
			ResultSet resultset=statement.executeQuery("select * from mukund where email='"+email+"' and password='"+password+"'");
			if(resultset.next()){
				session.setAttribute("email",email);
				response.sendRedirect("productsignin.jsp");
				flag=1;
			}
			if(flag==0){
				response.sendRedirect("Signin.jsp?message=invalid");
			}
		}
		catch(Exception e){
			System.out.println(e);
		}
	}
%>