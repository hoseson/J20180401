package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String deptName = request.getParameter("deptName");
		String pageNum = request.getParameter("pageNum");
		System.out.println("진료과" + deptName + " dfdf "+ pageNum);
		request.setAttribute("deptName", deptName);
		request.setAttribute("pageNum", pageNum);
		return "conWriteForm.jsp";
	}

}
