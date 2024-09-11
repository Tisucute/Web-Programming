<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vn.iotstar.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
try{
	Connection con = ConnectionProvider.getConn();
	Statement st = con.createStatement(); // thực thi truy vấn không tham số
	//String q1 = "create table product(id int, name varchar(100), category varchar(200),price int, active char(100))";
	String q1 = "create table users(name varchar(100), email varchar(100) primary key, phone bigint, password varchar(100), address varchar(500), city varchar(100),state varchar(100), country varchar(100))";
	System.out.println(q1);
	st.execute(q1);
	System.out.println("Bảng đã được tạo");
	con.close();
	
}catch(Exception e){
	System.out.println(e);
	
}
%>