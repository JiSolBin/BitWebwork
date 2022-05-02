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
		
		// 아래 한 줄이 그 밑에 주석 두 줄과 같음 (templateMethod 디자인 패턴), eq 말고 lt gt 등 사용 가능
		Bson filter = Filters.eq("_id", deptno);
		//Document filter = new Document();
		//filter.append("_id", deptno);
		
		// and, or
		// Bson filter = Filters.and(Filters.eq("_id", deptno), Filters.eq("dname", dname));
		
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
	
	<h1>DEPT Detail Page</h1>
	<form action="edit.jsp">
		<table align="center">
			<tr>
				<td width="100" bgcolor="#cccccc" align="center">deptno</td>
				<td><input type="text" name="deptno" value="<%=deptno%>" readonly></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">dname</td>
				<td><input type="text" name="dname" value="<%=dname%>" readonly></td>
			</tr>
			<tr>
				<td bgcolor="#cccccc" align="center">loc</td>
				<td><input type="text" name="loc" value="<%=loc%>" readonly></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수 정">
			
		</form>
		<form action="delete.jsp" method="post">
			<input type="hidden" name="deptno" value="<%=deptno%>">
			<input type="submit" value="삭 제">
		</form>
				</td>
			</tr>
		</table>
	
	<%@ include file="../template/footer.jspf" %>		
</body>
</html>