<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function appSummary(time) {
		$.ajax({
			url : 'appSummary.do',
			data : {
				'docName' : $('#selDocName').val(),
				'deptNo' : $('#deptNo').val(),
				'date' : $('#date').val(),
				'time' : time,
				'memNo' : $('#memNo').val()
			},
			success : function(data) {
				$('#summary').html(data);
			}
		});
	};
	var count = document.getEl
	$(function() {
		$(".appEvent").mouseenter(function() {
			$(this).css("color", "#0054FF")
		});
		$(".appEvent").mouseleave(function() {
			$(this).css("color", "black")
		});
	});
</script>
</head>
<body>
	<input type="hidden" value="${date}" id="date">
	<table>
		<c:forEach var="time" items="${availableTimeList}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == '0'}">
					<tr>
						<td><a class="appEvent"
							href="javascript:appSummary('${time}')">${time}</a></td>
				</c:when>
				<c:when test="${status.index%5 == '0' && status.index != '0'}">
					</tr>
					<tr>
						<td><a class="appEvent"
							href="javascript:appSummary('${time}')">${time}</a></td>
				</c:when>
				<c:otherwise>
					<td><a class="appEvent"
						href="javascript:appSummary('${time}')">${time}</a></td>
				</c:otherwise>
				
			</c:choose>
		</c:forEach>
	</table>
</body>
</html>