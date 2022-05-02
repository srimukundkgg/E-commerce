<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<% 
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	if("suryap".equals(name) && "Actorsurya1".equals(password)){
		session.setAttribute("name",name);
		response.sendRedirect("productadd.jsp");
	}
	else{
		int flag=0;
		try{
			Connection connection=ConnectDB.getCon();
			Statement statement=connection.createStatement();
			ResultSet resultset=statement.executeQuery("select * from mukund where name='"+name+"' and password='"+password+"'");
			while(resultset.next()){
				session.setAttribute("name",name);
				response.sendRedirect("home.jsp");
				flag++;
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