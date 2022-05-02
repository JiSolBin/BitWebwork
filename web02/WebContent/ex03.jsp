<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
        String addr = request.getRemoteAddr();
        String host = request.getRemoteHost();
        int port = request.getRemotePort();
        String url = request.getRequestURI();
        StringBuffer url2 = request.getRequestURL();
        
        out.println("<br>");
        out.println(addr);
        out.println("<br>");
        out.println(host);
        out.println("<br>");
        out.println(port);
        out.println("<br>");
        out.println(url2);
    %>
</body>
</html>