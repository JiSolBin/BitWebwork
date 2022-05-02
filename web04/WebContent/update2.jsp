<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int deptno = Integer.parseInt(request.getParameter("deptno"));
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

String sql = "update dept2 set dname='"+dname+"', loc='"+loc+"' where deptno="+deptno;

String driver = "com.mysql.cj.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/scott";
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

response.sendRedirect("list2.jsp");
%>
</body>
</html>