<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- scope는 한 페이지에서만 공유되지만, request로 바꿔주면서  index.jsp와 scope를 함께 씀 -->
<!-- forward 함으로써 request 2번, response 1번 -->
<!-- 하지만 서버 입장에선 하나의 요청이므로 scope 공유, 값이 유지됨 -->

<!-- forward를 잘 이용하면 코드분리가 가능해진다 -->
<!-- jsp는 view 담당, 요청은 서블릿을 통해서 받고 jsp로 포워딩 -->

<!-- page, request, session, application(tomcat start~stop) -->

<jsp:useBean id="obj" class="com.bit.util.EmpDto" scope="request"></jsp:useBean>
<%
obj.setEname("아무개");
%>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>