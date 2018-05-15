<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	let result = ${result};
	if (result == 1) {
		$(function(){
			alert("동일한 날짜와 시간에 이미 예약하신 내역이 있습니다. 마이페이지에서 예약 삭제나 재예약을 선택해 주세요.");
			window.location.href = "appCheck.do?memNo=${memNo}"
		});
	} else {
		function sendSubmit() {
			let
			docName = "${docName}";
			let
			deptNo = "${deptNo}";
			let
			date = "${date}";
			let
			time = "${time}";
			let
			memNo = "${memNo}";
			let
			appRes = $("#appRes").val();
			if (appRes == "") {
				alert("예약사유를 입력해주세요.");
			} else {
			window.location.href = "appSubmit.do?docName=" + docName + "&deptNo="
					+ deptNo + "&date=" + date + "&time=" + time + "&memNo="
					+ memNo + "&appRes=" + appRes;
			}
		}
	}
</script>
<style type="text/css">
.appSummBtn {
	border: 1px solid #4780c5;
	border-radius: 4px;
	color: #fff;
	font-size: 20px;
	font-family: "맑은 고딕";
	text-align: center;
	padding: 5px 13px 5px 13px;
	background-color: #4780c5;
}

.summTable {
	font-size: 20px;
	font-family: "맑은 고딕";
}
</style>
</head>
<body>
	<table class="summTable">
		<tr>
			<td>담당 의사 : ${docName}</td>
		</tr>
		<tr>
			<td>예약일자 : ${date}</td>
		</tr>
		<tr>
			<td>예약시간 : ${time}</td>
		</tr>
		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td>진료예약 사유(30자 이내) :</td>
		</tr>
		<tr>
			<td><textarea rows="2" cols="35" id="appRes"
					placeholder="진료의뢰서, 진단서 상의 병명 작성     예시) 위암 수술, 위암 의심"
					maxlength="30" style="font-size: 15px;" required></textarea></td>
		</tr>
	</table>
	<div style="margin-top:30px;  float: center">
		<a href="javascript:sendSubmit()" class="appSummBtn">예약 확정</a> <a
			href="appForm.do?memNo=${memNo}" class="appSummBtn">예약 처음부터</a>
	</div>
</body>
</html>