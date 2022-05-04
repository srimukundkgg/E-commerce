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
		PreparedStatement preparedstmt=connection.prepareStatement("insert into product values(?,?,?,?)");
		preparedstmt.setString(1,id);
		preparedstmt.setString(2,name);
		preparedstmt.setString(3,price);
		preparedstmt.setString(4,availability);
		preparedstmt.executeUpdate();
		response.sendRedirect("productadd.jsp?message=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("productadd.jsp?message=invalid");
	}
%>	