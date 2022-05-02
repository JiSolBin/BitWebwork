<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="org.bson.*" %>
<%@ page import="com.mongodb.client.*" %>
<%@ page import="org.bson.conversions.Bson" %>
<%@page import="com.mongodb.client.model.Filters"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mongodb.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String myPath="."; %>
	<%@ include file="template/header.jspf" %>
	
	<h1 align="center">List</h1>
	<table width="800" align="center" border="1" cellspacing="0">
		<tr>
			<th width="70">id</td>
			<th>title</td>
		</tr>
		<%
		MongoClient client = null;
		
		int p=1;
		
		if(request.getParameter("choice")!=null){
			p += Integer.parseInt(request.getParameter("choice"));			
		}
		
		try{
			p = Integer.parseInt(request.getParameter("p"));
		}catch(NumberFormatException e){}
		
		MongoDatabase db = null;
		MongoCollection<Document> coll = null;
		FindIterable<Document> ite = null;
		
		try{
			client = new MongoClient();
			db = client.getDatabase("testDB");
			coll = db.getCollection("test05");

			long cnt = coll.count();
			if(request.getParameter("sel")!=null){
				String sel = request.getParameter("sel");
				
				Bson filter = null;

				String input = request.getParameter("input");
				if(sel.equals("content")){
					BasicDBObject q = new BasicDBObject("body",new BasicDBObject("$regex",input));
					cnt = coll.countDocuments(q);
		            ite = coll.find(q).skip(10*(p-1)).limit(10);
				}
				else{
					BasicDBObject q = new BasicDBObject("title",new BasicDBObject("$regex",input));
					cnt = coll.countDocuments(q);
		            ite = coll.find(q).skip(10*(p-1)).limit(10);
				}
			}
			else{
				ite = coll.find().skip(10*(p-1)).limit(10);
			}
			
			MongoCursor<Document> cursor = ite.iterator();
			while(cursor.hasNext()){
				Document obj = cursor.next();
		%>
			<tr>
				<td align="center"><%=obj.getInteger("_id", 0) %></td>
				<td>&nbsp;<%=obj.getString("title") %></td>
			</tr>
		<%
			}
		%>
	</table>
	
		<%
			// 페이징
			long pageNum = cnt/10;
			if(cnt%10!=0) ++pageNum;
			
			String q = "";
			if(request.getParameter("sel")!=null){
				// sel=title&input=qui
				q = "&sel=" + request.getParameter("sel") + "&input=" + request.getParameter("input");  
			}
		%>
			<p align="center">
		<%
			for(int i=0; i<pageNum; ++i){
		%>
			<!-- 제대로 페이징 처리 후, 다른 파라미터 확인하고 함께 넘겨야 함 -->
			<a href="list.jsp?choice=<%=i+q%>" style="text-decoration:none; color:black" >
				<%=i+1 %>&nbsp;&nbsp;&nbsp;
			</a>
		<%		
			}
		
		%>
			</p>
			
			<form>
				<p align="center">
					<select name="sel">
						<option value="title"> 제목 </option>
						<option value="content"> 내용 </option>
					</select>
					<input type="text" name="input">
					<input type="submit" value="검색">
				</p>
			</form>
		<%
			
		}finally{
			client.close();					
		}
		%>
</body>
</html>