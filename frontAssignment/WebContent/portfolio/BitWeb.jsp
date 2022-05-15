<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BitWeb</title>

	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
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
                auto : true,
                pause : 3000
            });

            $('.bx-prev, .bx-next').text('<').next().text('>');
        });
    </script>
</head>
<body>
	<br><br>
	
	<div>
		<p id="projectTitle">BitWeb</p>
	</div>
	
	<div class="div_slide">
		<ul id="bx">
			<li><img src="../imgs/page01_1.PNG" alt=""></li>
			<li><img src="../imgs/page01_2.PNG" alt=""></li>
		</ul>
	</div>
	
	<div class="div_projectIntro">
		<div class="projectIntro_title">
			<h3>PROJECT INTRODUCTION</h3>
			<p>간단한 웹 프론트를 구현한 프로젝트</p>
		</div>
		
		<div class="projectIntro_Detail">
			<p><span>&#128198; 작업기간</span><span> : 2018/04/23 ~ 2018/05/01</span></p>
			<p><span>&#128587; 투입인원</span><span> : 3명</span></p>
			<p>
				<span>&#128218; 주요업무</span>
				<p>
					<span class="task">&#10004; HTML과 CSS 등을 통해 VIEW 제작</span><br>
					<span class="task">&#10004; grid css를 통해 반응형 웹으로 제작</span><br>
				</p>
			</p>
			<p>
				<span class="sk">&#128296; 스킬 및 사용툴</span>
				<span class="pjojectDetail_span">HTML</span>
				<span class="pjojectDetail_span">CSS</span>
				<span class="pjojectDetail_span">Visual Studio Code</span>
				<span class="pjojectDetail_span">GitHub</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>