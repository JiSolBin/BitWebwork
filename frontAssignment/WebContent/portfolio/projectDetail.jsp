<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Portfolio</title>
	
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
        }
        .bx-next{
            left: 550px;
        }
        .bx-next:hover{text-decoration:none; color: white; }
        .bx-prev:hover{text-decoration:none; color: white; }
        
        #projectTitle{
        	font-size: 40pt;
        	text-align: center;
        	padding-top: 60px;
        }
        
        .div_projectIntro{
  			width: 50%;
			margin: 100px auto 0px auto;
			font-size: 12pt;
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
        
        .task{
        	padding-left: 10px;
        }
        
        .aboutMe_year{
			display: inline-block;
			margin-top: 4px;
			margin-right: 0px;
			background-color: rgb(228, 228, 228);
			padding: 2px 5px 2px 5px;
			color: orangered;
			font-size: 12px;
			border-radius: 7px;
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
		<p id="projectTitle">Portfolio Name</p>
	</div>
	
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
	
	<div class="div_projectIntro">
		<div class="projectIntro_title">
			<h3>PROJECT INTRODUCTION</h3>
			<p>프로젝트 설명</p>
		</div>
		
		<div class="projectIntro_Detail">
			<p><span>&#128198; 작업기간</span><span> : 20년</span></p>
			<p><span>&#128587; 투입인원</span><span> : 200명</span></p>
			<p>
				<span>&#128218; 주요업무</span><br>
				<p class="task">&#10004; 게시판 만들기</p>
				<p class="task">&#10004; DB 연결</p>
			</p>
			<p>
				<span>&#128296; 스킬 및 사용툴</span><br>
				<span class="aboutMe_year">IntelliJ</span>
				<span class="aboutMe_year">SpringBoot</span>
				<span class="aboutMe_year">Java</span>
				<span class="aboutMe_year">MySQL</span>
				<span class="aboutMe_year">HTML</span>
				<span class="aboutMe_year">CSS</span>
				<span class="aboutMe_year">github</span>
			</p>
		</div>
	</div>
	
	<%@ include file="../template/footer.jspf" %>
</body>
</html>