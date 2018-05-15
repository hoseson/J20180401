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
	<section><!-- 병원 가이드 // 병원 이용 안내 페이지 -->
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/useinfo.jpg">
		</div>
		<div align="justify"
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF">
			<p>
			<h3>입원 시 준비물품</h3>
			</p>
			<div style="font-size: 15px;">
				<pre>비누, 치약, 칫솔, 수건, 미끄럽지 않은 실내화, 화장지, 물컵/물통, 보호자 침구류 등
입원 전 복용하던 약이 있는 경우에는 약과 약물정보지(약 처방전 또는 약 이름이 써있는 약봉투)를 가지고 오십시오.
필요하신 물품은 병원 내 지하 1층 편의점에서 구입하실 수 있습니다.
보호자용 침구류는 제공하지 않으므로 개인적으로 준비해주시기 바랍니다.
다음 물품은 사용이 제한됩니다. 
-감염예방 : 가습기
-화재 및 화상예방 : 커피포트, 전기장판, 찜질팩 등</pre>
			</div>
			<br>
			<p>
			<h3>입원 일자 안내</h3>
			</p>
			<div style="font-size: 15px;">
				<p>입원 예정일은 입원이 확정된 예약일이 아닙니다.
				<p>
				<pre>
병실은 입원 당일 병실 사정, 퇴원환자의 상황에 따라 결정됩니다.
입원 예정일보다 입원 날짜가 늦어질 수도 있습니다. (부득이 한 경우 수술/시술이 연기될 수 있습니다.)</pre>
			</div>
			<br>
			<p>
			<h3>입원 병실 등급 안내</h3>
			</p>
			<div style="font-size: 15px;">
				<p>보험적용병실, 상급병실(2인실, 1인실, 특실)로 운영되고 있습니다.</p>
				<pre>
병실 배정은 현재 입원 중인 환자에게 우선적으로 병실을 이동한 후 남는 병실로 진행합니다.
5·6인실을 희망하시더라도 입원대기 순서에 따라 상급병실(2인실, 1인실, 특실)로 배정 될 수 있습니다.
입원 수속 시 희망하는 병실을 신청하시면 먼저 입원 중인 환자 순서에 의해 전실 진행합니다.</pre>
			</div>
			<br>
			<p>
			<h3>입원실 확인 방법</h3>
			</p>
			<div style="font-size: 15px;">
				<pre>입원 예정 당일 연락 드립니다. 
※ 단, 휴일 입원 예정자는 1~2일전 미리 연락 드립니다. 

문자전송 : 입원 예약 시 확인된 휴대폰으로 문자 전송 됩니다.

전화연락
아침8시에서 11시사이에 병실현황 파악, 입원환자 병실이동 다음 아침11시에서 오후1시 사이 배정병실확인 (문자,홈페이지,전화)
다음 오후1시 이후 입원수속 및 병실입실

※ 13시 전후로 연락이 없다면 담당자에게 문의하십시오.</pre>
			</div>
			<br>
			<p>
			<h3>의사의 회진시간</h3>
			</p>
			<div style="font-size: 15px;">
				<p>입원 시 담당 의사는 정해진 시간 내 하루에 1회 정도 병실을 방문하며, 회진 시간에는 현재 상태, 진단,
					치료 계획 및 치료결과, 추후 계획 등에 대하여 설명을 들으실 수 있습니다. 치료와 관련하여 궁금하신 내용은 회진 시간에
					의료진에게 문의해 주십시오. 회진 시간은 각 병동 게시판에 안내하고 있으니 참고하여 주시기 바랍니다. ※ 의사 회진
					시간은 경우에 따라 수술, 검사 및 응급 상황 등으로 변경될 수 있습니다.</p>
			</div>
			<br>
			<p>
			<h3>간호사의 병실 순회(해피라운딩)</h3>


			<div style="font-size: 15px;">
				<p>간호사는 정기적으로 병실을 방문하여 환자의 상태를 확인하고 있습니다. 불편한 점이 있거나 도움이 필요하신
					경우에는 병실 순회(해피라운딩) 시간에 간호사에게 말씀해주십시오. 만약 환자 상태에 변화가 있거나, 간호사의 도움이 즉시
					필요한 경우에는 간호사 호출기를 이용해 주시기 바랍니다.</p>
			</div>
			<br>
			<p>
			<h3>찾아가는 서비스(병동 원무 매니저)</h3>
			</p>
			<div style="font-size: 15px;">
				<pre>환자(보호자)분들의 편의를 위하여 원무창구를 병원업계 최초로 운영하고 있습니다.
병동 내 1:1 전담 직원 상주로 입/퇴원 수속, 중간 진료비 수납, 진료비 상담, 제증명 발급, 퇴원 후 외래 예약, 
기타 제안 및 문의사항이 가능합니다.

근무 위치: 각 병동 원무 창구 (본관 일부 층 및 별관 제외)
이용 시간: 평일 08:30 ~ 17:00 
※  이후 1층 원무창구
평일 : 17:00 ~ 19:00
토요일 : 08:00 ~ 16:00
공휴일 : 08:00 ~ 17:00 그 외 응급실 원무창구
입원 전 복용약
입원 전 복용하던 약이 있는 경우에는 약과 약물정보지(약처방전 또는 약 이름이 써있는 약봉투)를 간호사에게 전달해 주시기 바랍니다.

복용이 필요하다고 결정된 약은 병원에서 처방하여 드립니다.</pre>
			</div>
			<br>
			<p>
			<h3>병실 생활 에티켓</h3>
			</p>
			<div style="font-size: 15px;">
				<pre>소음은 환자의 치료와 회복에 방해가 됩니다.
병실 내 환자의 치료로 인한 의료행위나 의료기기와 관련된 소음이 발생되는 경우에 양해를 부탁 드립니다.
감염/안전사고 예방을 위해 병실 내 침상이동은 제한합니다.
귀마개를 사용하면 소음으로 인한 불편감 완화에 도움이 되오니 적극 활용해 주십시오.
조용한 병실 환경을 위해 다음 사항을 지켜주세요.</pre>
			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>