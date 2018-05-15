<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	function closepopup() {
		self.close();
	}
</script>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<form>
	<div style="text-align: center; margin-top: 30px;">
		정말 삭제하시겠습니까?
		<p>
			<input type="button" value="삭제"
				onclick="location.href='appDeletePro.do?memNo=${memNo}&appDate=${appDate }&appTime=${appTime }'">
			<input type="button" value="취소" onclick="closepopup()">
	</div>
	<div style="text-align: center;">
		<p>꼭! 읽어보세요
		<p>< 예약 변경 안내 >
		<p>
			진료 예약 취소는 예약 하루 전일까지 가능합니다.<br>
			예약 수정을 원하시면 '재예약' 버튼을 눌러주세요.
		<p>
			<input type="button" value="재예약하기"
				onclick="location.href='appDeletePro2.do?memNo=${memNo}&appDate=${appDate }&appTime=${appTime }'">
		<p>* 예약 문의 1234 - 1234
	</div>
	</form>
</body>
</html>

