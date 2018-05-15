<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div class="header0">
			<%
				//로그인 되었는지 확인 하기 위한 세션
				String id = (String) session.getAttribute("id");
			%>
			<div class="header1" style="margin-bottom:10px">
				<!-- 최상단  -->

				<%
					//로그인중일 경우 로그아웃 링크 제공, 아닐 경우 로그인 링크
					if (id == null || id.equals("")) {
				%>
				<div style="float: right; margin-left: 10px;">
					<a href="memberJoinForm.do">회원가입</a>
				</div>
				<div style="float: right;">
					<a href="memberLoginForm.do">로그인</a>
				</div>
				<%
					} else {
				%>
				<div style="float: left;">
					<%=id%>
					님 환영합니다.
				</div>
				<div style="float: right; margin-left: 10px;">
					<a href="memberLogoutPro.do">로그아웃</a>
				</div>
				<div style="float: right;">
					<a href="mypageForm.do">마이페이지</a>
				</div>
				<%
					}
				%>

			</div>
			<script>
				//상단 메뉴 엔터 & 리브 시 작동하는 JQuery
				//상단 메뉴 글씨 및 밑줄 만들기

				$(".mn").mouseenter(
						function() {
							$(".sub:not(:animated)", this).slideDown("fast");
							$(".title", this).css("color", "#368AFF");
							$(".title", this).css("border-bottom",
									"3px solid #00006F");
						}).mouseleave(50, function() {
					$(".sub", this).slideUp();
					$(".title", this).css("color", "black");
					$(".title", this).css("border-bottom", "none");
				});
				$(".mn a").mouseenter(function() {
					$(this).css("color", "#6799FF");
				});
				$(".mn a").mouseleave(function() {
					$(this).css("color", "black");
				});
			</script>
			<div class="header2">
				<!-- 상단 메뉴  -->
				<div class="logo">
					<a href="mainForm.do"><img src="images/headerLogo.png"></a>
				</div>
				<div class="menu">
					<div class="mn">
						<a href="guideForm.do?pageNum=1" class="title">병원안내</a>
						<div class="sub">
							<p>
								<a href="guideForm.do?pageNum=1">오시는 길</a>
							</p>
							<p>
								<a href="guideForm.do?pageNum=2">병원 이용 안내</a>
							</p>
							<p>
								<a href="guideForm.do?pageNum=3">진료 안내</a>
							</p>
							<p>
								<a href="conSelect.do?memNo=${memNo }">건강 상담</a>
								<!-- <a href="deptMainAction.do">건강 상담</a> -->
							</p>
							<p>
								<a href="allBoardForm.do?boardType=notice">공지사항</a>
							</p>

						</div>
					</div>
					<div class="mn">
						<a href="allBoardForm.do?boardType=disease" class="title">건강정보</a>
						<div class="sub">
							<p>
								<a href="allBoardForm.do?boardType=disease">질병 정보</a>
							</p>
							<p>
								<a href="allBoardForm.do?boardType=nutrition">영양 정보</a>
							</p>
							<p>
								<a href="allBoardForm.do?boardType=exercise">운동 정보</a>
							</p>

						</div>
					</div>
					<div class="mn">
						<a href="appCheck.do?memNo=${memNo }" class="title">정보조회</a>
						<div class="sub">
							<p>
								<a href="appCheck.do?memNo=${memNo }">예약 정보 조회</a>
							</p>
							<p>
								<a href="appHistory.do?memNo=${memNo }">지난 기록 조회</a>
							</p>
						</div>
					</div>
					<div class="mn">
						<a href="appForm.do" class="title">건강진료</a>
						<div class="sub">
							<p>
								<a href="deptAction.do">진료과 검색</a>
							</p>
							<p>
								<a href="docMainAction.do">의료진 검색</a>
							</p>
							<p>
								<a href="appForm.do">진료 예약</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>