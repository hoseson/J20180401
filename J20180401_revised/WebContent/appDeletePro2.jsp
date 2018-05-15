<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
<c:if test="${result == 1}">
	<script type="text/javascript">
	alert("예약이 삭제되었습니다. 다시 예약 페이지로 이동합니다.");
	window.close();
	opener.location.reload();
	window.opener.location = "appForm.do?memNo=${memNo}";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
	alert("삭제못해");
	</script>
</c:if>
</body>
</html>