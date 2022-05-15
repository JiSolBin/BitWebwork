<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>HOME</title>
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
						<p style="color:lightgray">익명이라 가짜 데이터입니다.</p><br>
						<p class="aboutMe_title">&#127891; Education</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2016~2020</span>고려대학교 수학과 학사</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2018~2019</span>영국 버밍햄대학교 전산과학과 석사</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020~2021</span>고려대학교 전산과학과 이학 박사</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2022</span>비트교육센터</p>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<div class="aboutMe_div">
						<p class="aboutMe_title">&#127942; Award</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2019</span>billboard music awards best new artist</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>grammy awards best song</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2021</span>academy awards best actor</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2022</span>nobel prize in chemistry</p>
					</div>
				</td>
			</tr>
			
			<tr>
         		<td class="half_td">
					<div class="aboutMe_lastDiv">
						<p class="aboutMe_title">&#128161; Certificate</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>정처기</p>
						<p class="aboutMe_content"><span class="aboutMe_year">2020</span>SQLD</p>
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