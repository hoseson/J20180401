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
<style type="text/css">
table td {
	border: 5px solid black;
}

section .board {
	width: 1000px;
	padding-top: 50px;
}

section .board .box {
	width: 250px;
	height: 200px;
	padding: 20px;
	background-color: white;
}

section .board .subject {
	width: 250px;
	height:50px;
	font-size: 25px;
	font-weight: 600;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

section .board .content {
	width: 250px;
	height: 100px;
	white-space: normal;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/notice.jpg">
		</div>
		<!-- 게시물 검색  -->
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF;">
			<div align="center" style="margin-top: 30px;" class="search">
				<!-- 관리자일 경우 글쓰기 버튼 보이기  -->
				<c:if test="${manage == 'M' }">
					<input type="button" value="글 쓰기"
						onclick="location.href='createContentForm.do?boardType=${boardType}'">
				</c:if>
				<p>
				<h3>게시물 검색</h3>
				</p>
				<form action="allBoardForm.do">
					<input type="hidden" name="boardType" value="${boardType }">
					<select style="height: 25px" name="type">
						<option value="">전체</option>
						<option value="공지사항">공지사항</option>
						<option value="뉴스">뉴스</option>
						<option value="학회">학회</option>
					</select> <select style="height: 25px" name="subcon">
						<option value="">전체</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select> <input type="text" name="search" placeholder="검색어를 입력하세요."> <input type="submit"
						value="검색">
				</form>
			</div>
			<div class="board">
				<script type="text/javascript">
					$(function() {
						$(".box").mouseenter(function() {
							$(this).css("background-color", "#D4F4FA");
						});
					});
					$(function() {
						$(".box").mouseleave(function() {
							$(this).css("background-color", "white");
						});
					});
				</script>
				<!-- 게시물 나오는 부분  -->
				<table align="center">
					<c:set var="cnt" value="1" />
					<c:forEach var="li" items="${list}">
						<c:if test="${cnt % 3 == 1 }">
							<tr>
						</c:if>
						<td><div class="box"
								onclick="location.href='boardForm.do?boardType=notice&boardno=${li.boardno }&type=${li.type}&subject=${li.subject }&content=${li.content }&regdate=${li.regdate }&readcount=${li.readcount }'">
								<div class="subject">[${li.type}] ${li.subject }</div>
								<div class="content">${li.content}</div>
								<p>등록일 : ${li.regdate} 조회수 : ${li.readcount}</p>
							</div></td>

						<c:if test="${cnt % 3 == 0 }">
							</tr>
						</c:if>
						<c:set var="cnt" value="${cnt + 1 }" />
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>