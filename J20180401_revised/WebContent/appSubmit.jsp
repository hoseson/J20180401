
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="loginCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
.appFinMsg {
	width: 1000px;
	color: #4780c5;
	padding: 20px 0 20px 0;
	margin-top: 10px;
	text-align: center;
	background-color: #f0f2f7;
	text-align: center;
}

.appInfo {
	width: 500px;
	font-size: 20px;
	font-weight: 500;
	padding: 20px 0 20px 0;
	background-color: white;
	border: 1px solid #f0f2f7;
}

.userInfo {
	width: 500px;
	height: 200px;
	background-color: white;
	text-align: center;
	font-size: 20px;
	font-weight: 500;
	border: 1px solid #f0f2f7;
	border-collapse: collapse;
}

.finText {
	font-size: 13px;
	text-align: left;
	margin-left: 50px;
}

.appFinBtn{
	border: 1px solid #4780c5;
	color: #fff;
	font-size: 15px;
	text-align: center;
	padding: 10px 30px 10px 30px;
	background-color: #4780c5;
	float:right;
	}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/appointMenu.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; background-color: #D9E5FF;">
			<c:if test="${result > 0}">
				<div class="appFinMsg">
					<h2>예약이 완료되었습니다.</h2>
				</div>
				<h2>진료예약 정보 확인</h2>
				<div class="appInfo">
					<table>
						<tr>
							<td>${deptName}</td>
							<td>|</td>
							<td>${docName}</td>
							<td>|</td>
							<td>${date}</td>
							<td>|</td>
							<td>${time}</td>
						</tr>
						<tr>
							<td colspan="7">진료예약 사유: ${appRes}</td>
						</tr>
					</table>
				</div>

				<h2>신청자 정보</h2>
				<table class="userInfo" border="5">
					<tr>
						<td>이름</td>
						<td>${memberDTO.name}</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>${memberDTO.tel}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${memberDTO.email}</td>
					</tr>
				</table>
				<br>
				<div class="finText">
					*방문 시 1단계 진료기관(병.의원)에서 발급받은 요약급여의뢰서(진료의뢰서) 원본이나 건강 검진 후 결과에 이상 소견이
					기재된 건강진단서를 지참하셔야 합니다.<br> *단, 가정의학과, 치과, 재활의학과(작업치료, 운동치료 등이
					필요한 경우만)는 요양금여의뢰서(진료의뢰서) 지참 제외<br> *의료급여증을 소지하신 분은 반드시 제2차 또는
					3차 의료급여기관에서 발급한 의료급여의뢰서를 지참하셔야 의료급여 적용을 받으실 수 있습니다.<br> *홈페이지와
					모빙앱을 통한 온라인 예약은 예약/확인/취소만 가능합니다.<br> *예약 변경은 예약 하루 전까지 전화
					(02)561-1911 으로 연락 주시기 바랍니다.<br>
				</div>
				<a href="mainForm.do?memNo=${memNo}" class="appFinBtn">확인</a>
			</c:if>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>
