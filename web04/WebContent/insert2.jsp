<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="800" align="center" cellspacing="0">
	<tr>
		<td colspan="5"><img src="imgs/logo.jpg"></td>
	</tr>
	<tr>
		<td bgcolor="lightgray"></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
		<td bgcolor="lightgray"></td>
	</tr>
	<tr>
		<td colspan="5">
<%
int deptno;

try{
	deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");

	String sql = "insert into dept2 values ("+deptno+", '"+dname+"', '"+loc+"')";

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
} catch(NumberFormatException e){
	//out.println("<h1>오류 발생 어쩌구</h1>");
	response.sendRedirect("add2.jsp?err=number01");
}
%>
</td>
	</tr>
	<tr>
		<td colspan="5" align="center" bgcolor="lightgray">
			Copyright by bitacademy co.ltd. All rights reserved.
		</td>
	</tr>
</table>
</body>
</html>