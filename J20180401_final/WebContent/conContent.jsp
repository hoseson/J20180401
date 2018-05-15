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
	function aa() {
		var consultNo = document.getElementById("consultNo");
		var pageNum = document.getElementById("pageNum");
		var startNum = document.getElementById("startNum");
		var recontent = document.getElementById("recontent");
		$('#center').load(
				"conMangeAction.do?pageNum=" + pageNum.value + "&consultNo="
						+ consultNo.value + "&startNum=" + startNum.value
						+ "&recontent=" + recontent.value);

	};
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

	<%
		//로그인 되었는지 확인 하기 위한 세션
		String manage = (String) request.getAttribute("manage");
		String memNo = (String) session.getAttribute("memNo");
		String conmemNo = (String) request.getAttribute("cmemNo");
		System.out.println("로그인회원" + memNo);
		System.out.println("작성회원" + conmemNo);
		if (memNo == null) {
	%>
	<script>
		alert("로그인을 해주세요");
		location.href = "memberLoginForm.do";
	</script>
	<%
		} else if (!(manage.equals("M")) && !(memNo.equals(conmemNo))) {
	%>
	<script>
		alert("접근하실수없습니다.");
		$('#center').load("conListAction.do?deptName=${con.deptName}");
	</script>
	<%
		}
	%>

	<section>
	<h3>${con.deptName}건강상담</h3>
	<p>
	<form action="conMangeAction.do">
		<input type="hidden" name="consultNo" id="consultNo"
			value="${con.consultNo}"> <input type="hidden" name="pageNum"
			id="pageNum" value="${pageNum}"> <input type="hidden"
			name="startNum" id="startNum" value="${startNum}"> <input
			type="hidden" name="deptName" value="${con.deptName}"> <input
			type="hidden" name="subject" value="${con.subject}"> <input
			type="hidden" name="memNo" id="memNo" value="${memNo}">
		<table  style="width: 1000px; background-color: white; border:5px solid lightgray; "
			>
			<tr style="height: 30px">
				<th class="contitle">글번호</th>
				<td class="contitle2"width="300">${startNum}</td>
				<th class="contitle">등록일</th>
				<td class="contitle2"width="300">${con.regDate}</td>
				<th class="contitle">조회수</th>
				<td class="contitle2"width="50">${con.readCount}</td>
			</tr>
			<tr style="height: 30px">
				<th class="contitle">진료과</th>
				<td class="contitle2">${con.deptName}</td>
				<th class="contitle">글제목</th>
				<td class="contitle2" colspan="3">${con.subject}</td>
			</tr>
			<tr>
				<th class="contitle">상담내용</th>
				<td colspan="5"><textarea rows="10" cols="120"
						style="resize: none" readonly>${con.content}</textarea></td>
			</tr>
			<tr>
				<th class="contitle">답변</th>
				<td colspan="5"><c:choose>
						<c:when test="${(con.recontent==null)&&manage.equals('M')}">
							<textarea rows="10" cols="120" id="recontent" name="recontent"
								style="resize: none">${con.recontent}</textarea>
						</c:when>
						<c:otherwise>
							<textarea rows="10" cols="120" style="resize: none" readonly placeholder="답변 등록 대기 중입니다. 잠시만 기다려주세요!">${con.recontent}</textarea>
						</c:otherwise>
					</c:choose></td>
			</tr>
	
		</table>
		<div style="text-align: right; margin-top: 30px; margin-right: 30px;"><input type="button" value="목록"
					onclick="$('#center').load('conListAction.do?pageNum=${pageNum}&deptName=${con.deptName }')"
					style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
					<c:if test="${(con.recontent==null)&&manage.equals('M')}">
						<input type="button" value="등록하기" onclick="aa();"
							style="width: 120px; height: 30px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
				</c:if></div>
	</form>
	</section>
</body>
</html>