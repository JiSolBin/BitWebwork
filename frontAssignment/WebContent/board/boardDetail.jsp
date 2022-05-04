<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Post</title>
	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
          integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <style>
       	.div_tb{
    		max-width:900px;
    		margin:30px auto;
    	}
    	
    	#th1, #th2{
    		padding: 10px 20px;
    	}
    	
    	#td1, #td2{
    		padding: 10px;
    	}
    	
    	#th3{
    		padding: 30px 20px;
    	}
    	
    	#td3{
    	 	padding-top: 20px;
    	 	padding-left: 5px;
    	}
    	
    	.title{
    		width: 19.2cm;
    	}
    </style>
</head>
<body>
	<%@ include file="/template/header.jspf" %>
	
	<br>

    <div class="div_tb">
        <form id="frm" method="post">
            <table class="table table-hover detailTable">
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
            	
	            	String driver = "com.mysql.cj.jdbc.Driver";
	            	String url = "jdbc:mysql://localhost:3306/frontassignment?characterEncoding=UTF-8&autoReconnect=true";
		     		String user = "user01";
		     		String password = "1234";
		     		
		     		Connection conn = null;
	         		Statement stmt = null;
	         		ResultSet rs = null;
		     		
	         		// db 연결
	         		try{
	         			Class.forName(driver);
	         			conn = DriverManager.getConnection(url,user,password);
	         			stmt = conn.createStatement();
	         			rs = stmt.executeQuery(sql);
	         			
						while(rs.next()){
						%>
			                <tr>
		                        <th id="th1">Index</th>
		                        <td id="td1"><%=rs.getString(1)%></td>
		                    </tr>
		                    <tr>
		                        <th id="th2">Date</th>
		                        <td id="td2"><%=rs.getString(4)%></td>
		                    </tr>
		                    <tr>
		                        <th scope="row" id="th3">Title</th>
		                        <td colspan="3" id="td3">
		                            <input type="text" class="form-control title" id="title" name="title" value="<%=rs.getString(2)%>"/>
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="4">
		                            <textarea id="content" name="content" class="form-control" rows="8"><%=rs.getString(3)%></textarea>
		                        </td>
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

            <input type="hidden" id="boardIdx" name="boardIdx" value="<%= boardIdx%>">
            
        </form>

        <a href="#this" id="list" class="btn btn-outline-primary">목록으로</a>
        <a href="#this" id="edit" class="btn btn-outline-primary">수정하기</a>
        <a href="#this" id="delete" class="btn btn-outline-primary">삭제하기</a>
    </div>

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
                frm.action = "./delete.jsp?"+boardIdx;
                frm.submit();
            });
        });
    </script>
</body>
</html>