<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	try{	
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
	String email=(String)session.getAttribute("email");
	response.sendRedirect("Signin.jsp");
	}	
	catch(Exception e){
		System.out.println(e);
	}
%>