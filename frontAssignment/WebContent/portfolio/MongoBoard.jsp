<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MongoBoard</title>
	
    <style>
		*{
			font-family: 'Jeju Gothic', sans-serif;
			font-size: 12pt;
			color: rgb(30, 30, 30);
		}
		
    	.div_slide{
    		position: relative;
    	}
    	
        #bx img{
            width: 650px;
            height: 350px
        }
        
        .bx-prev, .bx-next{
            background-color: rgba(255,255,255,0);/* 투명도 */
            color: black;

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
        }
        .bx-next{
            left: 550px;
        }
        .bx-next:hover{text-decoration:none; color: black; }
        .bx-prev:hover{text-decoration:none; color: black; }
        
        #projectTitle{
        	font-size: 40pt;
        	text-align: center;
        	padding-top: 60px;
        }
        
        .div_projectIntro{
  			width: 50%;
			margin: 100px auto 0px auto;
        }
        
        .projectIntro_title{
        	margin-bottom: 35px;
        }
        
        .projectIntro_title>h3{
        	padding-bottom: 10px;
        	border-bottom: 1px solid darkgray;
        }
        
        .projectIntro_title>h3>p{
        	padding-top: 20px;
        }
        
        .projectIntro_Detail>p{
        	margin: 0px 0px 10px 0px;
        }
        
        .projectIntro_Detail *{
        	font-size:11pt;
        }
        
        .task{
        	display: inline-block;
        	padding-left: 10px;
        	margin: 4px 4px;
        }
        
        .aboutMe_year{
			display: inline-block;
			margin-top: 4px;
			margin-right: 0px;
			background-color: rgba(228, 228, 228, 0.8);
			padding: 1.8px 5px 1.2px 5px;
			color: rgb(255, 85, 23);
			border-radius: 5px;
			
			font-size: 13px;
			font-weight: bold;
		}
		
		.sk{
			display: block;
			margin-bottom: 10px;
		}
    </style>
    
    <!-- 이 부분에서 jquery-1.12.4.min.js 파일 include 해줘야 하기 때문에 <head>에서 header.jspf 불러옴 -->
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
				<span class="aboutMe_year">Java</span>
				<span class="aboutMe_year">MongoDB</span>
				<span class="aboutMe_year">Javascript</span>
				<span class="aboutMe_year">Jsp</span>
				<span class="aboutMe_year">HTML</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>