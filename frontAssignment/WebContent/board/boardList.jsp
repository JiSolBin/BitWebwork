<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Board</title>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<br>
	
    <div class="boardList_table_div">
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
		     		String url = "jdbc:mysql://localhost:3306/frontassignment?characterEncoding=UTF-8&autoReconnect=true";
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
	        				String input = new String(request.getParameter("input").getBytes("8859_1"), "UTF-8");
	        				
	        				if(sel.equals("content")){ // 내용검색
	        					sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') " 
			        					+ "from board where content like '%" + input +"%' order by boardIdx desc "
			        					+ "limit " + 7*(p-1) + ", 7";
	        					sql2 = "select count(*) from board where content like '%" + input +"%'";
	        				}
	        				else{ // 제목검색
	        					sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') " 
			        					+ "from board where title like '%" + input +"%' order by boardIdx desc "
			        					+ "limit " + 7*(p-1) + ", 7";
	        					sql2 = "select count(*) from board where title like '%" + input +"%'";
	        				}
	        			}
	        			else { // 검색X
	        				sql = "select boardIdx, title, date_format(createDate, '%Y-%m-%d') from board order by boardIdx desc limit " + 7*(p-1) + ", 7";
	        				sql2 = "select count(*) from board";
	        			}
	         		
	         			rs = stmt.executeQuery(sql);
	         			// 페이징
	         			rs2 = stmt2.executeQuery(sql2);
	         			
	         			while(rs2.next()){
	         				cnt = rs2.getInt(1);
	         			}
	         			
	        			int pageNum = cnt/7;
	        			if(cnt%7!=0) ++pageNum;
	        			
	        			String q = "";
	        			if(request.getParameter("sel")!=null){
	        				String input = new String(request.getParameter("input").getBytes("8859_1"), "UTF-8");
	        				q = "&sel=" + request.getParameter("sel") + "&input=" + input;
	        			}
	         			
						while(rs.next()){
						%>
			         		<tr class="table-secondary">
			                    <td><%=rs.getString(1)%></td>
			                    <td><a href="./boardDetail.jsp?boardIdx=<%=rs.getInt(1)%>" class="boardList_title"><%=rs.getString(2)%></a></td>
			                    <td><%=rs.getString(3)%></td>
			                </tr>
		         		<%
		         		}
            	%>
                
            </tbody>
        </table>
			
		<p class="boardList_page">
			<%
			for(int i=0; i<pageNum; ++i){
			%>
				<a href="./boardList.jsp?choice=<%=i+q%>">
					<%=i+1 %>&nbsp;&nbsp;&nbsp;
				</a>
			<%		
			}
			%>
		</p>
			
		<form class="searchForm">
			<p>
				<select name="sel" class="boardList_input">
					<option value="title"> title </option>
					<option value="content"> content </option>
				</select>
				<input type="text" name="input" class="boardList_input">
				<input type="submit" value="검색" class="btn btn-outline-primary boardList_searchBtn">
			</p>
		</form>
		<%
			
		}finally{
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}
		%>

		<%if(login.isResult() && login.getUsername().equals("me")){ %>
			<a href="./boardWrite.jsp">
	            <button type="button" class="btn btn-outline-primary boardList_writeBtn">글쓰기</button>
	        </a>
		<%}%>
        
    </div>
    
    <%@ include file="../template/footer.jspf" %>
</body>
</html>