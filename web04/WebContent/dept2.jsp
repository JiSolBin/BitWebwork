<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			String dname = "";
			String loc = "";
			
			String sql = "select * from dept2 where deptno="+deptno;
			
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
     			rs = stmt.executeQuery(sql);
     			
     			if(rs.next()){
     				dname = rs.getString(2);
     				loc = rs.getString(3);
     			}
     		}finally{
     			if(rs!=null) rs.close();
     			if(stmt!=null) stmt.close();
     			if(conn!=null) conn.close();
     		}
			%>
		
			<h1>Detail</h1>
			<table>
				<tr>
					<td bgcolor="lightgray" align="center" width="100">deptno</td>
					<td><%=deptno %></td>
				</tr>
				<tr>
					<td bgcolor="lightgray" align="center" width="100">dname</td>
					<td><%=dname %></td>
				</tr>
				<tr>
					<td bgcolor="lightgray" align="center" width="100">loc</td>
					<td><%=loc %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="edit2.jsp?deptno=<%=deptno%>">[수 정]</a>
						<a href="delete2.jsp?deptno=<%=deptno%>">[삭 제]</a>					
					</td>
				</tr>
			</table>
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