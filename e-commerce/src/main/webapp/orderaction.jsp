<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>    
<% 
	String email=(String)session.getAttribute("email");
	String username=request.getParameter("username");
	String phone=request.getParameter("phoneno");
	int phoneno=Integer.parseInt(phone);
	String address=request.getParameter("address");
	String city=request.getParameter("city");
	String state=request.getParameter("state");
	String pin=request.getParameter("pincode");
	int pincode=Integer.parseInt(pin);
	Connection connection=ConnectDB.getCon();
	Statement statement=connection.createStatement();
	ResultSet resultset=statement.executeQuery("select * from cart where email='"+email+"'");
	while(resultset.next()){
	PreparedStatement prepstmt=connection.prepareStatement("insert into prodorder values(?,?,?,?,?,?,?,?,?,?,?,?)");
	String id=resultset.getString(1);
	String name=resultset.getString(3);
	int price=resultset.getInt(4);
	int quantity=resultset.getInt(5);
	int total=resultset.getInt(6);
	prepstmt.setString(1,id);
	prepstmt.setString(2,email);
	prepstmt.setString(3,name);
	prepstmt.setInt(4,price);
	prepstmt.setInt(5,quantity);
	prepstmt.setInt(6,total);
	prepstmt.setString(7,username);
	prepstmt.setInt(8,phoneno);
	prepstmt.setString(9,address);
	prepstmt.setString(10,city);
	prepstmt.setString(11,state);
	prepstmt.setInt(12,pincode);
	prepstmt.executeUpdate();
	}
	statement.executeUpdate("delete from cart where email='"+email+"'");
	response.sendRedirect("deleivery.jsp");
%>