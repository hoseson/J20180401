
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="loginCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>

<script type="text/javascript">
	function aa() {
		var content = document.getElementById("content");
		var deptName = document.getElementById("deptName");
		var pageNum = document.getElementById("pageNum");
		var memNo = document.getElementById("memNo");
		var subject = document.getElementById("subject");
		$('#center')
				.load(
						"conWriteProAction.do?pageNum=" + pageNum.value
								+ "&deptName=" + deptName.value + "&content="
								+ content.value + "&memNo=" + memNo.value
								+ "&subject=" + subject.value);

	};
</script>

<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<section>
	<h3>${deptName}상담하기</h3>

	<form>
		<input type="hidden" name="pageNum" id="pageNum" value="${pageNum}">
		<input type="hidden" name="deptName" id="deptName" value="${deptName}">
		<input type="hidden" name="memNo" id="memNo" value="${memNo}">

		<table
			style="width: 750px; border: 5px solid lightgray; background-color: white;">
			<tr>
				<th>진료과</th>
				<td><input type="text" value="${deptName}" readonly></td>
				<th>글제목</th>
				<td colspan="3"><input type="text" size="50" id="subject"
					name="subject" required></td>
			</tr>
			<tr>
				<th>상담내용</th>
				<td colspan="5"><textarea rows="10" cols="90" id="content"
						name="content" style="resize: none" required></textarea></td>
			</tr>

			<tr style="text-align: right">
				<td colspan="4"><input type="button" value="목록"
					onclick="$('#center').load('conListAction.do?pageNum=${pageNum}&deptName=${deptName }')"
					style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
					<input type="button" value="등록하기" onclick="aa();"
					style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
			</tr>
		</table>
	</form>
	</section>


</body>
</html>

