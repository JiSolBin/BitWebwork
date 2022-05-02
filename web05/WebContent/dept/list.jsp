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
<% String myPath=".."; %>
<%@ include file="../template/header.jspf" %>
			<h1>DEPT List</h1>
			<table width="500" align="center" border="1">
				<tr>
					<td>deptno</td>
					<td>dname</td>
					<td>loc</td>
				</tr>
				<%
				
				MongoClient client = null;
				// p 값이 바뀌면 페이지가 바뀌는 것과 같음
				// 총 몇 페이지가 나와야 하는지 구하고, 계산해서 p로 주기
				int p=1;
				try{
					p = Integer.parseInt(request.getParameter("p"));
				}catch(NumberFormatException e){}
				
				MongoDatabase db = null;
				MongoCollection<Document> coll = null;
				
				try{
					client = new MongoClient();
					db = client.getDatabase("testDB");
					coll = db.getCollection("dept02");

					// n개만 나오도록 제한 -> .limit(n) / n개 skip -> .skip(n)
					// 이거 이용해서 페이지 나눔
					FindIterable<Document> ite = coll.find().skip(2*(p-1)).limit(2);
					MongoCursor<Document> cursor = ite.iterator();
					while(cursor.hasNext()){
						Document obj = cursor.next();
				%>
				<tr>
					<!-- id 값이 null일 때 0이 들어감 -->
					<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id", 0) %>"><%=obj.getInteger("_id", 0) %></a></td>
					<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id", 0) %>"><%=obj.getString("dname") %></a></td>
					<td><a href="detail.jsp?deptno=<%=obj.getInteger("_id", 0) %>"><%=obj.getString("loc") %></a></td>
				</tr>
				<%
					}
				}finally{
					client.close();					
				}
				%>
			</table>
			
			<p align="center"><a href="add.jsp">[입 력]</a></p>
<%@ include file="../template/footer.jspf" %>		
</body>
</html>