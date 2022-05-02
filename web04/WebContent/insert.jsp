<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.mongodb.*" import="java.util.*"%>
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

	String ip = "127.0.0.1";
	int port = 27017;

	MongoClient client = null;
	try{
		client = new MongoClient(ip, port);
		DB db = client.getDB("testDB");
		DBCollection coll = db.getCollection("dept02");
		
		BasicDBObject doc = new BasicDBObject();
		doc.put("_id",deptno);
		doc.put("dname",dname);
		doc.put("loc",loc);
		
		coll.insert(doc);
	}finally{
		client.close();
	}

	response.sendRedirect("list.jsp");
} catch(NumberFormatException e){
	//out.println("<h1>오류 발생 어쩌구</h1>");
	response.sendRedirect("add.jsp?err=number01");
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