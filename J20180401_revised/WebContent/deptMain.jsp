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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
	});
</script>
<script type="text/javascript">
	$(function() {
		$('#center').load("deptInformAction.do?deptNo=${dept.deptNo}");
	});
	function dept() {
		$('#center').load("deptInformAction.do?deptNo=${dept.deptNo}");

	};
	function doct() {
	
		var pagechk=document.getElementById("pagechk");
		$('#center').load("docListAction.do?deptNo=${dept.deptNo}&pagechk="+pagechk.value);
	};
	function cont() {
		$('#center').load("conListAction.do?deptName=${dept.deptName}");

	};
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<input type="hidden" id="pagechk" value="dept">
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/deptSearchMenu.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;">
			<div align="center" style="margin-top: 30px;">
				<!-- 중앙 메뉴 -->
				<!-- 여기에 입력해주세요.  -->
				<script>
					$(function() {
						//롤오버 효과 주기
						$(".docmenu").mouseenter(function() {
							$(this).css("background-color", "#B2EBF4");
						});
						$(".docmenu").mouseleave(function() {
							$(this).css("background-color", "white");
						});
					});
				</script>
				<form>
					<table style="height: 50px; font-size: 20px; ">
						<tr>
						<td style="width: 300px;" ><h2>${dept.deptName}</h2></td>
						<td style="width: 600px; text-align: right;">
						<input type="button" value="진료예약" onclick="location.href='appForm.do?deptNo=${dept.deptNo}'"
						style="width: 120px; height: 50px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
						<input type="button" value="진료과전체" onclick="location.href='deptAction.do'"
						style="width: 120px; height: 50px; background-color: #4F81BC; font-family: '휴먼모음T'; font-size: 20px; color: white;">
						</td>
						</tr>
					</table>		
					<table 
						style="width: 800px; height: 50px; font-size: 20px; background-color: white; text-align: center;">
						<tr>
							<td class="docmenu"><a href="javascript:dept()">진료과안내</a></td>
							<td class="docmenu"><a href="javascript:doct()">의료진</a></td>
							<td class="docmenu"><a href="javascript:cont()">건강상담</a></td>
							<td style="width:400px;"></td>
						</tr>
					</table>
				</form>
			</div>
			<div id="center">
				<!--내용표시  -->
			</div>
			<br> <br> <br>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>
