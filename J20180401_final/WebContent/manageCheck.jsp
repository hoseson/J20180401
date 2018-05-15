
<%
	//manage check
	String manage = (String) session.getAttribute("manage");
	if (manage == null || manage.equals("P"))
		response.sendRedirect("mainForm.do");
%>