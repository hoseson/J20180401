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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function writeForm() {
		var deptName = document.getElementById("deptName");
		var pageNum = document.getElementById("pageNum");
		var memNo = document.getElementById("memNo");
		if (memNo.value == null || memNo.value === "") {
			alert("로그인을 해주세요");
			location.href = "memberLoginForm.do";
		} else {
			$('#center').load(
					"conWriteAction.do?deptName=" + deptName.value
							+ "&pageNum=" + pageNum.value + "&memNo=" + memNo.value);
		}
	}
</script>



<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
.conlist{
   border-top: 5px solid lightgray;
   border-left: 5px solid lightgray;
   border-right: 5px solid lightgray;
   border-bottom:5px solid lightgray;
   border-collapse: collapse;
   width: 1000px; 
   background-color: white; 
}
.contitle{
	color:white;
}
th,.contitle2{
	border-bottom: 1px solid lightgray;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<input type="hidden" id="deptName" value="${deptName}">
	<input type="hidden" id="pageNum" value="${currentPage}">
	<input type="hidden" id="memNo" value="${memNo}">

	<section>
	<h3>${deptName}건강상담</h3>
	<div>
		<script type="text/javascript">
			$(function() {
				//롤오버 효과 주기
				$(".content").mouseenter(function() {
					$(this).css("background-color", "#D9E5FF");
				});
				$(".content").mouseleave(function() {
					$(this).css("background-color", "white");
				});
			});
		</script>
		<table class="conlist">
			<tr
				style="background-color: #4f81bd; height: 50px; font-weight: 300;">
				<th class="contitle">글번호</th>
				<th class="contitle">진료과</th>
				<th class="contitle">글제목</th>
				<th class="contitle">상태</th>
				<th class="contitle">등록일</th>
				<th class="contitle">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${totcnt>0}">
					<c:forEach var="list" items="${list}">
						<input type="hidden" value="${list.deptName}" name="deptName">
						<tr class="content" style="">
							<td class="contitle2" width="70px" style="text-align: center">${startNum}</td>
							<td class="contitle2" width="100px" style="text-align: center">${list.deptName}</td>
							<td class="contitle2" width="400px"><a
								href="javascript:$('#center').load('conConAction.do?memNo=${memNo}&consultNo=${list.consultNo}&pageNum=${currentPage}&startNum=${startNum}')">${list.subject}</a></td>
							<td class="contitle2" width="100px" style="text-align: center"><c:if
									test="${list.recontent != null}">답변완료</c:if> <c:if
									test="${list.recontent == null}">답변미등록</c:if></td>
							<td class="contitle2" width="50px" style="text-align: center">${list.regDate}</td>
							<td class="contitle2" width="50px" style="text-align: center">${list.readCount}</td>
						</tr>
						<c:set var="startNum" value="${startNum-1}"></c:set>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="text-align: center;" colspan="6">해당진료과 건강상담글이 존재하지
							않습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="6">
					<div style="height: 50px; margin-top: 30px; text-align: center;">
						<c:if test="${startPage > blockSize }">
							<a
								href='conListAction.do?deptName=${deptName}&pageNum=${startPage-blockSize}'>[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${startPage}" end="${endPage }">
							<a
								href="javascript:$('#center').load('conListAction.do?deptName=${deptName}&pageNum=${i}')">[${i}]</a>


						</c:forEach>
						<c:if test="${endPage < pageCnt }">
							<a
								href='conListAction.do?deptName=${deptName}&pageNum=${startPage+blockSize}'>[다음]</a>
						</c:if>
					</div>
					
				</td>
			</tr>
		</table>
		<div
						style="margin-right:30px;  margin-top: 30px; float: right;">
						<c:if test="${memNo ne '1'}">
						<input type="button" value="상담하기" onclick="writeForm();"
							style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
						</c:if>
						
		</div>
	</div>
	</section>
</body>
</html>

