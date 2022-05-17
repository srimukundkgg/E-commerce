<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>

<% 
	String comments=request.getParameter("comments");
	String email=(String)session.getAttribute("email");
	String id=request.getParameter("id");
	String rt=request.getParameter("rating");
	int rating=Integer.parseInt(rt);
	try{
		Connection connection=ConnectDB.getCon();
		PreparedStatement prepstmt=connection.prepareStatement("insert into comment values(?,?,?,?)");
		prepstmt.setString(1,id);
		prepstmt.setString(2,email);
		prepstmt.setString(3,comments);
		prepstmt.setInt(4,rating);
		prepstmt.executeUpdate();
		response.sendRedirect("comments.jsp?id="+id);
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("comments.jsp?message=invalid");
	}
	%>