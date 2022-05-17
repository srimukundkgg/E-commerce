<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String price=request.getParameter("price");
	String availability=request.getParameter("availability");
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		statement.executeUpdate("update product set name='"+name+"',price='"+price+"',availability='"+availability+"' where id='"+id+"'");
		
		response.sendRedirect("productaddedit.jsp?message=done");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("productaddedit.jsp?message=invalid");
	}
%>