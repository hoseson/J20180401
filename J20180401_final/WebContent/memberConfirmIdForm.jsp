<%
int result = Integer.parseInt(request.getAttribute("result").toString());
System.out.println("test result : "+result);
if(result==0){ %>
	0
<%}else{ %>
	1
<%} %>	
