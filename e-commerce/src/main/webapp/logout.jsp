<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	try{	
		session.invalidate();
		response.sendRedirect("Signin.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>