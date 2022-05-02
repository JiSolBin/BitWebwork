<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String param1 = request.getParameter("deptno");
String param2 = request.getParameter("dname");
String param3 = request.getParameter("loc");

int deptno = Integer.parseInt(param1);
String dname = param2.trim();
String loc = param3.trim();

if(request.getMethod().equals("GET")){
	response.sendRedirect("edit.jsp?deptno="+param1);
	return;
}

MongoClient client = null;

try{
	client = new MongoClient();
	client.getDatabase("testDB")
		.getCollection("dept02")
			.updateOne(
					// 주석된거나 아닌 것 둘 중 아무거나 사용하면 됨
					//Filters.eq("_id", deptno)
					//, new Document("$set", new Document("dname", dname).append("loc", loc)));
					new Document().append("_id", deptno)
					, Updates.combine(
							Updates.set("dname", dname),
							Updates.set("loc", loc)
							)
					, new UpdateOptions().upsert(true)
					);
}finally{
	client.close();
}

response.sendRedirect("list.jsp");

%>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.*" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="com.mongodb.client.model.*" %>
<%@ page import="org.bson.conversions.*" %>
<%@ page import="java.util.*" %>
</body>
</html>