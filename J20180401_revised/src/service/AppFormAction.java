package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AppFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String deptNo = request.getParameter("deptNo");
			String docName = request.getParameter("docName");
			request.setAttribute("docName", docName);
			request.setAttribute("deptNo", deptNo);
		return "appForm.jsp";
	}
}
