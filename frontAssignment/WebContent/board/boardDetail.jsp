<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Post</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var boardIdx = $("#boardIdx").val();
            var q = '?';

            $("#list").on("click", function(){
            	history.back();
            });

            $("#edit").on("click", function(){
                var frm = $("#frm")[0];
                frm.action = "./edit.jsp?"+boardIdx;
                frm.submit();
            });

            $("#delete").on("click", function(){
                var frm = $("#frm")[0];
                frm.action = "./delete.jsp?boardIdx="+boardIdx;
                frm.submit();
            });
        });
    </script>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<br>

    <div class="boardDetail_table_div">
        <form id="frm" method="post">
            <table class="table table-hover">
                <colgroup>
                    <col width="15%"/>
                    <col width="35%"/>
                    <col width="15%"/>
                    <col width="35%"/>
                </colgroup>
                <tbody>
                <%
                	String boardIdx = request.getParameter("boardIdx");
            		String sql = "select boardIdx, title, content, date_format(createDate, '%Y-%m-%d') from board where boardIdx=" + boardIdx;
            		String sql2 = "select username, coment from coments where boardIdx=" + boardIdx;
            	
	            	String driver = "com.mysql.cj.jdbc.Driver";
	            	String url = "jdbc:mysql://localhost:3306/frontassignment?characterEncoding=UTF-8&autoReconnect=true";
		     		String user = "user01";
		     		String password = "1234";
		     		
		     		Connection conn = null;
	         		Statement stmt = null;
	         		ResultSet rs = null;
	         		Statement stmt2 = null;
	         		ResultSet rs2 = null;
		     		
	         		// db ??????
	         		try{
	         			Class.forName(driver);
	         			conn = DriverManager.getConnection(url,user,password);
	         			stmt = conn.createStatement();
	         			stmt2 = conn.createStatement();
	         			rs = stmt.executeQuery(sql);
	         			rs2 = stmt2.executeQuery(sql2);
	         			
						while(rs.next()){
						%>
			                <tr>
		                        <th id="th1">Index</th>
		                        <td id="td1" colspan="3"><%=rs.getString(1)%></td>
		                    </tr>
		                    <tr>
		                        <th id="th2">Date</th>
		                        <td id="td2" colspan="3"><%=rs.getString(4)%></td>
		                    </tr>
		                    <tr>
		                        <th scope="row" id="th3">Title</th>
		                        <td colspan="3" id="td3">
		                            <input type="text" class="form-control board_Detail_title" id="title" name="title" value="<%=rs.getString(2)%>"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="4">
		                            <textarea id="content" name="content" class="form-control" rows="17"><%=rs.getString(3)%></textarea>
		                        </td>
		                    </tr>
		         		<%
		         		}
            		%>
                </tbody>
            </table>

            <input type="hidden" id="boardIdx" name="boardIdx" value="<%= boardIdx%>">
            
        </form>

        <a href="#this" id="list" class="btn btn-outline-primary">????????????</a>
        <%if(login.isResult() && login.getUsername().equals("me")){ %>
			<a href="#this" id="edit" class="btn btn-outline-primary">????????????</a>
        	<a href="#this" id="delete" class="btn btn-outline-primary">????????????</a>
		<%}%>
		
		<div id="comentDiv">
			<form method="post" action="insertComent.jsp">
				<br><br><hr width = "100%" color = "lightgray">
				
				<table>
					<%
					while(rs2.next()){
					%>
		                <tr>
	                        <th><%=rs2.getString(1)%></th>
	                        <td id="td2" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rs2.getString(2)%></td>
	                    </tr>
	         		<%
	         		}
	         	%>
	         	</table>
	         	<%
         		}finally{
        			if(rs!=null) rs.close();
        			if(stmt!=null) stmt.close();
        			if(rs2!=null) rs.close();
        			if(stmt2!=null) stmt.close();
        			if(conn!=null) conn.close();
        		}	
				%>
				
				<%if(login.isResult()){ %>
					<table class="boardDetail_coment_table">
						<input type="hidden" id="boardIdx" name="boardIdx" value="<%= boardIdx%>">
						<input type="hidden" id="username" name="username" value="<%= login.getUsername()%>">
		                <tr>
		                    <td colspan="2">
		                        <textarea id="coment" name="coment" class="form-control boardInsert_input" rows="2"></textarea>
		                    </td>
		                    <td><input type="submit" id="submit" value="??????" class="btn btn-outline-dark"></td>
		                </tr>
	            	</table>
				<%}%>
			</form>
		</div>
    </div>
    
	<%@ include file="../template/footer.jspf" %>
</body>
</html>