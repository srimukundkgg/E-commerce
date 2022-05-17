<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String comments=request.getParameter("comments");
	String email=(String)session.getAttribute("email");
	String id="";
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		ResultSet resultset=statement.executeQuery("select id from comment where comments='"+comments+"' and email='"+email+"'");
		if(resultset.next())
			id=resultset.getString(1);
		 statement.executeUpdate("delete from comment where comments='"+comments+"' and email='"+email+"'");
		response.sendRedirect("comments.jsp?id="+id);
	}
	catch(Exception e){
		System.out.println(e);
	}
%>	