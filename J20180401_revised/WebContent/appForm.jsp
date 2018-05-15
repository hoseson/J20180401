<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="loginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>

<!-- jquery ajax를 사용하여 예약 메인 페이지 위에 다른 페이지 모두 호출 -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var runOnce = function(){
		let deptNo = "${deptNo}";
		let docName = "${docName}";
		let memNo = "${memNo}";
		
		if(docName === "" && deptNo === ""){
			$.ajax({
				url : 'appByDept.do',
				success : function(data) {
					$("#byDept").attr("class", "whenBtnSelected");
					$('#byDocSearchBar').html(data);
				}
			});
		} else if(deptNo != "") {
			$.ajax({
				url : 'appByDept.do',
				data:{deptNo:deptNo},
				success : function(data) {
					$("#byDept").attr("class", "whenBtnSelected");
					$('#byDocSearchBar').html(data);
					$.ajax({
						url : 'appByDoc.do',
						data : {
							'memNo' : memNo,
							'deptNo' : deptNo},
						success : function(data) {
							$('#appFormdocList').html(data);
						}
					});
				}
			});
		} else if(docName != ""){
			$.ajax({
				url : 'appDocForm.do',
				success : function(data) {
					$("#byDoc").attr("class", "whenBtnSelected");
					$('#byDocSearchBar').html(data);
					$.ajax({
						url : 'appByDoc.do',
						data : {
							'memNo' : memNo,
							'docName' : docName},
						success : function(data) {
							$('#appFormdocList').html(data);
						}
					});
				}
			});
		};
	};
	
	window.onload = runOnce;
	
	$(function() {	
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
		$('#byDoc').click(function() {
			$("#byDoc").attr("class", "whenBtnSelected");
			$("#byDept").attr("class", "appModeBtn");
			$("#byDis").attr("class", "appModeBtn");
			$.ajax({
				url : 'appDocForm.do',
				success : function(data) {
					$('#byDocSearchBar').html(data);
					$('#step2Frame').load("white.jsp");
					$('#step3Frame').load("white.jsp");
					$('#summary').load("white.jsp");
					$.ajax({
						url : 'appByDoc.do',
						success : function() {
							$('#appFormdocList').load("white.jsp");
						}
					});
				}
			});
		});
		$('#byDept').click(function() {
			$("#byDoc").attr("class", "appModeBtn");
			$("#byDept").attr("class", "whenBtnSelected");
			$("#byDis").attr("class", "appModeBtn");
			$.ajax({
				url : 'appByDept.do',
				success : function(data) {
					$('#byDocSearchBar').html(data);
					$('#step2Frame').load("white.jsp");
					$('#step3Frame').load("white.jsp");
					$('#summary').load("white.jsp");
					$.ajax({
						url : 'appByDoc.do',
						success : function() {
							$('#appFormdocList').load("white.jsp");
						}
					});
				}
			});
		});
		$('#byDis').click(function() {
			$("#byDoc").attr("class", "appModeBtn");
			$("#byDept").attr("class", "appModeBtn");
			$("#byDis").attr("class", "whenBtnSelected");
			$.ajax({
				url : 'appByDis.do',
				success : function(data) {
					$('#byDocSearchBar').html(data);
					$('#step2Frame').load("white.jsp");
					$('#step3Frame').load("white.jsp");
					$('#summary').load("white.jsp");
					$.ajax({
						url : 'appByDoc.do',
						success : function() {
							$('#appFormdocList').load("white.jsp");
						}
					});
				}
			});
		});
	});
</script>

<!-- 여기부터 head끝날 때까지는 ajax로 불러올 페이지들의 위치를 잡아준 CSS -->
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
.step1Head {
	width: 480px;
	height: 50px;
	background-color: #f0f2f7;
	font-weight: bold;
}

.step1Frame {
	width: 480px;
	height: 420px;
	background-color: #fff;
	overflow: auto;
	overflow: scroll;
}

.step2Head {
	width: 150px;
	height: 50px;
	background-color: #f0f2f7;
	font-weight: bold;
}

.step2Frame {
	width: 150px;
	height: 420px;
font-size: 20px;
	background-color: #fff;
	overflow: auto;
}

.step3Head {
	width: 330px;
	height: 50px;
	background-color: #f0f2f7;
	font-weight: bold;
}

.step{
	color: #a1a7bd;
}

.step3Frame {
	width: 330px;
	height: 130px;
font-size: 20px;
	background-color: #fff;
	overflow: auto;
}

.summary {
	width: 330px;
	height: 290px;
	font-size: 20px;
	background-color: #fff;
	overflow: auto;
}

.appModeBtn{
	border: 1px solid #4780c5;
	border-radius: 4px;
	color: #4780c5;
	font-size: 15px;
	text-align: center;
	padding: 3px 11px 0px 11px;
}

.whenBtnSelected{
	border: 1px solid #4780c5;
	border-radius: 4px;
	color: #fff;
	font-size: 15px;
	text-align: center;
	padding: 3px 11px 0px 11px;
	background-color: #4780c5;
}

.byDocSearchBar{
	padding-left: 16px;
	padding-top: 4px;
}
.appFormdocList{
	padding-left: 32px;
}

</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section> <!-- 크게 4파트(div)로 나뉘어져 있고(step 1~3 Frame + summary), .mainFrame은 예약메인 전체 div, 나머지(step 1~3 Head)는 헤더용 div에 해당 -->
	<!-- 모든 페이지를 다 ajax로 주고 받고, 페이지가 넘어가는 유일한 구간은 예약 확정 후, (insert 메소드에 오류가 없었다면) 예약 결과가 나오는 창 -->
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/appointMenu.jpg">
		</div>
		<div>
			<div align="center"
				style="width: 1000px; height: 450px; margin: 30px; padding: 30px 0px 50px 0px; background-color: #D9E5FF;">
				<div
					style="width: 480px; height: 470px; margin: 0 2px 0 8px; border: 3px solid #f0f2f7; float: left;">
					<div class="step1Head"><span class="step">Step1</span><br>진료과 및 의료진 선택</div>
					<div class="step1Frame">
						<div style="padding-top: 8px;">
							<a href="#;" id="byDept" class="appModeBtn">진료과로 예약</a>
							<a href="#;" id="byDoc" class="appModeBtn">의료진으로 예약</a>
							<a href="#;" id="byDis" class="appModeBtn">질병명으로 예약</a>
						</div>
						<div align="left" id="byDocSearchBar" class="byDocSearchBar"></div>
						<div align="left" id="appFormdocList" class="appFormdocList"></div>
					</div>
				</div>
				<div
					style="width: 150px; height: 470px; margin-right: 2px; border: 3px solid #f0f2f7; float: left;">
					<div class="step2Head"><span class="step">Step2</span><br>날짜 선택</div>
					<div class="step2Frame" id="step2Frame"></div>
				</div>
				<div
					style="width: 330px; height: 470px; border: 3px solid #f0f2f7; float: left;">
					<div class="step3Head"><span class="step">Step3</span><br>시간 선택</div>
					<div class="step3Frame" id="step3Frame"></div>
					<div class="summary" id="summary"></div>
				</div>
			</div>
		</div>
	</div>

	</section>
	<footer> </footer>
</body>
</html>