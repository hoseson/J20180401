<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="manageCheck.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("게시물이 수정되었습니다");
		</script>
		<c:if test="${boardType == 'notice' }">
			<script>
				location.href = "allBoardForm.do?boardType=notice";
			</script>
		</c:if>
		<c:if test="${boardType == 'exercise' }">
			<script>
				location.href = "allBoardForm.do?boardType=exercise";
			</script>
		</c:if>
		<c:if test="${boardType == 'disease' }">
			<script>
				location.href = "allBoardForm.do?boardType=disease";
			</script>
		</c:if>
		<c:if test="${boardType == 'nutrition' }">
			<script>
				location.href = "allBoardForm.do?boardType=nutrition";
			</script>
		</c:if>

	</c:if>
	<c:if test="${result <= 0 }">
		<script>
			alert("게시물 수정을 실패했습니다");
		</script>
		<c:if test="${boardType == 'notice' }">
			<script>
				location.href = "allBoardForm.do?boardType=notice";
			</script>
		</c:if>
		<c:if test="${boardType == 'exercise' }">
			<script>
				location.href = "allBoardForm.do?boardType=exercise";
			</script>
		</c:if>
		<c:if test="${boardType == 'disease' }">
			<script>
				location.href = "allBoardForm.do?boardType=disease";
			</script>
		</c:if>
		<c:if test="${boardType == 'nutrition' }">
			<script>
				location.href = "allBoardForm.do?boardType=nutrition";
			</script>
		</c:if>
	</c:if>

</body>
</html>