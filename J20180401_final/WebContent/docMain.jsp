<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp');
	});
</script>
<script type="text/javascript">
	$(function() {
		var pagechk = document.getElementById("pagechk");
		$('#docMain').load("docAction.do?pagechk=" + pagechk.value);
	});

	function result() {
		var docSearch = document.getElementById("docSearch");
		var deptNo = document.getElementById("deptNo");
		var pagechk = document.getElementById("pagechk");

		if (docSearch.value === "" && deptNo.value === "") {
			alert("검색 결과가 없습니다.");
		} else {
			$('#docMain').load(
					"docListAction.do?docSearch=" + docSearch.value
							+ "&deptNo=" + deptNo.value + "&pagechk="
							+ pagechk.value);
		}

	};
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>

<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<input type="hidden" id="pagechk" value="doc">
	<header> </header>
	<section>
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/docSearchMenu.jpg">
		</div>
		<!-- 중앙 메뉴 -->
		<!-- 여기에 입력해주세요.  -->
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0px 30px 0px; background-color: #D9E5FF;"
			id="select">
			<div>
				<form>
					<label>검색창 </label><select id="deptNo" name="deptNo"
						style="height: 26px;">
						<option selected value="">진료과 선택</option>
						<option value="dept1">감염내과</option>
						<option value="dept2">내분비대사과</option>
						<option value="dept3">호흡기내과</option>
						<option value="dept4">성형외과</option>
						<option value="dept5">소아청소년과</option>
						<option value="dept6">신경과</option>
						<option value="dept7">신경외과</option>
						<option value="dept8">안과</option>
						<option value="dept9">영상의학과</option>
						<option value="dept10">소화외과</option>
						<option value="dept11">소화기외과</option>
						<option value="dept12">외과</option>
						<option value="dept13">이식외과</option>
						<option value="dept14">혈관외과</option>
						<option value="dept15">이비인후과</option>
						<option value="dept16">재활의학과</option>
						<option value="dept17">정형외과</option>
						<option value="dept18">치과</option>
						<option value="dept19">피부과</option>
						<option value="dept20">핵의학과</option>
						<option value="dept21">흉부외과</option>
						<option value="dept22">산부인과</option>
						<option value="dept23">마취통증의학과</option>
						<option value="dept24">방사선종양학과</option>
						<option value="dept25">병리과</option>
						<option value="dept26">류마티스내과</option>
						<option value="dept27">소화기내과</option>
						<option value="dept28">순환기내과</option>
					</select> <input type="text" id="docSearch" name="docSearch" size="50" style="height: 20px"
						placeholder="의료진이나 질병으로 검색하세요"> <input type="button"
						value="검색" onclick="result()" style="background-color: #4F81BD; color:white;">
					<!-- 	<a href="javascript:result()">검색</a> -->
				</form>
				<p></p>
			</div>
			<div id="docMain">
				<!-- 출력창  -->

			</div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>