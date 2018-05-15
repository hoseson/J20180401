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
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section> <script type="text/javascript">
		function findInfo() {
			//정보찾기를 위한 팝업창 
			if (!frm.email.value) {
				alert("이메일을 입력해주세요");
				frm.email.focus();
				return false;
			}
			window.open("sendMail.do?email=" + frm.email.value + "&id="
					+ frm.id.value, "", "width=500 height=300");
		}
	</script>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/pwFindMenu.jpg" />
		</div>
		<div align="center"
			style="width: 1000px; margin-top: 30px; padding:30px 0 30px 0;  background-color: #DCE6F2;">
			<form action="" name="frm" align="center">
				<table align="center" style="width: 560px">
					<!-- id pw 입력 창, 확인 버튼  -->
					<tr>
						<td><h3>아이디</h3></td>
						<td><input type="id" name="id" required></td>
					</tr>
					<tr>
						<td><h3>이메일</h3></td>
						<td><input type="email" name="email"></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" value="인증번호 전송"
							onclick="findInfo()"
							style="width: 130px; height: 30px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 20px; color: white;">
							<a href="memberFindIdForm.jsp"><input type="button"
								value="아이디 찾기"
								style="width: 130px; height: 30px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 20px; color: white;"></a>
							<a href="memberLoginForm.do"><input type="button"
								value="로그인"
								style="width: 130px; height: 30px; background-color: #4f81bc; font-family: '휴먼모음T'; font-size: 20px; color: white;"></a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>