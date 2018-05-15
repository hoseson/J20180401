<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String pw = (String)session.getAttribute("pw");
	System.out.println("pw : "+pw);//사용자가 비밀번호 찾기를 요청한 비밀번호
	%>
	Password : <%=pw %>

</body>
</html>