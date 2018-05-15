<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOONGANG INFO MEDICAL CENTER</title>
</head>
<body>
	<%
	String authNum = (String)request.getAttribute("authNum");//난수 메소드로부터 생성된 난수
	String authcheck = (String)request.getAttribute("authcheck");//본인인증에 강제성을 부여하기 위한 히든값
	%>
	<form action="sendMailPro.do" name = "frm" method="post">
		<table>
			<tr>
				<h2>본인인증하기! 이메일로 받으신 번홀 입력해주세요</h2>
				<td>Number</td>
				<td><input type = "text" name = "number" required/>
					<input type = "hidden" name = "authNum" value="<%=authNum%>">
					<input type = "hidden" name = "authcheck" value="<%=authcheck %>">
				<td>
			</tr>
			<tr>
				<td colspan="2">
					<input type= "submit" value="보내기">
					<input type= "reset" value="초기화"> 					
				</td>
			</tr>	
		</table>	
	</form>
</body>
</html>