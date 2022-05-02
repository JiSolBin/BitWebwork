<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.mongodb.*" %>
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
			<h1>List Page</h1>
			<table border="1" width="80%" align="center">
				<tr>
					<td width="100">deptno</td>
					<td><a href="list.jsp?sort=dname">dname</a></td>
					<td><a href="list.jsp?sort=loc">loc</a></td>
				</tr>
		
<%
	String ip = "127.0.0.1";
	int port = 27017;
	
	MongoClient client = new MongoClient(new ServerAddress(ip, port));
	DB db = client.getDB("testDB");
	DBCollection coll = db.getCollection("dept02");
	
	DBCursor cursor = null;
	
	if(request.getParameter("sort")!=null){
		String sort = request.getParameter("sort");
		cursor = coll.find().sort(new BasicDBObject(sort,1));
	}
	else if(request.getMethod().equals("POST")){
		String dname = request.getParameter("dname");
		cursor = coll.find(new BasicDBObject("dname",new BasicDBObject("$regex",dname)));
	}
	else{
		cursor = coll.find();		
	}
	
	while (cursor.hasNext()) {
        DBObject obj = cursor.next();
        out.println("<tr>");
        out.print("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("_id") + "</a></td>");
        out.print("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("dname") + "</a></td>");
        out.println("<td><a href=\"dept.jsp?deptno="+obj.get("_id")+"\">" + obj.get("loc") + "</a></td>");
        out.println("</tr>");
     }
	
	client.close();
%>

			</table>
			<p align="center">
				<a href="add.jsp">[입 력]</a>
				<a href="search.jsp">[검 색]</a>
			</p>
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