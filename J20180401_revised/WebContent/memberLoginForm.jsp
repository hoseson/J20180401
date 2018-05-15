<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		$("footer").load('footerForm.jsp');
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="300px" src="images/loginMenu1.jpg" />
		</div>
		<div align="center"
			style="width: 1000px; height: 200px; margin-top: 30px; padding: 30px 0 60px 0; background-color: #DCE6F2">
			<form action="memberLoginPro.do" align="center">
				<table width="400px" height="250px" align="center">
					<!-- id pw 입력 창, 확인 버튼  -->
					<tr>
						<td><h3>아이디</h3></td>
						<td><input type="text" name="id"></td>
					<tr>
						<td><h3>비밀번호</h3></td>
						<td><input type="password" name="pw"></td>
					<tr>
						<td colspan="2"><input type="submit" value=""
							style="width: 250px; height: 50px; background-image: url('images/loginBtn1.jpg'); background-position: 0px 0px;"></td>
					</tr>
					<tr>
						<td colspan="2"><a href="memberJoinForm.do">회원가입</a> / <a
							href="memberFindIdForm.jsp">아이디 찾기</a> / <a
							href="memberFindPwForm.jsp">비밀번호 찾기</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>