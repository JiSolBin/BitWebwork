<%@page import="com.mongodb.client.model.Filters"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.*" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="org.bson.conversions.Bson" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<%
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = null;
	String loc = null;
	
	MongoClient client = null;
	
	try{
		client = new MongoClient();
		MongoDatabase db = client.getDatabase("testDB");
		MongoCollection<Document> coll = db.getCollection("dept02");
		
		Bson filter = Filters.eq("_id", deptno);
		MongoCursor<Document> cur = coll.find(filter).iterator();
		if(cur.hasNext()){
			Document doc = cur.next();
			deptno = doc.getInteger("_id");
			dname = doc.getString("dname");
			loc = doc.getString("loc");
		}
	}finally{
		client.close();
	}
	%>
	
	<h1>DEPT Edit Page</h1>
	<form action="update.jsp" method="post">
		<table align="center">
			<tr>
				<td width="100" bgcolor="#cccccc" align="center">deptno</td>
				<td><input type="text" name="deptno" value="<%=deptno%>" readonly></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">dname</td>
				<td><input type="text" name="dname" value="<%=dname%>"></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">loc</td>
				<td><input type="text" name="loc" value="<%=loc%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
	
	<%@ include file="../template/footer.jspf" %>		
</body>
</html>