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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
	});
	function date() {
		alert("당일 예약 취소는 불가능합니다.");
		location.href = "appCheck.do?memNo=${memNo}";
	}
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
table{
   border-top: 5px solid lightgray;
   border-left: 5px solid lightgray;
   border-right: 5px solid lightgray;
   border-collapse: collapse;
   width: 1000px; 
   background-color: white; 
}
th,td{
	border-bottom: 1px solid lightgray;
}
.contitle{
	color:white;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/listMenu1.jpg">
		</div>
		<!-- 게시물 검색  -->
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">
			<form>
				<h3>예약 정보 조회</h3>
				<div style="text-align: center;">
					<table
						style="width: 1000px; border: 5px solid lightgray; background-color: white;">
						<tr style="height: 50px; background: #4F81BD;">
							<th class="contitle">예약 번호</th>
							<th class="contitle">진료과</th>
							<th class="contitle">의료진</th>
							<th class="contitle">진료 날짜</th>
							<th class="contitle">진료 시간</th>
							<th class="contitle">예약 사유</th>
							<th class="contitle">예약 삭제</th>
						</tr>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="checklist" items="${checklist }">
								<tr>
									<td class="" width="70">${startNum }</td>
									<td width="120">${checklist.deptName }</td>
									<td width="60">${checklist.docName }</td>
									<td width="70">${checklist.appDate }</td>
									<td width="70">${checklist.appTime }</td>
									<td width="470">${checklist.appRes }</td>
									<td width="80"><c:set var="now"
											value="<%=new java.util.Date()%>" /> <c:set var="sysYear">
											<fmt:formatDate value="${now}" pattern="yy/MM/dd" />
										</c:set> <c:if test="${checklist.appDate eq sysYear}">
											<input type="button" value="예약 삭제하기" onclick="date()"
												style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 16px; color: white;">
										</c:if> <c:if test="${!(checklist.appDate eq sysYear)}">

											<input type="button" value="예약 삭제하기"
												onclick="window.open('appDelete.do?memNo=${memNo}&appDate=${checklist.appDate}&appTime=${checklist.appTime}', 
											'_blank', 'width=550, height=350, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );"
												style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 16px; color: white;">

										</c:if></td>
								</tr>
								<c:set var="startNum" value="${startNum -1 }"></c:set>
							</c:forEach>
						</c:if>
						<c:if test="${totCnt == 0 }">
							<tr>
								<td colspan="7">신청한 예약 정보가 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div
					style="width: 1000px; height: 50px; margin-top: 30px; text-align: center;">
					<c:if test="${startPage > blockSize }">
						<a
							href="appCheck.do?memNo=${memNo}&pageNum=${startPage-blockSize }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="appCheck.do?memNo=${memNo}&pageNum=${i }">[${i }]</a>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a
							href="appCheck.do?memNo=${memNo}&pageNum=${startPage+blockSize }">[다음]</a>
					</c:if>
				</div>
				<div style="text-align: right; margin-right: 30px;">
					<input type="button" value="건강 상담"
						onclick="location.href='conSelect.do?memNo=${memNo}'"
						style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
					<input type="button" value="지난 기록 조회"
						onclick="location.href='appHistory.do?memNo=${memNo}'"
						style="width: 150px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
				</div>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>
