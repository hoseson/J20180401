<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.docName{
		font-size: 20px;
		font-weight: bold;
		color: #4F81BC;
	}
	.prof{
		font-size: 20px;
		font-weight: bold;
	}
	.deptName{
		font-size: 12px;
		font-weight: bold;
	}
	.cureHeader{
		font-size: 12px;
		font-weight: bold;
	}
	.cureName{
		font-size: 12px;
		color: gray;
	}
	
	.whenDocSelected{
	color: #fff;
	background-color: #4780c5;
	border-radius: 20px;
	}
	
/* 	.circleVisible{
		width: 25px;
		height: 25px;
		border-radius: 25px;
		background-color: #4780c5;
		text-align: center;
		color: #fff;
		font-weight: bold;
		float: right;
		margin-right: 70px;
	}
	
	.circleInvisible{
		background-color: #fff;
		color: #fff;
		float: right;
		margin-right: 70px;
	} */
	
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	let today = "${today}";
	let result = "${result}";
	let searchedName = "${docName}";
	/* let docFlag = 0;
	let selDocName1 = "";
	let selDocName2 = ""; */
	if (result == -1) {
		alert("없는 질병명입니다, 다른 이름으로 검색해 보세요.");
		result = 0;
	}
	if (result == -2) {
		alert("'" + searchedName + "'자가 포함된 의사명은 없습니다.");
		result = 0;
	}
	function dateList(docName, deptNo) {
		var memNoVal = $('#memNo').val();
		/* if(docFlag == 0) {
			selDocName1 = docName;
			docFlag = 1;
		} else if(docFlag == 1){
			selDocName2 = docName;
			docFlag = 0;
		}
		if(selDocName2 == ""){
			$("#circle").attr("class", "circleVisible");
		}else if(selDocName1 == selDocName2) {
			if(docFlag == 0){
				$("#circle").attr("class", "circleInvisible");
			} else{
				$("#circle").attr("class", "circleVisible");
			}
		} else {
			$("#circle").attr("class", "circleVisible");
		} */
		$.ajax({
			url : 'appDateList.do',
			data : {
				'docName' : docName,
				'deptNo' : deptNo,
				'memNo' : memNoVal
			},
			success : function(data) {
				$('#step2Frame').html(data);
				$('#step2Frame').scrollTop(today * 21);
			}
		});
		$('#step3Frame').load("white.jsp");
		$('#summary').load("white.jsp");
	};
</script>
</head>
<body>
	<input type="hidden" value="${memNo}" id="memNo">
	<div>
		<table>
			<c:forEach var="docDTO" items="${docList}" varStatus="docStatus">
				<c:choose>
					<c:when test="${!docStatus.last}">
						<tr>
							<td rowspan="2">
									<img src="images/doc${(docStatus.index + 1) % 5}.png" height="100px" width="100px">
							</td>
							<td>
									<a class="appEvent" href="javascript:dateList('${docDTO.docName}', '${docDTO.deptNo}')">
									<span class="docName">${docDTO.docName}</span>
									<span class="prof"> 교수</span>
									<span class="deptName"> [${docDTO.deptName}]</span>
									<!-- <span id="circle" class="circleInvisible">√</span> -->
									</a>
							</td>
						</tr>
						<tr>
							<td>
								<span class="cureHeader">[진료분야]</span>
								<c:forTokens items="${docDTO.cureName}" delims="," var="cureTokens" varStatus="cureStatus">
									<c:choose>
										<c:when test="${cureStatus.index % 3 == 0 && !cureStatus.last}">
											<span class="cureName"><br>${cureTokens},</span>
										</c:when>
										<c:when test="${cureStatus.last}">
											<span class="cureName">${cureTokens}</span>
										</c:when>
										<c:otherwise>
											<span class="cureName">${cureTokens},</span>
										</c:otherwise>							
									</c:choose>
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td colspan="2"><hr></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td rowspan="2">
									<img src="images/doc${(docStatus.index + 1) % 5}.png" height="100px" width="100px">
							</td>
							<td>
									<a class="appEvent" href="javascript:dateList('${docDTO.docName}', '${docDTO.deptNo}')">
									<span class="docName">${docDTO.docName}</span>
									<span class="prof"> 교수</span>
									<span class="deptName"> [${docDTO.deptName}]</span>
									<!-- <span id="circle" class="circleInvisible">√</span> -->
									</a>
							</td>
						</tr>
						<tr>
							<td>
								<span class="cureHeader">[진료분야]</span>
								<c:forTokens items="${docDTO.cureName}" delims="," var="cureTokens" varStatus="cureStatus">
									<c:choose>
										<c:when test="${cureStatus.index % 3 == 0 && !cureStatus.last}">
											<span class="cureName"><br>${cureTokens},</span>
										</c:when>
										<c:when test="${cureStatus.last}">
											<span class="cureName">${cureTokens}</span>
										</c:when>
										<c:otherwise>
											<span class="cureName">${cureTokens},</span>
										</c:otherwise>							
									</c:choose>
								</c:forTokens>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	</div>
</body>
</html>