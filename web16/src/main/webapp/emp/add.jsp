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

<%if(request.getAttribute("err")!=null){ %>
<div class="alert alert-danger alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong>Error!</strong> <%=request.getAttribute("err") %>
</div>
<%} %>

<nav class="navbar navbar-inverse">
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
		  <h1>입력 페이지 <small>EMP Insert</small></h1>
		</div>
		<form class="form-horizontal" method="post">
		  <div class="form-group">
		    <label for="empno" class="col-sm-2 control-label">empno</label>
		    <div class="col-sm-10">
		      <input type="text" name="empno" class="form-control" id="empno" placeholder="empno" value="<%=request.getParameter("empno")==null?"":request.getParameter("empno")%>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="ename" class="col-sm-2 control-label">ename</label>
		    <div class="col-sm-10">
		      <input type="text" name="ename" class="form-control" id="ename" placeholder="ename" value="<%=request.getParameter("ename")==null?"":request.getParameter("ename")%>">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="sal" class="col-sm-2 control-label">sal</label>
		    <div class="col-sm-10">
		      <input type="text" name="sal" class="form-control" id="sal" placeholder="sal" value="<%=request.getParameter("sal")==null?"":request.getParameter("sal")%>">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		    	<div class="btn-group btn-group-justified" role="group" aria-label="...">
			    	<div class="btn-group btn-group-lg" role="group" aria-label="...">
				      <button type="submit" class="btn btn-primary">입력</button>
				    </div>
				    <div class="btn-group btn-group-lg" role="group" aria-label="...">
				      <button type="reset" class="btn btn-default">취소</button>
				    </div>
				    <div class="btn-group btn-group-lg" role="group" aria-label="...">
				      <button type="button" class="btn btn-default" onclick="history.back();">뒤로</button>
				    </div>
				</div>
		    </div>
		  </div>
		</form>
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