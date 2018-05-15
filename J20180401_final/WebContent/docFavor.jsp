<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//로그인 되었는지 확인 하기 위한 세션
	String memNo = (String) session.getAttribute("memNo");
	String chk = (String) request.getAttribute("chk");
	String deptNo = (String) request.getAttribute("deptNo");
	String docSearch = (String) request.getAttribute("docSearch");
	String pagechk = (String) request.getAttribute("pagechk");
	int result = (int) request.getAttribute("result");

	System.out.println("result====" + result);
	if (memNo == null) {
%>
<script>
	alert("로그인을 해주세요");
	location.href = "memberLoginForm.do";
</script>
<%
	} else if (result == 0) {

		if (pagechk.equals("dept")) {
			System.out.println("진료과쪽pagechk====" + pagechk);
%>
<script>
	alert("하루에 한번 가능합니다.");
</script>
<%
	} else {
			if (chk.equals("1")) {
%>
<script>
	alert("하루에 한번 가능합니다.");
	$('#docMain')
			.load(
					"docListAction.do?deptNo=${deptNo}&docSearch=${docSearch}&pagechk=${pagechk}");
</script>
<%
	} else {
%>
<script>
	alert("추천 감사합니다.");
	$('#docMain').load("docAction.do");
</script>
<%
	}
		}

	} else if (result > 0) {
		if (chk.equals("1") && pagechk.equals("doc")) {
			System.out.println("의사쪽pagechk====" + pagechk);
%>
<script>
	alert("추천 감사합니다.");
	$('#docMain')
			.load(
					"docListAction.do?deptNo=${deptNo}&docSearch=${docSearch}&pagechk=${pagechk}");
</script>
<%
	} else if (chk.equals("2")) {
%>
<script>
	alert("추천 감사합니다.");
	$('#docMain').load("docAction.do");
</script>
<%
	} else if (pagechk.equals("dept")) {
			System.out.println("진료과쪽pagechk====" + pagechk);
%>
<script>
	alert("추천 감사합니다.");
	$('#center')
			.load(
					"docListAction.do?deptNo=${deptNo}&docSearch=${docSearch}&pagechk=${pagechk}");
</script>
<%
	}

	}
%>

