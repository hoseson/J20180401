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
<style type="text/css">
.menu .mu, .menu img {
	width: 250px;
	height: 250px;
}

.menu .mu {
	margin: 20px;
	border: 5px solid white;
	float: left;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section> <script>
		$(function() {
			$(".mu").mouseenter(function() {
				$(this).css("border", "5px solid yellow");
			});
			$(".mu").mouseleave(function() {
				$(this).css("border", "5px solid white");
			});
		});
	</script>
	<div align="center">
		<img width="1000px" height="150px" src="images/mypage1.jpg">
		<div class="menu"
			style="width: 1000px; height: 600px; padding: 30px 0 30px 0; background-color: #D9E5FF; margin-top: 30px;">
			<div align="center" style="width: 600px; height: 300px;">
				<div class="mu">
					<a href="memberUpdateForm.do?id=${id }"><img
						src="images/mypageMenu1.jpg"></a>
				</div>
				<div class="mu">
					<a
						href="javascript:window.open('memberDeleteCheckForm.jsp?id=${id }','_blank','width=400, height=150,toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no');"><img
						src="images/mypageMenu2.jpg"></a>
					<%-- <a href="memberDeletePro.do?id=${id }"><img
						src="images/mypageMenu2.jpg"></a> --%>
				</div>
			</div>
			<div align="center" style="width: 600px; height: 300px;">
				<div class="mu">
					<a href="appCheck.do?memNo=${memNo }"><img
						src="images/mypageMenu3.jpg"></a>
				</div>
				<div class="mu">
					<a href="appHistory.do?memNo=${memNo }"><img
						src="images/mypageMenu4.jpg"></a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>