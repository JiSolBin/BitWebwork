<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
	<jsp:setProperty property="result" name="login" value="false"/>
	<jsp:setProperty property="username" name="login" value=""/>
	<jsp:setProperty property="password" name="login" value="0"/>
	<%response.sendRedirect("../index.jsp");%>
</body>
</html>