<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	String sql = "insert into board(title, content) values ('" + title + "', '" + content + "')";
	System.out.println(sql);

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
		stmt.executeUpdate(sql);
	}finally{
		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
	
	response.sendRedirect("./boardList.jsp");
%>

%>
</body>
</html>