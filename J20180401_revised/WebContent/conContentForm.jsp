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
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
.contitle{
	background-color: #4F81BC;
	color:white;
	text-align: center;
}
.contitle2{
	border: 1px solid lightgray;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/consultMenu.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">

			<form>
				<table
					style="width: 1000px; border: 5px solid lightgray; background-color: white;">
					<tr style="height: 30px;">
						<th class="contitle">글번호</th>
						<td class="contitle2" width="300">${startNum }</td>
						<th class="contitle">등록일</th>
						<td class="contitle2" width="300">${cdto.regDate }</td>
						<th class="contitle">조회수</th>
						<td class="contitle2" width="50">${cdto.readCount }</td>
					</tr>
					<tr style="height: 30px;">
						<th class="contitle">진료과</th>
						<td class="contitle2">${cdto.deptName }</td>
						<th class="contitle">글제목</th>
						<td class="contitle2" colspan="3">${cdto.subject }</td>
					</tr>
					<tr>
						<th class="contitle">상담 내용</th>
						<td colspan="5"><textarea style="resize: none;" rows="10"
								cols="120" readonly="readonly">${cdto.content }</textarea></td>
					</tr>
					<tr>
						<th class="contitle">답변</th>
						<td colspan="5"><textarea style="resize: none;" rows="10"
								cols="120" readonly="readonly"
								placeholder="답변 등록 대기 중입니다. 잠시만 기다려주세요!">${cdto.recontent }</textarea></td>
					</tr>
				</table>
				<div style="text-align: right; margin-right:30px; margin-top: 30px;">
					<input type="button" value="목록"
						onclick="location.href='conSelect.do?memNo=${memNo}'"
						style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
					<c:if test="${cdto.recontent == null}">
						<input type="button" value="수정"
							onclick="location.href='conUpdate.do?memNo=${memNo}&consultNo=${cdto.consultNo}&startNum=${startNum}'"
							style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
					</c:if>
					<c:if test="${cdto.recontent != null}">
					</c:if>
					<input type="button" value="삭제"
						onclick="window.open('conDelete.do?memNo=${memNo}&consultNo=${consultNo }', 
							'_blank', 'width=400, height=150, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no' );"
						style="width: 100px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
				</div>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>