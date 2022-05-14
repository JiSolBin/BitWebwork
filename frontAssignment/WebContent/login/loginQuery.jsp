<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="login" class="com.bit.util.UserDto" scope="session"></jsp:useBean>
	
	<%

	request.setCharacterEncoding("utf-8");
	login.setUsername(request.getParameter("username").trim());
	login.setPassword(request.getParameter("password").trim());
	
	String sql = "select count(*) from users where username='"+login.getUsername()+"' and password='"+login.getPassword()+"'";

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/frontassignment?characterEncoding=UTF-8&autoReconnect=true";
	String user = "user01";
	String password = "1234";
		
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
		
	try{
		Class.forName(driver);
		conn = DriverManager.getConnection(url,user,password);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);

		if(rs.next())
			login.setResult(rs.getInt(1)>0 ? true : false);
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	
	response.sendRedirect("../");
%>
</body>
</html>