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
	<div style="text-align: center; margin-top: 30px;">
		정말 삭제하시겠습니까?
		<p>
			<input type="button" value="삭제"
				onclick="location.href='conDeletePro.do?memNo=${memNo}&consultNo=${consultNo }'">
			<input type="button" value="취소" onclick="closepopup()">
	</div>
</body>
</html>
