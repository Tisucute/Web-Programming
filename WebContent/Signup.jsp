<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// nhận dữ liệu từ url
		String msg = request.getParameter("msg");
		if("done".equals(msg))
		{
	%>
			<h2>Đăng ký thành công</h2>
	<%}%>
	
	<%
		if("invalid".equals(msg))
		{
	%>
			<h2>Đăng ký không thành công</h2>
	<%}%>
	
	

	<form action="signupAction.jsp" method = "post">
	<input type ="text" name="name" id="name" placeholder="Nhập họ tên" required>
	<input type ="email" name="email" id="email" placeholder="Nhập email" required>
	<input type ="password" name="password" id="password" placeholder="Nhập mật khẩu" required>
	<input type ="number" name="phone" id="phone" placeholder="Nhập số điện thoại" required>
	<input type ="submit" value="Đăng ký">
	</form>
	<br/>
	<h2><a href = "login.jsp"> Đăng nhập </a></h2>
	
</body>
</html>