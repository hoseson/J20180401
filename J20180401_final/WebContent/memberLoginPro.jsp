<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<c:if test="${result == 0}">
		<!-- pw 불일치, 이전 화면 돌아가기 -->
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == -1}">
		<!-- id 없음, 이전 화면 돌아가기 -->
		<script type="text/javascript">
			alert("아이디가 없습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${result == 1}">
		<!-- id pw 일치 메인화면으로 -->
		<script type="text/javascript">
			
		<%//아이디,관리자 세션에 저장
				String id = (String) request.getAttribute("id");
				String memNo = (String) request.getAttribute("memNo");
				String manage = (String) request.getAttribute("manage");
				session.setAttribute("id", id);
				session.setAttribute("memNo", memNo);
				session.setAttribute("manage", manage);
				%>
			alert("로그인 되었습니다.");
			location.href = "mainForm.do";
		</script>
	</c:if>
</body>
</html>