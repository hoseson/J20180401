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
	<c:choose>
		<c:when test="${authcheck==true }">
				<c:if test="${idcheck==true }">
					<c:if test="${result>0 }">
						<script type="text/javascript">
							alert("회원가입 성공하셨습니다. 감사합니다.");
							location.href = "mainForm.do";
						</script>
					</c:if>
				</c:if>
				<c:if test="${idcheck==false }">
					<script type="text/javascript">
						alert("아이디가 조건에 맞지않습니다..");
						history.back();
					</script>
				</c:if>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("본인인증을 해주세요.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>