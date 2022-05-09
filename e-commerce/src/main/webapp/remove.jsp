<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String email=(String)session.getAttribute("email");
	String id=request.getParameter("id");
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		statement.executeUpdate("delete from cart where email='"+email+"' and id='"+id+"'");
		response.sendRedirect("cart.jsp?message=removed");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>