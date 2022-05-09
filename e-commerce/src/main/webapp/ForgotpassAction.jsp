<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String email=request.getParameter("email");
	String newpass=request.getParameter("newpass");
	int flag=0;
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		ResultSet resultset=statement.executeQuery("select * from mukund where email='"+email+"'");
		while(resultset.next()){
			flag=1;
			statement.executeUpdate("update mukund set password='"+newpass+"' where email='"+email+"'");
			response.sendRedirect("Forgotpass.jsp?message=done");
		}
		if(flag==0){
			response.sendRedirect("Forgotpass.jsp?message=invalid");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>