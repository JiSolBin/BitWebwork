<%@page import="com.bit.controller.EmpListController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<style>
	.navbar-header{
		overflow: hidden;
	}
</style>

<script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script>
	$(function(){
		$('button[type="button"]').click(function(){
			history.back();
		});
	});
</script>

</head>
<body>

<div class="container">
    <div id="menu" class="row">
    	<div class="col-md-12">
    		<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="../">
			        <img alt="Brand" src="../imgs/logo.jpg">
			      </a>
			    </div>
			    <p class="navbar-text">
			    	<a href="../emp/list.html" class="btn btn-default">EMP</a>
			    	<a href="../dept/list.html" class="btn btn-default">DEPT</a>
			    </p>
			    <p class="navbar-text navbar-right">
			    	<a href="../login/index.html">LOGIN</a>
			    </p>
			  </div>
			</nav>
    	</div>
    </div>
    <div id="content" class="row">
    	<div class="col-md-12">
			
			<div class="page-header">
			  <h2>Login Page <small>로그인 페이지</small></h2>
			</div>
			<form method="post">
			  <div class="form-group">
			    <label for="empno">empno</label>
			    <input type="text" class="form-control" id="empno" name="empno" placeholder="empno">
			  </div>
			  <div class="form-group">
			    <label for="ename">ename</label>
			    <input type="text" class="form-control" id="ename" name="ename" placeholder="ename">
			  </div>
			  <div class="form-group">
			  	<button type="submit" class="btn btn-primary btn-block">입력</button>
			  	<button type="reset" class="btn btn-default btn-block">취소</button>
			  	<button type="button" class="btn btn-default btn-block">뒤로</button>
			  </div>
			  <div class="form-group">
			  	<p>회원가입은 <a href="#">여기</a>를 이용</p>
			  </div>
			</form>
			
    	</div>
    </div>
    <div id="footer" class="row">
    	<div class="col-md-12">
	    	<address>
			  <strong>Twitter, Inc.</strong><br>
			  1355 Market Street, Suite 900<br>
			  San Francisco, CA 94103<br>
			  <abbr title="Phone">P:</abbr> (123) 456-7890
			</address>
    	</div>
    </div>
</div>

</body>
</html>