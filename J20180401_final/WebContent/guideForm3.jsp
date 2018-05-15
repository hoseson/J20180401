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
		$("footer").load('footerForm.jsp')
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section><!-- 병원 가이드 // 진료 안내 페이지 -->
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/mediinfo.jpg">
		</div>
		<div align="justify"
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF">
			<p>
			<h3>step01. 요양급여의뢰서 발급</h3>
			<div style="font-size: 15px;">
				</p>
				<p>중앙정보병원은 의료전달체계가 필요한 종합전문요양기관으로 1단계 진료기관 (병.의원)에서 발급한 요양급여
					의뢰서(진료의뢰서)나 건강검진, 건강진단 결과서를 제출해야 의료보험적용을 받으실 수 있습니다.</p>
			</div>
			<br>

			<p>
			<h3>step02. 진료예약</h3>
			</p>
			<div style="font-size: 15px;">
				<p>전화예약 02 - 3410-3000</p>
				<p>각 협력병원 및 병·의원에서 삼성서울병원 의뢰서(양식확인)을 발급 받으신 분들께서는 진료의뢰서내의 전화번호를
					참고하시기 바랍니다.</p>

				<br>

				<p>방문예약</p>
				<p>예약가능시간 : 08:00~18:00 (토요일 : 08:00~12:00) 응급실은 24시간 가능</p>
			</div>
			<br>

			<p>
			<h3>step03. 진료일 내원</h3>
			</p>
			<div style="font-size: 15px;">
				<p>요양급여의뢰서(진료의뢰서)와 건강보험증(구의료보험증)을 반드시 지참하시고 예약시간 10분 전에 해당 진료과에
					직접 방문하시면 됩니다. 타 병원 영상자료(CD, 필름)는 해당 진료과에 진료시간 30분 전까지 제출하시기 바랍니다.
					(응급실은 24시간 가능)</p>
			</div>
			<br>

			<p>
			<h3>step04. 진료/입원</h3>
			</p>
			<div style="font-size: 15px;">
				<p>이후 절차는 다음과 같이 진행됩니다.</p>
			</div>
			<img width="800px" height="600px" style="margin-left: 90px;"
				src="images/outpatient-chart.gif">
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>