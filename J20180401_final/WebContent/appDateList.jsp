<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.showTimeList{
		color: gray;
	}
	.hideTimeList{
		color: lightgray;
	}
	span.showTimeList:hover{
		color: #0054FF;
	}
	.thisYear{
		font-size: 12px;
		padding-left: 8px;
	}
	.thisMonth{
		font-size: 36px;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function timeList(dateVal){
		var docNameVal = $('#selDocName').val();
		var deptNoVal = $('#deptNo').val();
		var memNoVal = $('#memNo').val();
		$.ajax({
			url: 'appTimeList.do',
			data: {'date': dateVal,
				   'docName': docNameVal,
				   'deptNo': deptNoVal,
				   'memNo': memNoVal},
			success: function(data){
				$('#step3Frame').html(data);}
		});
		$('#summary').load("white.jsp");
	};
	
	function nextMonth(docName, deptNo, nowNext) {
		var memNoVal = $('#memNo').val();
		$.ajax({
			url : 'appDateList.do',
			data : {
				'docName' : docName,
				'deptNo' : deptNo,
				'nowNext' : nowNext,
				'memNo' : memNoVal
			},
			success : function(data) {
				$('#step2Frame').html(data);
			}
		});
	};
	
	function prevMonth(docName, deptNo, nowPrev) {
		var memNoVal = $('#memNo').val();
		$.ajax({
			url : 'appDateList.do',
			data : {
				'docName' : docName,
				'deptNo' : deptNo,
				'nowPrev' : nowPrev,
				'memNo' : memNoVal
			},
			success : function(data) {
				$('#step2Frame').html(data);
			}
		});
	};
</script>
</head>
<body>
<input type="hidden" value="${docName}" id="selDocName">
<input type="hidden" value="${deptNo}" id="deptNo">
	<table>
		<fmt:setLocale value="ko_kr"/>
		<fmt:parseDate var="now" value="${appSearchDate}" pattern="yy/MM/dd"></fmt:parseDate>
		<tr>
			<td></td>
			<td><span class="thisYear"><fmt:formatDate value="${now}" type="date" pattern="yyyy"/></span></td>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${thisMonth != setMonth}">
					<td><a href="javascript:prevMonth('${docName}', '${deptNo}', '${now}')"><img src="images/leftArrow.png" height="20px" width="15px" style="padding-top: 4px"></a></td>
					<td><span class="thisMonth"><fmt:formatDate value="${now}" type="date" pattern="MM"/></span></td>
					<td><a href="javascript:nextMonth('${docName}', '${deptNo}', '${now}')"><img src="images/rightArrow.png" height="20px" width="15px" style="padding-top: 4px"></a></td>
				</c:when>
				<c:otherwise>
					<td width="15px"></td>
					<td><span class="thisMonth"><fmt:formatDate value="${now}" type="date" pattern="MM"/></span></td>
					<td><a href="javascript:nextMonth('${docName}', '${deptNo}', '${now}')"><img src="images/rightArrow.png" height="20px" width="15px" style="padding-top: 4px"></a></td>
				</c:otherwise>
			</c:choose>
		</tr>
		<c:forEach var="showHideMapList" items="${showHideMapList}">
			<c:forEach var="showHideMap" items="${showHideMapList}">
				<fmt:parseDate var="parsedDate" value="${showHideMap.key}" pattern="yy/MM/dd"></fmt:parseDate>
				<tr>
					<c:choose>
						<c:when test="${showHideMap.value == 'show'}">
							<td></td>
							<td><a href="javascript:timeList('${parsedDate}')"><span class="showTimeList"><fmt:formatDate value="${parsedDate}" type="date" pattern="dd(E)"/></span></a></td>
						</c:when>
						<c:otherwise>
							<td></td>
							<td><span class="hideTimeList"><fmt:formatDate value="${parsedDate}" type="date" pattern="dd(E)"/></span></td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
</body>
</html>