<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/lux/bootstrap.min.css"
          integrity="sha384-9+PGKSqjRdkeAU7Eu4nkJU8RFaH8ace8HGXnkiKMP9I9Te0GJ4/km3L1Z8tXigpG" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/earlyaccess/jejugothic.css" rel="stylesheet">
    
	<style type="text/css">
        * {
            box-sizing: border-box;
            font-family: 'Jeju Gothic', sans-serif;
            /* font-family: 'Noto Sans KR', sans-serif; */
            border-radius: 5px;
        }

        .div {
            width: 20%;
            margin-right: auto;
            margin-left: auto;
            margin-top: 200px;
            padding: 20px;
            text-align: center;
            border: none;
        }
        
        .div input {
			font-size: 15pt;
			height: 70px;
        }

        .btn {
            font-size: 17px;
            border: none;
            padding: 10px;
            width: 100%;
            height: 70px;
            background-color: #151515;
            margin-bottom: 30px;
            color: white;
        }
    </style>
</head>
<body>
    <div class="div">
        <form id="frm" name="frm" action="loginQuery.jsp" method="post">
            <fieldset>
                <h1>LOGIN</h1>
                <br>
                <div class="form-group">
                    <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                </div>
                <button type="submit" class="btn">Login</button>
            </fieldset>
        </form>
        
        <br>
        <p>[host] ID : me / pw : 0000 <br> 글 작성/수정/삭제 + 댓글 작성 가능 </p>
        <p>[user] ID : user / pw : 0000 <br> 댓글 작성 가능 </p>
    </div>
</body>
</html>