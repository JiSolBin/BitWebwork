<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.*" %>
<%@ page import="com.mongodb.client.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(request.getMethod().equals("GET")){
	response.sendRedirect("add.jsp");
	return;
}

request.setCharacterEncoding("utf-8");
String param1 = request.getParameter("deptno");
String param2 = request.getParameter("dname");
String param3 = request.getParameter("loc");

int deptno = Integer.parseInt(param1.trim());
String dname = param2.trim();
String loc = param3.trim();

////

MongoClient client = null;

try{
	client = new MongoClient();
	MongoDatabase db = client.getDatabase("testDB");
	MongoCollection<Document> coll = db.getCollection("dept02");

	Document doc = new Document();
	doc.put("_id", deptno);
	doc.put("dname", dname);
	doc.put("loc", loc);

	coll.insertOne(doc);
	// 여러개 입력할 땐 document 들을 list에 담아서 insertMany
}finally{
	client.close();
}

////

response.sendRedirect("list.jsp");
%>
</body>
</html>