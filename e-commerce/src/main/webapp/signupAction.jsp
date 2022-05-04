<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<%
String name=request.getParameter("name"); 
String email=request.getParameter("email"); 
String password=request.getParameter("password"); 
try{
	Connection connection=ConnectDB.getCon();
	PreparedStatement prepstmt=connection.prepareStatement("insert into mukund values(?,?,?)");
	prepstmt.setString(1,name);
	prepstmt.setString(2,email);
	prepstmt.setString(3,password);
	prepstmt.executeUpdate();
	response.sendRedirect("Signin.jsp");
}
catch(Exception e){
	System.out.print(e);
	response.sendRedirect("Register.jsp?msg=invalid");
}
%>