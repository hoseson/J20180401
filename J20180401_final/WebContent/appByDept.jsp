<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.deptCombo{
		width: 400px;
		height: 30px;
		background-color: #4780c5;
		font-size: 15px;
		color: #fff;
	}
	.deptToDoc{
		width: 400px;
	}
	.appByDept{
		margin-left: 16px;
		padding-top: 4px;
	}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function deptToDoc(deptNo) {
		$.ajax({
			url : 'appByDoc.do',
			data : {'deptNo' : deptNo},
			success : function(data) {
				$('#deptToDoc').html(data);
			}
		});
		$('#step2Frame').load("white.jsp");
		$('#step3Frame').load("white.jsp");
		$('#summary').load("white.jsp");
	}; 
</script>
</head>
<body>
	<div align="left" class="appByDept">
			<select class="deptCombo" onchange="deptToDoc(value)">
					<c:if test="${deptNo eq null}">
						<option disabled selected value> 진료과를 선택하세요 </option>
					</c:if>
					<c:forEach var="deptDTO" items="${deptList}">
						<c:if test="${deptNo eq deptDTO.deptNo}">
							<option value="${deptDTO.deptNo}" selected="selected">${deptDTO.deptName}</option>
						</c:if>
						<c:if test="${deptNo ne deptDTO.deptNo}">
							<option value="${deptDTO.deptNo}">${deptDTO.deptName}</option>
						</c:if>
					</c:forEach>
			</select>
		
		<div align="left" id="deptToDoc" class="deptToDoc"></div>
	</div>
</body>
</html>