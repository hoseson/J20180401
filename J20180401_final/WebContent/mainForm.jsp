<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
section {
	z-index: 100;
}

section .center {
	width: 1000px;
	height: 1050px;
}

section .center .fadeShow {
	width: 1000px;
	height: 500px;
}

section .center .fadeShow img {
	width: 1000px;
	height: 500px;
	margin-left: -180px;
	position: absolute;
}

section .center .fadeShow .active {
	z-index: 1;
}

section .center .appoint {
	width: 1000px;
	height: 300px;
	margin-top: 10px;
	background-color: #DCE6F2;
}

section .center .appoint div {
	width: 200px;
	height: 200px;
	margin: 20px;
	margin-top: 40px;
	float: left;
	padding-left: 7px;
}

section .center .appoint .centerMenu {
	width: 200px;
	height: 200px;
}

section .center .appoint .centerBtn {
	width: 40px;
	height: 40px;
	margin-top: -200px;
	margin-left: -100px;
	position: absolute;
}

section .center .board {
	width: 1000px;
	height: 230px;
	margin-top: 10px;
}

section .center .board .notice {
	width: 400px;
	height: 230px;
	float: left;
	background-color: #DCE6F2;
}

section .center .board .notice .subject {
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

section .center .board .guide {
	width: 580px;
	height: 230px;
	float: right;
	background-color: #DCE6F2;
}

section .center .board .guide div {
	width: 120px;
	height: 120px;
	margin: 5px;
	margin-left: 15px;
	margin-right: 10px;
	float: left;
}

section .center .board .guide img {
	width: 120px;
	height: 120px;
}
</style>
<title>JOONGANG INFO MEDICAL CENTER에 오신 것을 환영합니다.</title>
</head>
<body>
	<header></header>
	<section>
	<div align="center" class="mainWrapper">
		<div class="center">
			<!-- 그림 화면 전환 클래스  -->
			<div class="fadeShow">

				<img class="active" src="images/familyHope.jpg" alt="familyHope" /> <img
					src="images/cancerFacility.jpg" alt="cancerFacility" /> <img src="images/waterCampaign.jpg"
					alt="waterCampaign" />
			</div>
			<script>
				//화면 전환하는 jquery
				var showImg, nextImg;
				function fadeInOut() {
					showImg = $(".fadeShow img:eq(0)");
					nextImg = $(".fadeShow img:eq(1)");
					nextImg.addClass("active");
					nextImg.css("opacity", "0").animate({
						opacity : 1
					}, 4000, function() {
						$(".fadeShow").append(showImg);
						showImg.removeClass("active");
					});
				}
				var timer = setInterval("fadeInOut()", 4000);
				$("div.fadeShow").hover(function() {
					clearInterval(timer)
				}, function() {
					timer = setInterval("fadeInOut()", 4000);
				});

			</script>
			<div class="appoint">
				<!-- 센터 이미지 버튼  -->
				<div class="m1">
					<!--  -->
					<a href="deptAction.do"><img class="centerMenu" src="images/centerMenu1.jpg" />
					<!--  -->
					<img class="centerBtn"
						src="images/searchIcon.png" /></a>
				</div>
				<!--  -->
				<div class="m2">
					<a href="docMainAction.do"><img class="centerMenu" src="images/docSearch.jpg" style="opacity:0.5"/>
					<!--  -->
					<img class="centerBtn"
						src="images/searchIcon.png" /></a>
				</div>
				<!--  -->
				<div class="m3">
					<a href="appForm.do"><img class="centerMenu" src="images/centerMenu3.jpg" />
					<!--  -->
					<img class="centerBtn"
						src="images/searchIcon.png" /></a>
				</div>
				<!--  -->
				<div class="m4">
					<a href="appCheck.do?memNo=${memNo }"><img class="centerMenu" src="images/centerMenu_4.jpg" />
					<!--  -->
					<img class="centerBtn"
						src="images/searchIcon.png" /></a>
				</div>
			</div>
			<div class="board">
				<div class="notice">
					<table width="400px" height="200px">
						<caption>

							<a href="allBoardForm.do?boardType=notice"><font size="5pt"
								style="font-family: '휴먼모음T';">공지사항/뉴스/학술행사</font></a>

						</caption>
						<c:forEach var="li" items="${list }" begin="0"
							end="${boardSize - 1 }">
							<!-- 최신 게시물부터 5개 출력하기  -->
							<tr>
								<td><div style="width: 80px;" class="type">
										<font size="3pt">[${li.type }]</font>
									</div></td>
								<td><div class="subject">
										<a
											href="boardForm.do?boardType=notice&boardno=${li.boardno }&type=${li.type}&subject=${li.subject }&content=${li.content }&regdate=${li.regdate }&readcount=${li.readcount }">
											<font size="3pt">${li.subject }</font>
										</a>
									</div></td>
								<td><font size="3pt">${li.regdate }</font></td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="guide">
					<h3>
						<p align="center">
							<a href="guideForm.do?pageNum=1"><font size="5pt"
								style="font-family: '휴먼모음T';"> 병원 가이드</font> </a>
						</p>
					</h3>
					<div class="m1">
						<a href="guideForm.do?pageNum=1"><img
							src="images/subMenu1.jpg" /></a>
					</div>
					<!--  -->
					<div class="m2">
						<a href="guideForm.do?pageNum=2"><img
							src="images/subMenu2.jpg" /></a>
					</div>
					<!--  -->
					<div class="m3">
						<a href="guideForm.do?pageNum=3"><img
							src="images/subMenu3.jpg" /></a>
					</div>
					<!--  -->
					<div class="m4">
						<a href="conSelect.do?memNo=${memNo }"><img
							src="images/subMenu4.jpg" /></a>
						<!-- 	<a href="deptAction.do"><img src="images/subMenu4.jpg" /></a> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<footer></footer>
</body>
</html>