<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Write a post</title>
	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
          integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/template/header.jspf" %>
	
	<br>

    <div style="max-width:900px; margin:30px auto;">
        <p class="lead" style="color: black"> Write a post </p>
        <form id="frm" name="frm" action="insert.jsp" enctype="multipart/form-data">
            <table class="board_detail">
                <tr>
                    <label class="col-form-label mt-4" for="title">Title</label>
                    <input type="text" class="form-control" id="title" name="title" style="width: 20cm">
                </tr>
                <tr>
                    <label class="col-form-label mt-4" for="content">Content</label>
                    <td colspan="2">
                        <textarea id="content" name="content" class="form-control" rows="5" style="width: 20cm"></textarea>
                    </td>
                </tr>
            </table>
            <br><br>
            <input type="submit" id="submit" value="저장" class="btn btn-outline-dark">
        </form>
    </div>
</body>
</html>