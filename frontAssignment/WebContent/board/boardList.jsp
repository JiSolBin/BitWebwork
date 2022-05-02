<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Board</title>
	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
          integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/template/header.jspf" %>
	
	<br>
	
    <div style="max-width:900px; margin:30px auto;">
        <table class="table table-hover">
            <colgroup>
                <col width="20%"/>
                <col width="*"/>
                <col width="25%"/>
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">Index</th>
                    <th scope="col">Title</th>
                    <th scope="col">Date</th>
                </tr>
            </thead>
            <tbody>
            	<%
            		String sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') from board";
            	
	            	String driver = "com.mysql.cj.jdbc.Driver";
		     		String url = "jdbc:mysql://localhost:3306/frontassignment";
		     		String user = "user01";
		     		String password = "1234";
		     		
		     		Connection conn = null;
	         		Statement stmt = null;
	         		ResultSet rs = null;
		     		
	         		try{
	         			Class.forName(driver);
	         			conn = DriverManager.getConnection(url,user,password);
	         			stmt = conn.createStatement();
	         			rs = stmt.executeQuery(sql);
	         			
						while(rs.next()){
						%>
			         		<tr class="table-secondary">
			                    <td><a href="./boardDetail.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getString(1)%></a></td>
			                    <td class="title"><a href="./boardDetail.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></td>
			                    <td><a href="./boardDetail.jsp?deptno=<%=rs.getInt(1)%>"><%=rs.getString(3)%></a></td>
			                </tr>
		         		<%
		         		}
	         		}finally{
	         			if(rs!=null) rs.close();
	         			if(stmt!=null) stmt.close();
	         			if(conn!=null) conn.close();
	         		}
            	%>
                
            </tbody>
        </table>

        <a href="./boardWrite.jsp">
            <button type="button" class="btn btn-outline-primary" style="width: 2cm; height: 1cm; padding: 0px">글쓰기</button>
        </a>
    </div>
</body>
</html>