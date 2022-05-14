<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Portfolio</title>
	
	<style>
		* {
			font-family: 'Jeju Gothic', sans-serif;
			font-size: 12pt;
		}
		
		.projectListDiv{
			width: 50%;
			margin: 200px auto 0px auto;
		}
		.projectDiv{
			width: 250px;
			border-radius: 10px;
			border: 1px solid lightgray;
			box-shadow: 0px 3px 5px 0px lightgray;
			
			display: inline-block;
			margin: 10px;
		}
		.projectDiv>img{
			border-radius: 10px 10px 0px 0px;
			padding: 5px;
			width: 100%;
			height: 150px;
			border-bottom: 1px solid lightgray;
		}
		.projectDiv>div{
			border-radius: 0px 0px 10px 10px;
			padding: 10px 15px 10px 15px;
			font-weight: lighter;
		}
		.projectDiv>div>p{
			margin-bottom: 7px;
			font-size: 10pt;
		}
		.projectDiv>div>p:last-child{
			margin-bottom: 0px;
		}
		
		.pjTitle{
			font-size: 12pt;
			font-weight: 600;
		}
		.pjSkill{
			width: 100%;
			height: 25px;
			overflow: hidden;
			white-space:nowrap;
		}
		.pjSkill>span{
			display: inline-block;
			font-size: 10pt;
			letter-spacing: -1px;
			
			background-color: rgb(228, 228, 228);
			padding: 1.8px 5px 1.2px 5px;
			border-radius: 5px;
		}
		.pjType{
			display: inline-block;
			background-color: rgb(228, 228, 228);
			padding: 1.8px 5px 1.2px 5px;
			border-radius: 5px;
		}
		.pjPeriod{
			letter-spacing: -1px;		
		}
	</style>
	
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
			<img src="../imgs/ccc.PNG">
			<div>
				<p class="pjTitle">Hello World!</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Python</span>
					<span>C++</span>
					<span>Arduino</span>
					<span>Raspberry pi</span>
				</p>
				<p class="pjType">팀프로젝트</p>
				<p class="pjPeriod">2022/05/10 ~ 2022/05/14</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/ccc.PNG">
			<div>
				<p class="pjTitle">Hello!</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Python</span>
					<span>C++</span>
					<span>Arduino</span>
					<span>Raspberry pi</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2022/05/10 ~ 2022/05/14</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/ccc.PNG">
			<div>
				<p class="pjTitle">Hello!</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Python</span>
					<span>C++</span>
					<span>Arduino</span>
					<span>Raspberry pi</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2022/05/10 ~ 2022/05/14</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/ccc.PNG">
			<div>
				<p class="pjTitle">projectDetail</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Python</span>
					<span>C++</span>
					<span>Arduino</span>
					<span>Raspberry pi</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2022/05/10 ~ 2022/05/14</p>
			</div>
		</div>
		
		<div class="projectDiv">
			<img src="../imgs/ccc.PNG">
			<div>
				<p class="pjTitle">projectDetail</p>
				<p class="pjSkill">
					<span>Java</span>
					<span>Python</span>
					<span>C++</span>
					<span>Arduino</span>
					<span>Raspberry pi</span>
				</p>
				<p class="pjType">개인프로젝트</p>
				<p class="pjPeriod">2022/05/10 ~ 2022/05/14</p>
			</div>
		</div>
	</div>
	
    <%@ include file="../template/footer.jspf" %>
</body>
</html>