<%
	//login check
	String id = (String) session.getAttribute("id");
	if (id == null || id.equals(""))
		response.sendRedirect("memberLoginForm.do");
%>