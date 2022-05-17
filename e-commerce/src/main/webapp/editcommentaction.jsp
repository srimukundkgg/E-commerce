<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>

<% 
	String comments=request.getParameter("comments");
	String email=(String)session.getAttribute("email");
	String id="";
	String rt=request.getParameter("rating");
	String com=request.getParameter("com");
	int rating=Integer.parseInt(rt);
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		ResultSet resultset=statement.executeQuery("select id from comment where comments='"+com+"' and email='"+email+"'");
		if(resultset.next())
			id=resultset.getString(1);
		statement.executeUpdate("update comment set comments='"+comments+"',rating='"+rating+"' where id='"+id+"' and comments='"+com+"' and email='"+email+"'");
		response.sendRedirect("comments.jsp?id="+id);
	}
	catch(Exception e){
		System.out.println(e);
	}
%>