<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="loginCheck.jsp"%>
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
	function pwCheck() {//비밀번호 일치 여부 확인 메소드
		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;

		if (pw != pw2) {
			document.getElementById("pwBlank").innerHTML = "비밀번호가 일치하지 않습니다."
			return false;
		}
	}
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/memUpdate.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">
			<form action="memberUpdatePro.do" align="center" onsubmit="return pwCheck()">
				<table align="center">
					<!-- id pw 입력 창, 확인 버튼  -->
					<input type="hidden" name="memNo" value="${member.memno }">

					<tr>
						<td align="left"><h3>아이디</h3></td>
						<td><input type="text" name="id" value="${member.id }"
							disabled="disabled" size="55"></td>
					</tr>
					<tr>
						<td align="left"><h3>비밀번호 입력</h3></td>
						<td><input type="password" name="pw" id="pw" maxlength="20" required
							size="55" placeholder="비밀번호는 최대 20자입니다."></td>
					</tr>
					<tr>
						<td align="left"><h3>비밀번호 확인</h3></td>
						<td><input type="password" name="pw2" id="pw2" maxlength="20"
							required size="55"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id="pwBlank" style="color: red;"></span></td>
					</tr>
					<tr>
						<td align="left"><h3>이름</h3></td>
						<td><input type="text" name="name" value="${member.name }"
							disabled="disabled" size="55"></td>
					</tr>
					<tr>
						<td align="left"><h3>전화번호</h3></td>
						<td><input type="tel" name="tel" value="${member.tel }" placeholder="예)02-123-1234또는010-1234-1234"
							pattern="\d{2,3}-\d{3,4}-\d{4}"
							title="예)02-123-1234  예)010-1234-1234" required size="55"></td>
					</tr>
					<tr>
						<td align="left"><h3>주소</h3></td>
						<td><input type="text" name="addr" value="${member.addr }" required size="55"></td>
					</tr>
					<tr>
						<td align="left"><h3>이메일</h3></td>
						<td><input type="email" name="email" value="${member.email }" placeholder="예)abc@naver.com" required size="55"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="수정"
							style="width: 150px; height: 50px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 30px; color: white;"><input
							type="reset" value="다시쓰기"
							style="width: 150px; height: 50px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 30px; color: white;"></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>