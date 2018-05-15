<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function cancel() {
		self.close();
	}
</script>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<div style="text-align: center; margin-top: 30px;">
		<h2>탈퇴하시겠습니까?</h2>
		<input type="button" value="회원 탈퇴"
			onclick="location.href='memberDeletePro.do?id=${id}'"><input
			type="button" value="취소" onclick="cancel();">
	</div>
</body>
</html>