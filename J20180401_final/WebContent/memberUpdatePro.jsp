<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="loginCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<!-- 업데이트 성공일 때  -->
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("수정 완료");
			location.href="mainForm.do";
		</script>
	</c:if>
	<!-- 수정 실패 -->
	<c:if test="${result <= 0 }">
		<script type="text/javascript">
			alert("수정 실패");
			location.href="mypageForm.do";
		</script>
	</c:if>
</body>
</html>