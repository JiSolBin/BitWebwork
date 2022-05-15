<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login</title>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
    <div class="loginDiv">
        <form id="frm" name="frm" action="loginQuery.jsp" method="post">
            <fieldset>
                <h1>LOGIN</h1>
                <br>
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                </div>
                <button type="submit" class="loginBtn">Login</button>
            </fieldset>
        </form>
        
        <br>
        <p>[host] ID : me / pw : 0000 <br> 글 작성/수정/삭제 + 댓글 작성 가능 </p>
        <p>[user] ID : user / pw : 0000 <br> 댓글 작성 가능 </p>
    </div>
    
    <%@ include file="../template/footer.jspf" %>
</body>
</html>