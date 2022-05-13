<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<jsp:include page="../template/head.jsp">
		<jsp:param value=".." name="root"/>
	</jsp:include>
	
	<script>
		
	</script>
</head>

<%@page import="java.sql.*, com.bit.util.*" %>
<%!
Connection conn;
Statement stmt;

// Dto 사용
public void insertOne(EmpDto bean) throws SQLException{
	
    String sql="insert into emp (empno,ename,sal,hiredate) values("+bean.getEmpno()
    		+",'"+bean.getEname()+"',"+bean.getSal()+",now())";
	
	try{
		conn = DBServer.getConnection();
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();
	}
}

// 변수로
public void insertOne(int empno,String ename,int sal) throws SQLException{
	String sql="insert into emp (empno,ename,sal,hiredate) values("+empno+",'"+ename+"',"+sal+",now())";
	
	try{
		conn=DBServer.getConnection();
		stmt=conn.createStatement();
		stmt.executeUpdate(sql);
	}finally{
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
}

%>
<!-- Bean 생성 -->
<jsp:useBean id="bean" class="com.bit.util.EmpDto"></jsp:useBean>
<jsp:setProperty property="empno" name="bean"/>
<jsp:setProperty property="ename" name="bean"/>
<jsp:setProperty property="sal" name="bean"/>
<%

request.setCharacterEncoding("utf-8");

if(request.getMethod().equals("POST")) {
	/* int empno = Integer.parseInt(request.getParameter("empno").trim());
	String ename = request.getParameter("ename").trim();
	int sal = Integer.parseInt(request.getParameter("sal").trim());
	
	EmpDto bean = new EmpDto();
	bean.setEmpno(empno);
	bean.setEname(ename);
	bean.setSal(sal); */
	
	insertOne(bean);
	response.sendRedirect("./");
}

%>

<body>
<nav>
	<h1><a href="./">비트교육센터</a></h1>
	<ul>
		<li><a href="../">HOME</a></li>
		<li><a href="../intro.jsp">INTRO</a></li>
		<li><a href="./">LIST</a></li>
		<li><a href="../login/form.jsp">LOGIN</a></li>
	</ul>
</nav>

<div class="container">
	<div class="row">
		<div class="grid12">
			<!-- content start -->
			<h2>입력 페이지</h2>
			<form class="form-control" method="post">
				<div class="form-group">
					<label for="empno">empno</label>
					<input type="text" name="empno" id="empno" placeholder="사번을 입력">
				</div>
				<div class="form-group">
					<label for="ename">ename</label>
					<input type="text" name="ename" id="ename" placeholder="이름을 입력">
				</div>
				<div class="form-group">
					<label for="sal">sal</label>
					<input type="text" name="sal" id="sal" placeholder="금액을 입력">
				</div>
				<div class="form-group">
					<button class="btn btn-primary">입력</button>
					<button class="btn" type="reset">취소</button>
					<button class="btn" type="button">뒤로</button>
				</div>
			</form>
			<!-- content end -->
		</div>
	</div>
	<div class="row">
		<div id="footer" class="grid12">
			&copy; by bitacademy co.ltd. All rights reserved
		</div>
	</div>
</div>
</body>
</html>