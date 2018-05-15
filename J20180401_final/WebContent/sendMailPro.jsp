<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<script type="text/javascript">
	function sendMailClose() {//인증성공시 팝업창 닫기
		opener.document.frm.authentication.value = "인증완료";
		opener.document.frm.authentication.disabled = "disabled";//닫기 버튼을 누를시 인증번호 버튼 비활성화
		opener.document.frm.authcheck.value = "true";//본인인증 통과했을경우 트루값 부여
		opener.document.getElementById("authentication").style.background="#DCE6F2";
		var email = opener.document.getElementById("email");
		opener.document.frm.email2.value=email.value;
		opener.document.frm.email.disabled="disabled";
		window.close();
	}
	function buttonClose() {//인증 실패시 팝업창 닫기
		window.close();
	}
</script>
<body>
	<%
		String number = (String) request.getAttribute("number");//사용자가 입력한 난수
		String authNum = (String) request.getAttribute("authNum");//난수 메소드로부터 발생한 난수
		String authcheck = (String) request.getAttribute("authcheck");//본인인증에 강제성을 부여하기한 히든값
		if (number.equals(authNum)) {//사용자가 입력한 숫자와 생성된 난수번호의 일치여부
	%>
	<h2>인증에 성공하셨습니다. 감사합니다.</h2>
	<input type="button" value="닫기" onclick="sendMailClose()">
	<%
		} else {
	%>
	<h2>인증에 실패하셨습니다. 다시 인증해주세요.</h2>
	<input type="button" value="닫기" onclick="buttonClose()">
	<%
		}
	%>
</body>
</html>