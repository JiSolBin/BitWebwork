<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HelloWorld</title>
	
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
		<p id="projectTitle">HelloWorld</p>
	</div>
	
	<div class="div_slide">
		<ul id="bx">
			<li><img src="../imgs/page04_1.PNG" alt=""></li>
			<li><img src="../imgs/page04_2.PNG" alt=""></li>
		</ul>
	</div>
	
	<div class="div_projectIntro">
		<div class="projectIntro_title">
			<h3>PROJECT INTRODUCTION</h3>
			<p>콘솔창에 "Hello World" 를 출력한 프로젝트</p>
		</div>
		
		<div class="projectIntro_Detail">
			<p><span>&#128198; 작업기간</span><span> : 2019/05/10 ~ 2020/08/14</span></p>
			<p><span>&#128587; 투입인원</span><span> : 15명</span></p>
			<p>
				<span>&#128218; 주요업무</span>
				<p>
					<span class="task">&#10004; 컴퓨터공학부 입학</span><br>
					<span class="task">&#10004; 자바 수업 출석</span><br>
				</p>
			</p>
			<p>
				<span class="sk">&#128296; 스킬 및 사용툴</span>
				<span class="pjojectDetail_span">Java</span>
				<span class="pjojectDetail_span">IntelliJ</span>
				<span class="pjojectDetail_span">GitHub</span>
				<span class="pjojectDetail_span">GitKraken</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>