<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Write a post</title>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<br>

    <div class="boardWrite_table_div">
        <p class="lead" id="boardWrite_div_label">글쓰기</p>
        <form id="frm" name="frm" action="insert.jsp" enctype="multipart/form-data">
            <table class="board_detail">
                <tr>
                    <label class="col-form-label mt-4" for="title">Title</label>
                    <input type="text" class="form-control boardInsert_input" id="title" name="title">
                </tr>
                <tr>
                    <label class="col-form-label mt-4" for="content">Content</label>
                    <td colspan="2">
                        <textarea id="content" name="content" class="form-control boardInsert_input" rows="5"></textarea>
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