<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
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
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div> 
			<c:if test="${pagechk.equals('doc')}">
				<img width="1000px" height="150px" src="images/docSearchMenu.jpg">
			</c:if>
			<c:if test="${pagechk.equals('dept')}">
				<img width="1000px" height="150px" src="images/deptSearchMenu.jpg">
			</c:if>
		</div>
		<!-- 중앙 메뉴 -->
		<!-- 여기에 입력해주세요.  -->
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">
			<div style="margin: 30px;"></div>
			<div style="margin: 30px;">
				<form>
					<table border="3" style="width: 900px; background-color: white">
						<tr>
							<td style="width: 100px;">이름: ${doctor.docName} <input
								type="button" value="진료예약" onclick="location.href='appForm.do?docName=${doctor.docName}'"
								style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;"></td>
							<td><h3>진료분야</h3>
								<p>${doctor.cureName}</p></td>
							<td style="width: 100px;">선호도:<c:if
									test="${doctor.favor!=null}"> ${doctor.favor}</c:if> <c:if
									test="${doctor.favor==null}">0</c:if></td>
						</tr>
						<tr>
							<td rowspan="2" style="text-align: center;"><img
								src="docImage/${doctor.docNo}.png"></td>

							<td colspan="2"><h3>학력</h3>
								<p>
									<c:forEach var="institute" items="${institute}">${institute}<p>
									</c:forEach></td>

						</tr>
						<tr>
							<td colspan="2"><h3>경력</h3>
								<p>
									<c:forEach var="career" items="${career}">${career}<p>
									</c:forEach></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>

