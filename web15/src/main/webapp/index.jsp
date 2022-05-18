<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style>
	.navbar-header{
		overflow: hidden;
	}
</style>

<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script></script>

</head>
<body>

<div class="container">
    <div id="menu" class="row">
    	<div class="col-md-12">
    		<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <div class="navbar-header">
			      <a class="navbar-brand" href="./">
			        <img alt="Brand" src="imgs/logo.jpg">
			      </a>
			    </div>
			    <p class="navbar-text">
			    	<a href="emp/list.html" class="btn btn-default">EMP</a>
			    	<a href="dept/list.html" class="btn btn-default">DEPT</a>
			    </p>
			    <p class="navbar-text navbar-right">
			    	<% if(session.getAttribute("result")!=null){
			    		out.print(session.getAttribute("id").toString()+"님 로그인 중");
			    	%>
			    		<a href="login/index.html">LOGOUT</a>
			    	<%} else{ %>
			    		<a href="login/index.html">LOGIN</a>
			    	<%} %>
			    </p>
			  </div>
			</nav>
    	</div>
    </div>
    <div id="content" class="row">
    	<div class="col-md-12">
			
			<!-- carousel -->
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
					<div class="jumbotron">
					  <h1 class="bg-info">첫번째!</h1>
					</div>
			    </div>
			    <div class="item">
					<div class="jumbotron">
					  <h1 class="bg-warning">두번째!</h1>
					</div>
			    </div>
			    <div class="item">
					<div class="jumbotron">
					  <h1 class="bg-success">세번째!</h1>
					</div>
			    </div>
			  </div>
			</div>
			
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