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
            		String sql = "";
            		String sql2 = "";
            	
	            	String driver = "com.mysql.cj.jdbc.Driver";
		     		String url = "jdbc:mysql://localhost:3306/frontassignment";
		     		String user = "user01";
		     		String password = "1234";
		     		
		     		Connection conn = null;
	         		Statement stmt = null;
	         		Statement stmt2 = null;
	         		ResultSet rs = null;
	         		ResultSet rs2 = null;
	         		
	         		// 페이징
	         		int p=1;
	         		int cnt=0;
	         		
	         		if(request.getParameter("choice")!=null){
	        			p += Integer.parseInt(request.getParameter("choice"));			
	        		}
	         		
	         		try{
	        			p = Integer.parseInt(request.getParameter("p"));
	        		}catch(NumberFormatException e){}
		     		
	         		// db 연결
	         		try{
	         			Class.forName(driver);
	         			conn = DriverManager.getConnection(url,user,password);
	         			stmt = conn.createStatement();
	         			stmt2 = conn.createStatement();
	         			
	         			// 검색O
	         			if(request.getParameter("sel")!=null){
	        				String sel = request.getParameter("sel");
	        				String input = request.getParameter("input");
	        				if(sel.equals("content")){ // 내용검색
	        					sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') " 
			        					+ "from board where content like '%" + input +"%' "
			        					+ "limit " + 10*(p-1) + ", 10";
	        					sql2 = "select count(*) from board where content like '%" + input +"%'";
	        				}
	        				else{ // 제목검색
	        					sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') " 
			        					+ "from board where title like '%" + input +"%' "
			        					+ "limit " + 10*(p-1) + ", 10";
	        					sql2 = "select count(*) from board where title like '%" + input +"%'";
	        				}
	        			}
	        			else { // 검색X
	        				sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') from board limit " + 10*(p-1) + ", 10";
	        				sql2 = "select count(*) from board";
	        			}
	         		
	         			rs = stmt.executeQuery(sql);
	         			rs2 = stmt2.executeQuery(sql2);
	         			
	         			while(rs2.next()){
	         				cnt = rs2.getInt(1);
	         			}
	         			
						while(rs.next()){
						%>
			         		<tr class="table-secondary">
			                    <td><a href="./boardDetail.jsp?boardIdx=<%=rs.getInt(1)%>"><%=rs.getString(1)%></a></td>
			                    <td class="title"><a href="./boardDetail.jsp?boardIdx=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></td>
			                    <td><a href="./boardDetail.jsp?boardIdx=<%=rs.getInt(1)%>"><%=rs.getString(3)%></a></td>
			                </tr>
		         		<%
		         		}
            	%>
                
            </tbody>
        </table>
        
        <%
			// 페이징
			int pageNum = cnt/10;
			if(cnt%10!=0) ++pageNum;
			
			String q = "";
			if(request.getParameter("sel")!=null){
				q = "&sel=" + request.getParameter("sel") + "&input=" + request.getParameter("input");  
			}
		%>
			<p align="center">
		<%
			for(int i=0; i<pageNum; ++i){
		%>
			<!-- 제대로 페이징 처리 후, 다른 파라미터 확인하고 함께 넘겨야 함 -->
			<a href="./boardList.jsp?choice=<%=i+q%>" style="text-decoration:none; color:black" >
				<%=i+1 %>&nbsp;&nbsp;&nbsp;
			</a>
		<%		
			}
		
		%>
			</p>
			
			<form>
				<p align="center">
					<select name="sel">
						<option value="title"> title </option>
						<option value="content"> content </option>
					</select>
					<input type="text" name="input">
					<input type="submit" value="search">
				</p>
			</form>
		<%
			
		}finally{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		%>

        <a href="./boardWrite.jsp">
            <button type="button" class="btn btn-outline-primary" style="width: 2cm; height: 1cm; padding: 0px">글쓰기</button>
        </a>
    </div>
</body>
</html>