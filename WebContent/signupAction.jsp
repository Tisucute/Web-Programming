<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vn.iotstar.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8"); // Hiển thị tiếng Việt trong java
// Nhân dữ liệu truyền từ form bằng form
	String name = request.getParameter("name"); 
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String address = " ";
	String city = " ";
	String state = " ";
	String country = " ";
	
	try{
		Connection con = ConnectionProvider.getConn();
		String sql = "INSERT INTO users VALUES (?,?,?,?,?,?,?,?);";
		PreparedStatement ps = con.prepareStatement(sql); //Thực thi truy vấn có tham số
		//Chỉ định các cột của table user theo thứ tự
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		ps.setString(4,phone);
		ps.setString(5,address);
		ps.setString(6,city);
		ps.setString(7,state);
		ps.setString(8,country);
		// thực thi PSI
		ps.executeUpdate();
		response.sendRedirect("Signup.jsp?msg=done"); //Request thông qua url
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("Signup.jsp?msg=invalid"); //Request thông qua url
	}
	
%>