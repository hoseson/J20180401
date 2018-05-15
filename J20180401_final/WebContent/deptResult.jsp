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
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section>

	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/deptSearchMenu.jpg">
		</div>
		<!-- 중앙 메뉴 -->
		<!-- 여기에 입력해주세요.  -->
		<div
			style="width: 1000px; margin-top: 30px; background-color: #D9E5FF;">
			<div>
				<script>
					$(function() {
						//롤오버 효과 주기
						$(".word").mouseenter(function() {
							$(this).css("border", "3px solid navy");
						});
						$(".word").mouseleave(function() {
							$(this).css("border", "0px");
						});
						$(".icon").mouseenter(function() {
							$(this).css("background-color", "#003399");
						});
						$(".icon").mouseleave(function() {
							$(this).css("background-color", "#D9E5FF");
						});
					});
				</script>
				<form>
					<table>
						<tr>
							<td><h3>초성검색</h3></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㄱ">ㄱ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㄴ">ㄴ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㄷ">ㄷ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㄹ">ㄹ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅁ">ㅁ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅂ">ㅂ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅅ">ㅅ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅇ">ㅇ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅈ">ㅈ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅊ">ㅊ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅋ">ㅋ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅌ">ㅌ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅍ">ㅍ</a></td>
							<td class="word"
								style="font-size: 30px; border-radius: 50px; background-color: skyblue;"><a
								href="deptCharAction.do?cha=ㅎ">ㅎ</a></td>
						</tr>
					</table>
				</form>
			</div>
			<div>
				<table style="width: 100%">
					<c:set var="ct" value="1" />
					<c:forEach var="dept" items="${dept}">
						<c:if test="${ct%5==1}">
							<tr>
						</c:if>
						<td style="text-align: center;"><div>
								<a href="deptMainAction.do?deptNo=${dept.deptNo }"><img
									class="icon" src="deptIcon/${dept.deptNo }.jpg"
									style="width: 180px; height: 180px; padding: 5px;"></a>
							</div></td>
						<c:if test="${ct%5==0}">
							</tr>
						</c:if>
						<c:set var="ct" value="${ct+1}" />
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>