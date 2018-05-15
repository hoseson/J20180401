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
		String authNum = (String) request.getAttribute("authNum");//난수메소드에서 발생한 난수
		String email = (String) request.getAttribute("email");//사용자가 입력한 이메일
		String id = (String) request.getAttribute("id");//사용자가 입력한 아이디
	%>
	<form action="memberFindPwPro.do" name="frm" method="post">
		<div style="text-align: center;">
			<table>
				<tr>
					<h2>pw를 찾기위해 이메일로 받으신 번홀 입력해주세요</h2>
					<td align="center">Number</td>
					<td align="center"><input type="text" name="number" required />
						<input type="hidden" name="authNum" value="<%=authNum%>">
						<input type="hidden" name="email" value="<%=email%>"> <input
						type="hidden" name="id" value="<%=id%>">
					<td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="submit"> <input type="reset" value="reset">
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>