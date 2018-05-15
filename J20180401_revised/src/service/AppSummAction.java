package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppSummAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String docName = request.getParameter("docName");
		String deptNo = request.getParameter("deptNo");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		request.setAttribute("docName", docName);
		request.setAttribute("deptNo", deptNo);
		request.setAttribute("date", date);
		request.setAttribute("time", time);
		return "appSummary.jsp";
	}

}
