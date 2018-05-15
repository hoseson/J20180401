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
	<input type="hidden" id="memNo" value="${memNo}">
	<input type="hidden" id="recontent" value="${recontent}">
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			var memNo = document.getElementById("memNo");
			var recont = document.getElementById("recontent");
			if (recont.value === "") {
				alert("답변을 입력해주세요.");
			} else {
				alert("업데이트 성공");
			}
			$('#center')
					.load(
							"conConAction.do?consultNo=${consultNo}&pageNum=${pageNum}&startNum=${startNum}&memNo="
									+ memNo.value);
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("업데이트 실패");
		</script>
	</c:if>
</body>
</html>
<%-- <%
	String consultNo=request.getParameter("consultNo");
	String pageNum = request.getParameter("pageNum");
	String startNum=request.getParameter("startNum");
	int result=Integer.parseInt(request.getParameter("result"));
	if (result>0){ %>
		<script>
		alert("업데이트 성공");
			
		</script>
	<%}
	else{%>
		<script>
		alert("업데이트 실패");
		</script>
<%	}
%> --%>
