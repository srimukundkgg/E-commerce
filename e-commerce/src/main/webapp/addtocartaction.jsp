<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="example.ConnectDB"%>
<%@page import="java.sql.*"%>    

<%
	String email=(String)session.getAttribute("email");
	String id=request.getParameter("id");
	String name="",availability="";
	int price=0,totalprice=0,quantity=1,flag=0,i=0;
	try{
		Connection connection=ConnectDB.getCon();
		Statement statement=connection.createStatement();
		ResultSet resultset=statement.executeQuery("select * from product where id='"+id+"'");
		if(resultset.next()){
		price=resultset.getInt(3);
		name=resultset.getString(2);
			availability=resultset.getString(4);
			totalprice=price;	
		}	
		if(availability.equals("No")){
			response.sendRedirect("productsignin.jsp?message=invalid");
			flag=2;
		}
		ResultSet resultset2=statement.executeQuery("select * from cart where id='"+id+"' and email='"+email+"'");
		if(resultset2.next()){
			totalprice+=resultset2.getInt(6);
			quantity=resultset2.getInt(4);
			quantity+=1;
			flag=1;
		}
		if(flag==1){
			statement.executeUpdate("update cart set totalprice='"+totalprice+"',quantity='"+quantity+"' where id='"+id+"' and email='"+email+"'");
			response.sendRedirect("productsignin.jsp?message=success");
		}
		else if(flag==0){
			PreparedStatement preparedstatement=connection.prepareStatement("insert into cart(email,id,name,quantity,price,totalprice) values(?,?,?,?,?,?)");
			preparedstatement.setString(1,email);
			preparedstatement.setString(2,id);
			preparedstatement.setString(3,name);
			preparedstatement.setInt(4,quantity);
			preparedstatement.setInt(5,price);
			preparedstatement.setInt(6,totalprice);
			preparedstatement.executeUpdate();
			response.sendRedirect("productsignin.jsp?message=success");
		}
	}
	catch(Exception e){
		System.out.println(e);
		
	}
%>