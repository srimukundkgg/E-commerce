<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>
<%
try{
	Connection connection=ConnectDB.getCon();
	Statement statement=connection.createStatement();
	String query1="create table mukund(name varchar(100),email varchar(100),password varchar(100),primary key(name))";
	String query2="create table product(id varchar(9),name varchar(100) unique,price varchar(20),availability varchar(100),primary key(id))";
	System.out.print(query1);
	System.out.print(query2);
	//statement.execute(query1);
	statement.execute(query2);
	System.out.print("Table created");
	connection.close();
}
catch(Exception e){
	System.out.print(e);
}
%>
