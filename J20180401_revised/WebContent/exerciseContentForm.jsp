<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp')
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<!-- 1개의 게시물 보여주는 소스 -->
		<div>
			<img width="1000px" height="150px" src="images/exerciseinfo.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF;">
			<table width="800px" align="center">
				<tr>
					<td>No.${board.boardno }</td>
					<td>작성일 : ${board.regdate }</td>
					<td align="right">조회수 : ${board.readcount}</td>
				</tr>
				<tr>
					<td colspan="3"><h3>[운동정보] ${board.subject }</h3>
						</h3></td>
				</tr>
				<tr>
					<td colspan="3"><textarea cols="110" rows="30"
							disabled="disabled"
							style="background-color: white; resize: none;">${board.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="3"></td>
				</tr>
				<!-- 이전페이지 다음페이지 보는 링크 -->
				<tr>
					<p>
						<c:if test="${prevPage.boardno != null}">
							<td colspan="3"><a
								href="boardForm.do?boardType=${boardType }&boardno=${prevPage.boardno }&subject=${prevPage.subject}&content=${prevPage.content}&regdate=${prevPage.regdate}">▲이전
									페이지 / [운동정보] ${prevPage.subject }</a></td>
						</c:if>
					</p>
				</tr>
				<tr>
					<p>
						<c:if test="${nextPage.boardno != null}">
							<td colspan="3"><a
								href="boardForm.do?boardType=${boardType }&boardno=${nextPage.boardno }&subject=${nextPage.subject}&content=${nextPage.content}&regdate=${nextPage.regdate}">▼다음
									페이지 / [운동정보] ${nextPage.subject }</a></td>
						</c:if>
					</p>
				</tr>
				<tr>
					<p>
					<td colspan="3"><a
						href="allBoardForm.do?boardType=${boardType }">목록 보기</a> <c:if
							test="${manage =='M' }">
							<input type="button" value="게시물 삭제"
								onclick="location.href='deleteContentPro.do?boardType=${boardType}&boardno=${board.boardno }&regdate=${board.regdate }'">
							<input type="button" value="게시물 수정"
								onclick="location.href='updateContentForm.do?boardType=${boardType}&boardno=${board.boardno }&subject=${board.subject }&content=${board.content }'">
						</c:if></td>
					</p>
				</tr>
			</table>
		</div>
	</section>
	<footer> </footer>
</body>
</html>
