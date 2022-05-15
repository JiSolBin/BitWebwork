<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>gradeManagement</title>

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
		<p id="projectTitle">gradeManagement</p>
	</div>
	
	<div class="div_slide">
		<ul id="bx">
			<li><img src="../imgs/page03_1.PNG" alt=""></li>
			<li><img src="../imgs/page03_2.PNG" alt=""></li>
			<li><img src="../imgs/page03_3.PNG" alt=""></li>
		</ul>
	</div>
	
	<div class="div_projectIntro">
		<div class="projectIntro_title">
			<h3>PROJECT INTRODUCTION</h3>
			<p>학생들의 성적 관리를 간편하게 할 수 있는 프로그램 제작</p>
		</div>
		
		<div class="projectIntro_Detail">
			<p><span>&#128198; 작업기간</span><span> : 2020/04/19 ~ 2021/01/20</span></p>
			<p><span>&#128587; 투입인원</span><span> : 1명</span></p>
			<p>
				<span>&#128218; 주요업무</span>
				<p>
					<span class="task">&#10004; 열심히 Java 공부</span><br>
					<span class="task">&#10004; MySQL 마스터</span><br>
					<span class="task">&#10004; Eclipse 설치</span><br>
				</p>
			</p>
			<p>
				<span class="sk">&#128296; 스킬 및 사용툴</span>
				<span class="pjojectDetail_span">Java</span>
				<span class="pjojectDetail_span">Eclipse</span>
				<span class="pjojectDetail_span">MySQL</span>
				<span class="pjojectDetail_span">GitHub</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>