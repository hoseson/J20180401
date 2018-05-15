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

<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>

	<section>
	<div>
		<script type="text/javascript">
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
		<!-- 중앙 메뉴 -->
		<!-- 여기에 입력해주세요.  -->
		<div>
			<c:set var="ct" value="1" />
			<c:set var="chk" value="2" />
			<table>
			<c:if test="${Fc ne null}">
				<h3>오늘의 의료진을 추천해주세요~</h3>
			</c:if>
				<c:forEach var="list" items="${list}">
					<c:if test="${ct%2==1}">
						<tr>
					</c:if>
					<div>
						<td>
							<c:if test="${list.docNo!=null}">
							<!--의사 정보 출력  -->
							<table border="3"
								style="width: 480px; height: 200px; background-color: white;">
								<tr>
									<td style="width: 200px; height: 160px"><img
										src="docImage/${list.docNo}.png"></td>
									<td style="width: 300px" colspan="2"><h2 style="text-align: center;">${list.docName}</h2><p><h3>[진료분야]</h3>
										
										<p>${list.cureName}</td>
								</tr>
								<tr>
									<td class="docmenu"
										style="width: 120px; height: 40px; text-align: center;"><div>
											<a
												href="javascript:$('#docMain').load('docFavor.do?docNo=${list.docNo}&chk=${chk}&memNo=${memNo}')">감사해요</a>
										</div></td>
									<td class="docmenu" style="width: 130px; text-align: center;"><div>
											<a href="docSelectAction.do?docNo=${list.docNo}&pagechk=${pagechk}">상세소개</a>
										</div></td>
									<td class="docmenu" style="width: 130px; text-align: center;"><div>
											<a
												href="appForm.do?docName=${list.docName }">진료예약</a>
										</div></td>
								</tr>
							</table>
							</c:if>
						</td>
					</div>
					<c:if test="${ct%2==0 }">
						</tr>
					</c:if>
					<c:set var="ct" value="${ct+1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
	</section>

</body>
</html>