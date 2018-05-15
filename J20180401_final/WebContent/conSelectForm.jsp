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
th{
color:white;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<script type="text/javascript">
			$(function() {
				$(".conMenu").mouseenter(function() {
					$(this).css("background-color", "#D9E5FF");
				});
				$(".conMenu").mouseleave(function() {
					$(this).css("background-color", "white");
				});
			});
		</script>
		<div>
			<img width="1000px" height="150px" src="images/consultMenu.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">
			<form>
				<h3>건강 상담 게시글 조회</h3>
				<div style="text-align: center;">
					<table
						style="width: 1000px; border: 5px solid lightgray; background-color: white;">
						<tr style="height: 50px; background: #4F81BD;">
							<th>글번호</th>
							<th>진료과</th>
							<th>글제목</th>
							<th>상태</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="list2" items="${list2 }">
								<tr class="conMenu">
									<td width="70">${startNum }</td>
									<%-- <td>${list2.consultNo }</td> --%>
									<td width="120">${list2.deptName }</td>
									<td style="width: 400; text-align: left;"><a
										href="conContent.do?memNo=${memNo }&consultNo=${list2.consultNo}&startNum=${startNum}">${list2.subject }</a></td>
									<td width="100"><c:if test="${list2.recontent != null }">답변 완료</c:if>
										<c:if test="${list2.recontent == null }">답변 미등록</c:if></td>
									<td width="50">${list2.regDate }</td>
									<td width="50">${list2.readCount }</td>
								</tr>
								<c:set var="startNum" value="${startNum -1 }"></c:set>
							</c:forEach>
						</c:if>
						<c:if test="${totCnt == 0 }">
							<tr>
								<td colspan="6">작성하신 건강 상담글이 존재하지 않습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
				<div
					style="width: 1000px; height: 50px; margin-top: 30px; text-align: center;">
					<c:if test="${startPage > blockSize }">
						<a
							href="conSelect.do?memNo=${memNo}&pageNum=${startPage-blockSize }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="conSelect.do?memNo=${memNo}&pageNum=${i }">[${i }]</a>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a
							href="conSelect.do?memNo=${memNo}&pageNum=${startPage+blockSize }">[다음]</a>
					</c:if>
				</div>
				<%-- <div style="text-align: right; ">
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

