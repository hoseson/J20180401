<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		//header class에 상단페이지 붙이기
		$("header").load('headerForm.jsp');
		//footer class에 하단페이지 붙이기
		$("footer").load('footerForm.jsp')
	});
</script>
<link href="css/basicStyle.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
<script
	src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCVdxfvcWC0SW3tlsqZJKABlaEwG3ySkMg"></script>
<script>
	function initialize() {
		var LatLng = new google.maps.LatLng(37.499597, 127.030484);
		var mapProp = {
			center : LatLng,
			zoom : 16,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};
		var map = new google.maps.Map(document.getElementById("googleMap"),
				mapProp);
		var marker = new google.maps.Marker({
			position : LatLng,
			map : map,
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<header> </header>
	<section> <!-- 병원 가이드 // 오시는 길 페이지 API 찾기 -->
	<div align="center">
		<div>
			<img width="1000px" height="150px" src="images/way.jpg">
		</div>
		<div
			style="width: 1000px; margin-top: 30px; padding: 30px 0 30px 0; background-color: #D9E5FF;">
			<div style="float: left; margin-left: 20px; margin-top:10px;">
				<img width="480px" height="480px" src="images/map.jpg">
			</div>
			<div style="width: 480px; height: 480px; margin: 10px;"
				id="googleMap"></div>
		</div>
	</div>
	</section>
	<footer> </footer>
</body>
</html>