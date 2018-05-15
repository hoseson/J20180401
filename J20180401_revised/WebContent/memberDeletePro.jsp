<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="loginCheck.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result>0 }">
		<script type="text/javascript">
			//로그인 제거
		<%session.invalidate();%>
			window.close();
			opener.location.reload();
			window.opener.location = "mainForm.do";
		</script>
	</c:if>
	<c:if test="${result<=0 }">
		<script type="text/javascript">
			location.href = "error.jsp";
		</script>
	</c:if>
</body>
</html>