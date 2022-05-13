<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HOME</title>
	
	<style>
		* {
			font-family: 'Jeju Gothic', sans-serif;
			font-size: 12pt;
		}
	
		.aboutMe{
			width: 40%;
			margin: 0px auto;
		}
		
		.aboutMe_title{
			font-size: 20px;
			font-weight: bold;
			margin-bottom: 8px;
			color: rgb(30, 30, 30);
		}
		
		.aboutMe_div{
			margin-bottom: 50px;
		}
	
		.aboutMe_content{
			color:black;
			margin: 5px auto 5px 0px;
			color: rgb(30, 30, 30);
		}
		
		.aboutMe_year{
			display: inline-block;
			margin-top: 4px;
			margin-right: 0px;
			background-color: rgb(228, 228, 228);
			padding: 2px 5px 2px 5px;
			color: orangered;
			font-size: 12px;
			font-weight: bold;
			border-radius: 7px;
		}
		
		.aboutMe_div>p>span{
			margin-right: 7px;
		}
		
		.half_td{
			width:50%;
		}
		
		.aboutMe_lastDiv{
			height: 250px;
		}
		
		.aboutMe_lastDiv:first-child>p>span{
			margin-right: 7px;
		}
	</style>
</head>
<body>
	<% String myPath="."; %>
	<%@ include file="template/header.jspf" %>
	
	<br><br><br><br>

	<table class="aboutMe">
		<tbody>
			<tr>
				<td colspan="2">
					<div class="aboutMe_div">
						<p class="aboutMe_title">&#127891; Education</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2016~2020</span>한국산업기술대학교 컴퓨터공학부 소프트웨어전공</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2018~2019</span>소프트웨어 보안을 위한 보안약점 분류에 따른 진단 방법 연구(2차) 과제 참여</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020~2021</span>석사</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2021~2022</span>박사</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2022</span>비트교육센터</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="aboutMe_div">
						<p class="aboutMe_title">&#127942; Award</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2019</span>한국인터넷방송통신학회 종합학술대회 우수논문상</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>prize2</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2021</span>prize3</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2022</span>prize4</p>
					</div>
				</td>
			</tr>
			
			<tr>
         		<td class="half_td">
					<div class="aboutMe_lastDiv">
						<p class="aboutMe_title">&#128161; Certificate</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>정처기</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>SQLD</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2021</span>토익스피킹</p>
					</div>
				</td>
				<td>
					<div class="aboutMe_lastDiv">
						<p class="aboutMe_title">&#128296; Used Tool & Skill</p>
						<p class="aboutMe_content">Tool</p>
						<span class="aboutMe_year">IntelliJ</span>
						<span class="aboutMe_year">Eclipse</span>
						<span class="aboutMe_year">visual studio</span>
						
						<p class="aboutMe_content">Skill</p>
						<span class="aboutMe_year">Java</span>
						<span class="aboutMe_year">Spring Boot</span>
						<span class="aboutMe_year">MySQL</span>
						<span class="aboutMe_year">Git</span>
						<span class="aboutMe_year">MongoDB</span>
						<span class="aboutMe_year">Javascript</span>
						<span class="aboutMe_year">HTML</span>
						<span class="aboutMe_year">CSS</span>
						<span class="aboutMe_year">jQuery</span>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	
	<%@ include file="template/footer.jspf" %>
</body>
</html>