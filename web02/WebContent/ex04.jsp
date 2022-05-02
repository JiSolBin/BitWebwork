<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>파라미터 값 파싱</h1>
	
	<!-- http://localhost:8080/web02/ex04.jsp?id=aa&name=bb&password=1234 -->
	<p>id:<%=request.getParameter("id")%></p>
	<p>name:<%=request.getParameter("name")%></p>
	<p>pw:<%=request.getParameter("password")%></p>
	
	<!-- http://localhost:8080/web02/ex04.jsp?items=itm1&items=itm2&items=itm3 -->
	<!-- 중복으로 넣으면 계속 첫번째 값만 받음, getParameterValues 쓰면  배열로 다 받아올 수 있음-->
	<p>item:<%=request.getParameter("items")%></p>
	<p>item:<%=java.util.Arrays.toString(request.getParameterValues("items"))%></p>
	
	<%
		String[] arr1 = request.getParameterValues("items");
		for(int i=0; i<arr1.length; i++){
	%>
			<p>item<%=i+1 %> : <%=arr1[i] %></p>
	<%
		}
	%>
	
	<!-- 넘어오는 파라미터 이름이 뭔지 몇개나 넘어올지 모른다면? -->
	<% 
	   	Enumeration<String> enu=request.getParameterNames();
	   	while(enu.hasMoreElements()){
			String paramName = enu.nextElement();
			String[] params = request.getParameterValues(paramName);
			for(int i=0; i<params.length; ++i){
				System.out.println(paramName+"="+params[i]);
			}
		}
		
		System.out.println("------------------------");
		
		Map<String, String[]> paramMap = request.getParameterMap(); 
		Set<Entry<String,String[]>> entrys = paramMap.entrySet();
		Iterator<Entry<String,String[]>> ite = entrys.iterator();
		while(ite.hasNext()){
			Entry<String,String[]> entry = ite.next();
			String key = entry.getKey();
			String[] vals = entry.getValue();
			for(int i=0; i<vals.length; ++i){
				System.out.println(key+":"+vals[i]);
			}
		}
	%>
</body>
</html>