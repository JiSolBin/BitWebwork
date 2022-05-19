<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- jquery CDN-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
   
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.html">비트교육센터</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="home.html">HOME</a></li>
        <li class="active"><a href="emp.html">EMP <span class="sr-only">(current)</span></a></li>
        <li><a href="dept.html">DEPT</a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid">
	<div class="jumbotron">
	  <h1>Hello, world!</h1>
	</div>
</div>

<div class="container">
	<div class="row">
	  <div id="content" class="col-xs-12 col-md-10">
	  <!--  -->
	  	<div class="page-header">
		  <h1>리스트 페이지 <small>EMP List</small></h1>
		</div>
		<div class="list-group">
		  <div class="list-group-item active">
			<span class="badge">deptno</span>
			<h4 class="list-group-item-heading">ename(empno)</h4>
			<p class="list-group-item-text">hiredate</p>
		  </div>
		  <%@ page import="java.util.List, com.bit.emp.model.*" %>
		  <%
		  for(EmpDto bean : (List<EmpDto>)request.getAttribute("list")){
		  %>
		  <a href="#" class="list-group-item">
		  	<span class="badge"><%=bean.getDeptno() %></span>
		    <h4 class="list-group-item-heading"><%=bean.getEname()+" ("+bean.getEmpno()+")" %></h4>
		    <p class="list-group-item-text"><%=bean.getHiredate() %></p>
		  </a>
		<%
		}
		%>
		</div>
		<a href="empAdd.html" class="btn btn-primary btn-block" role="button">입력</a>
	  <!--  -->
	  </div>
	  <div class="col-xs-12 col-md-2 aside">
	  	<a href="https://getbootstrap.com/docs/3.4/">bootstrap</a>
	  </div>
	</div>
	<div id="footer" class="row">
	  <div class="col-xs-12 col-md-12">
	  	<address>
		  <strong>Twitter, Inc.</strong><br>
		  1355 Market Street, Suite 900<br>
		  San Francisco, CA 94103<br>
		  <abbr title="Phone">P:</abbr> (123) 456-7890
		</address>
		
		<address>
		  <strong>Full Name</strong><br>
		  <a href="mailto:#">first.last@example.com</a>
		</address>
	  </div>
	</div>
</div>

</body>
</html>