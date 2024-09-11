<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link> 
<title>Login</title>
<meta charset="UTF-8"> 
</head>
<body>
	<div id="container">
		<div class="Signup">
		<form action="loginAction.jsp" method="post">
		<input type ="email" name="email" placeholder="Nhập email" required>
		<input type ="password" name="password"  placeholder="Nhập mật khẩu" required>
		<input type ="submit" name="Đăng nhập">
		</form>
		<h2>
		<a href="Signup.jsp">Đăng ký</a>
		</h2>
		<h2>
		<a href="forgotPassword.jsp">Quên mật khẩu</a>
		</h2>
		</div>
	<div class="whysignLogin">
	<%
	// nhận dữ liệu từ url
		String msg = request.getParameter("msg");
		if("noexist".equals(msg))
		{
	%>
			<h2>Đăng nhập thành công</h2>
	<%}%>
	
	<%
		if("invalid".equals(msg))
		{
	%>
			<h2>Lỗi đăng nhập</h2>
	<%}%>
	</div>
	</div>

</body>
</html>