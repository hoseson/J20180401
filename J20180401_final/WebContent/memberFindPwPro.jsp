<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		$(function() {
			$('#pwProClose').click(function() {
				//확인 버튼을 누를 시 아래에 해당 정보가 출력하는 함수
				$.ajax({
					url : 'memberPwStorage.jsp',
					dataType : 'html',
					success : function(data) {
						$('#pwBlank').html(data);
					}
				});
			});
		});
		function findPwProClose() {
			//팝업창 닫기 함수
			window.close();
		}
	</script>
	<%
		String pw = (String) request.getAttribute("pw");
		System.out.println("findPwPro pw : " + pw);
		session.setAttribute("pw", pw);//사용자가 찾고자 하는 비밀번호
		if (pw != null) {
			//조건에 부합하는 비밀번호 존재여부
	%>
	<div style="text-align: center;">
		<form>
			<fieldset>
				<legend>안내문</legend>
				비밀번혼 중요한 정보이므로<br> 바로 창에 나타나지 않습니다.<br> 보기 버튼을 누르시면 비밀번호가
				나오니<br> 주위를 한 번 확인하시고 눌러주세요.
			</fieldset>
			<input type="button" value="보기" id="pwProClose">
			<input type="button" value="닫기" onclick="findPwProClose()">
			<br> <span id="pwBlank"></span>
			<%
				} else {
			%>
			<p align="center">인증번호가 맞지 않으므로 비밀번호 공개는 불가합니다.</p>
			<div style="text-align: center;">
			<input type="button" value="닫기" onclick="findPwProClose()">
			</div>
			<%
				}
			%>
		</form>
	</div>
</body>
</html>