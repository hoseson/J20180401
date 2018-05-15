<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="manageCheck.jsp"%>
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
		$("footer").load('footerForm.jsp')
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<link href="css/mainStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header></header>
	<section>
	<div align="center">
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF;">
			<p>
			<h3>게시물 쓰기</h3>
			</p>
			<div>
				<form action="createContentPro.do">
					<table align="center">
						<input type="hidden" name="boardType" value="${boardType }">
						<tr>
							<td>글 종류</td>
							<td><select name="type" style="height: 30px">
									<option value="공지사항">공지사항</option>
									<option value="뉴스">뉴스</option>
									<option value="학회">학회</option>
							</select></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" width="500" size="98"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="content" cols="100" rows="30"></textarea>
						</tr>
						<tr>
							<td align="center" colspan="2"><input type="submit"
								value="글쓰기"><input type="reset" value="다시 쓰기"></td>
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