<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$('#searchBtn').click(function(){
		var memNoVal = ${memNo};
		var disNameVal = $('#disName').val();
		$.ajax({
			url : 'appByDoc.do',
			data : {
				'memNo' : memNoVal,
				'disName' : disNameVal,
				'searchFlag' : 1
			},
			success : function(data) {
				$('#docList').html(data);
			}
		});
		$('#step2Frame').load("white.jsp");
		$('#step3Frame').load("white.jsp");
		$('#summary').load("white.jsp");
	});
</script>
<style type="text/css">
	.searchBtn{
	border: 1px solid #4780c5;
	border-radius: 4px;
	color: #fff;
	font-size: 15px;
	text-align: center;
	padding: 0px 11px 0px 11px;
	background-color: #4780c5;
	}
	.appByDis{
		padding-left: 16px;
		padding-top: 4px;
	}
</style>
</head>
<body>
	<div align="left" class="appByDis">
		<input type="text" name="disName" id="disName" placeholder="질병명을 입력해주세요">
		<a href="#;" id="searchBtn" class="searchBtn">검색</a>
	<div id="docList"></div>
	</div>
</body>
</html>