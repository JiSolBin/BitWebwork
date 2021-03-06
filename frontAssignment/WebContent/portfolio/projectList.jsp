<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Portfolio</title>
	
	<% String myPath=".."; %>
	<%@ include file="../template/header.jspf" %>
	
	<script>
		$(function(){
			var arr = ['rgb(221, 224, 255)','rgb(225, 255, 221)','rgb(255, 221, 235)','rgb(255, 252, 221)','rgb(177, 219, 186)'
				,'rgb(208, 236, 255)','rgb(225, 248, 234)','rgb(199, 230, 220)','rgb(199, 202, 230)','rgb(199, 230, 223)'
				,'rgba(227, 199, 230, 0.774)','rgba(240, 202, 191, 0.849)','rgba(236, 236, 197, 0.849)','rgba(178, 191, 247, 0.871)'
				,'rgba(243, 204, 227, 0.871)','rgb(245, 236, 104)','rgb(104, 200, 245)','rgb(130, 214, 189)'];
			var idx = 0;
			
			$('.pjSkill>span').each(function(){
				$(this).css({"backgroundColor" : arr[Math.floor(Math.random() * 18)]});
			});
			
			$('.pjType').each(function(){
				if($(this).text()=='팀프로젝트'){
					$(this).css({"backgroundColor" : 'rgba(214, 213, 255, 0.5)'});
				}else{
					$(this).css({"backgroundColor" : 'rgba(206, 231, 214, 0.5)'});
				}
			});
			
			$('.projectDiv').mouseover(function(){
				$(this).css({"backgroundColor" : 'rgba(0,0,0, 0.05)'});
			});
			$('.projectDiv').mouseout(function(){
				$(this).css({"backgroundColor" : 'white'});
			});
			$('.projectDiv').click(function(){
				var filename = $(this).children().children('p.pjTitle').text();
				location.href = './'+filename+'.jsp';
			});
		});
	</script>
</head>
<body>
	<div class="projectListDiv">
		<div class="projectDiv">
			<img src="../imgs/page01_2.PNG">
			<div>
				<p class="pjTitle">BitWeb</p>
				<p class="pjSkill">
					<span>HTML</span>
					<span>CSS</span>
					<span>Visual Studio Code</span>
				</p>
				<p class="pjType">팀프로젝트</p>
				<p class="pjPeriod">2018/04/23 ~ 2018/05/01</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/page02_1.PNG">
			<div>
				<p class="pjTitle">MavenWeb</p>
				<p class="pjSkill">
					<span>HTML</span>
					<span>CSS</span>
					<span>Eclipse</span>
					<span>MySQL</span>
					<span>Java</span>
					<span>Javascript</span>
					<span>jQuery</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2019/02/13 ~ 2019/05/16</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/page04_1.PNG">
			<div>
				<p class="pjTitle">HelloWorld</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>IntelliJ</span>
					<span>GitHub</span>
					<span>GitKraken</span>
				</p>
				<p class="pjType">팀프로젝트</p>
				<p class="pjPeriod">2019/05/10 ~ 2020/08/14</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/page03_1.PNG">
			<div>
				<p class="pjTitle">gradeManagement</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Eclipse</span>
					<span>MySQL</span>
					<span>GitHub</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2020/04/19 ~ 2021/01/20</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/page05_1.PNG">
			<div>
				<p class="pjTitle">MongoBoard</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>MongoDB</span>
					<span>Javascript</span>
					<span>Jsp</span>
					<span>HTML</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2021/05/10 ~ 2022/05/14</p>
			</div>
		</div>
	</div>
	
    <%@ include file="../template/footer.jspf" %>
</body>
</html>