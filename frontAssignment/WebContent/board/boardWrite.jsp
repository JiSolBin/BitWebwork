<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Write a post</title>
		
	<style>
		* {
			font-family: 'Jeju Gothic', sans-serif;
			font-size: 11pt;
		}
	</style>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<br>

    <div class="div_tb">
        <p class="lead" id="p1"> Write a post </p>
        <form id="frm" name="frm" action="insert.jsp" enctype="multipart/form-data">
            <table class="board_detail">
                <tr>
                    <label class="col-form-label mt-4" for="title">Title</label>
                    <input type="text" class="form-control txt1" id="title" name="title">
                </tr>
                <tr>
                    <label class="col-form-label mt-4" for="content">Content</label>
                    <td colspan="2">
                        <textarea id="content" name="content" class="form-control txt1" rows="5"></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="submit" id="submit" value="저장" class="btn btn-outline-dark">
        </form>
    </div>
    
    <%@ include file="../template/footer.jspf" %>
</body>
</html>