<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vn.iotstar.connection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8"); // Hiển thị tiếng Việt trong java
// Nhân dữ liệu truyền từ form bằng form
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	int kt=0;
	
	try{
		Connection con = ConnectionProvider.getConn();
		Statement st = con.createStatement();
		String sql = "select * from users where email='"+email+"'and password='"+password+"'";
		ResultSet rs = st.executeQuery(sql);
		while(rs.next())
		{
			kt=1;
			response.sendRedirect("Hello.jsp");
		}
		if(kt==0){
			response.sendRedirect("Login.jsp?msg=noexist");
		}
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("Login.jsp?msg=invalid"); //Request thông qua url
	}
	
%>