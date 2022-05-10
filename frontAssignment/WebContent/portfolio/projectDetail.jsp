<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Portfolio</title>
	
    <style>
        #bx img{
            width: 650px;
            height: 350px
        }
        
        .bx-prev, .bx-next{
            background-color: rgba(255,255,255,0);/* 투명도 */
            color: white;

            position: relative;
            top: -200px;

            display: inline-block;
            width: 50px;
            height: 50px;
            border-radius: 25px;
            text-align: center;
            line-height: 40px;
            text-decoration: none;
            font-size: 50px;
            font-weight: bold;
        }
        .bx-next{
            left: 550px;
        }
        .bx-next:hover{text-decoration:none; color: white; }
        .bx-prev:hover{text-decoration:none; color: white; }
    </style>

    <script src="../js/jquery-1.12.4.min.js"></script>
    <script src="../js/jquery.bxslider.min.js"></script>
    <script>
        var bx;

        $(function(){
            bx = $('#bx').bxSlider({
                slideWidth : 650,
                minSlides : 1,
                maxSlides : 1,
                moveSlides : 1,
                pager: false,
                auto : true
            });

            $('.bx-prev, .bx-next').text('<').next().text('>');
        });
    </script>
</head>
<body>
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<br>
	
	<div class="div_slide">
		<ul id="bx">
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img01" alt=""></li>
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img02" alt=""></li>
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img03" alt=""></li>
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img04" alt=""></li>
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img05" alt=""></li>
			<li><img src="https://dummyimage.com/650x350/000/fff&text=img06" alt=""></li>
		</ul>
	</div>
</body>
</html>