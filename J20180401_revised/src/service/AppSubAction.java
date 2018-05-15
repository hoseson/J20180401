package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import dao.MemberDTO;
import dao.SearchDAO;

public class AppSubAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String memNo = request.getParameter("memNo");
			String docName = request.getParameter("docName");
			String deptNo = request.getParameter("deptNo");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String appRes = request.getParameter("appRes");
			
			SearchDAO searchDAO = SearchDAO.getInstance();
			int result = searchDAO.appInsert(memNo, docName, deptNo, date, time, appRes);
			MemberDTO memberDTO = searchDAO.selectMemInfo(memNo);
			String deptName = searchDAO.selectDeptInfo(deptNo);
			request.setAttribute("result", result);
			request.setAttribute("memberDTO", memberDTO);
			request.setAttribute("deptName", deptName);
			request.setAttribute("docName", docName);
			request.setAttribute("date", date);
			request.setAttribute("time", time);
			request.setAttribute("appRes", appRes);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "appSubmit.jsp";
	}

}
