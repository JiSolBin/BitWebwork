<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="800" align="center" cellspacing="0">
	<tr>
		<td colspan="5"><img src="imgs/logo.jpg"></td>
	</tr>
	<tr>
		<td bgcolor="lightgray"></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="index.jsp">[HOME]</a></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="list.jsp">[DEPT]</a></td>
		<td bgcolor="lightgray" width="100" align="center"><a href="list2.jsp">[DEPT2]</a></td>
		<td bgcolor="lightgray"></td>
	</tr>
	<tr>
		<td colspan="5">
			<h1>search Page</h1>
			<form action="list.jsp" method="post">
				<table align="center" cellspacing="10">
					<tr>
						<td>dname</td>
						<td><input type="text" name="dname"></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" value="검 색">
							<input type="reset" value="취 소">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="center" bgcolor="lightgray">
			Copyright by bitacademy co.ltd. All rights reserved.
		</td>
	</tr>
</table>
</body>
</html>