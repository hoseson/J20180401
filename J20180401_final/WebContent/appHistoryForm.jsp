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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
		//API
		$("#datepicker").datepicker({
			dateFormat : "y/mm/dd"
		});
		$("#datepicker2").datepicker({
			dateFormat : "y/mm/dd"
		});
	});
	function chk() {
		if(appHistory.date1.value > appHistory.date2.value) {
			alert("잘못된 기간 선택입니다. 기간을 다시 선택해주세요!");
			appHistory.date1.value = "";
			appHistory.date2.value = "";
			return false;
		}
		return true;
	}
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">
table {
	border-top: 5px solid lightgray;
	border-left: 5px solid lightgray;
	border-right: 5px solid lightgray;
	border-collapse: collapse;
	width: 1000px;
	background-color: white;
}

th, td {
	border-bottom: 1px solid lightgray;
}

th {
	color: white;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
		<div align="center">
			<div>
				<img width="1000px" height="150px" src="images/historyMenu.jpg">
			</div>
			<div
				style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">

				<form action="appHistory.do" name="appHistory" onsubmit="return chk()">
					<h3>진료 내역</h3>
					<div style="text-align: left;">
						<p>
							<input type="hidden" name="memNo" value="${memNo }"> 
							기간 1 : <input type="text" id="datepicker" name="date1"
								placeholder="검색할 날짜를 입력해주세요" value="${date1 }"> 
							기간 2 : <input type="text" id="datepicker2" name="date2"
								placeholder="검색할 날짜를 입력해주세요" value="${date2 }" >
							    <input type="submit" value="기간 검색"
								style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
						</p>
					</div>
					<div style="text-align: center;">
						<table
							style="width: 1000px; border: 5px solid lightgray; background-color: white;">
							<tr style="height: 50px; background: #4F81BD;">
								<th>내역 번호</th>
								<th>진료과</th>
								<th>의료진</th>
								<th>진료 날짜</th>
								<th>진료 시간</th>
								<th>예약 사유</th>
							</tr>
							<c:if test="${totCnt > 0 }">
								<c:forEach var="history" items="${history }">
									<tr>
										<td width="70">${startNum }</td>
										<td width="100">${history.deptName }</td>
										<td width="50">${history.docName }</td>
										<td width="50">${history.appDate }</td>
										<td width="70">${history.appTime }</td>
										<td width="400">${history.appRes }</td>
									</tr>
									<c:set var="startNum" value="${startNum -1 }"></c:set>
								</c:forEach>
							</c:if>
							<c:if test="${totCnt == 0 }">
								<tr>
									<td colspan="6">과거 진료 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					<div
						style="width: 1000px; height: 50px; margin-top: 30px; text-align: center;">
						<c:if test="${startPage > blockSize }">
							<a
								href="appHistory.do?memNo=${memNo}&pageNum=${startPage-blockSize }">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<a href="appHistory.do?memNo=${memNo}&pageNum=${i }">[${i }]</a>
						</c:forEach>
						<c:if test="${endPage < pageCnt }">
							<a
								href="appHistory.do?memNo=${memNo}&pageNum=${startPage+blockSize }">[다음]</a>
						</c:if>
					</div>
					<%-- <div style="text-align:right; ">
		<input type="button" value="돌아가기"
			onclick="location.href='appCheck.do?memNo=${memNo}'">
		</div> --%>
				</form>
			</div>
		</div>
	</section>
	<footer> </footer>
</body>
</html>