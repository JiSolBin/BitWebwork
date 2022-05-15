<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MongoBoard</title>
	
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
		<p id="projectTitle">MongoBoard</p>
	</div>
	
	<div class="div_slide">
		<ul id="bx">
			<li><img src="../imgs/page05_1.PNG" alt=""></li>
			<li><img src="../imgs/page05_2.PNG" alt=""></li>
			<li><img src="../imgs/page05_3.PNG" alt=""></li>
		</ul>
	</div>
	
	<div class="div_projectIntro">
		<div class="projectIntro_title">
			<h3>PROJECT INTRODUCTION</h3>
			<p>MongoDB를 활용하여 만든 검색 가능한 게시판</p>
		</div>
		
		<div class="projectIntro_Detail">
			<p><span>&#128198; 작업기간</span><span> : 2021/05/10 ~ 2022/05/14</span></p>
			<p><span>&#128587; 투입인원</span><span> : 1명</span></p>
			<p>
				<span>&#128218; 주요업무</span>
				<p>
					<span class="task">&#10004; HTML과 CSS 등을 통해 VIEW 제작</span><br>
					<span class="task">&#10004; Database 구성하기</span><br>
					<span class="task">&#10004; 게시글 리스트 페이지 구현</span><br>
					<span class="task">&#10004; 페이징 기능 구현</span><br>
					<span class="task">&#10004; 제목 또는 내용으로 검색 기능 구현</span><br>
				</p>
			</p>
			<p>
				<span class="sk">&#128296; 스킬 및 사용툴</span>
				<span class="pjojectDetail_span">Java</span>
				<span class="pjojectDetail_span">MongoDB</span>
				<span class="pjojectDetail_span">Javascript</span>
				<span class="pjojectDetail_span">Jsp</span>
				<span class="pjojectDetail_span">HTML</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>