package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocDTO;
import dao.SearchDAO;

public class AppByDocAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String docName = request.getParameter("docName");
			String deptNo = request.getParameter("deptNo");
			String cureName = request.getParameter("disName");
			int searchFlag = 0;
			try {
				searchFlag = Integer.parseInt(request.getParameter("searchFlag"));
			} catch (NumberFormatException e) {
				System.out.println("예약메인 접근 경로 파악 중");
			}
			int result = 0;
			SearchDAO searchDAO = SearchDAO.getInstance();
			List<DocDTO> docList = searchDAO.docSelect(docName, deptNo, cureName);
			Calendar cal = Calendar.getInstance();
			int today = cal.get(Calendar.DAY_OF_MONTH);
			try {
				System.out.println(docList.get(0).getDocName());
			} catch (IndexOutOfBoundsException e) {
				if (searchFlag == 1) {
					result = -1;
				}else if (searchFlag == 2) {
					result = -2;
				}
			}
			request.setAttribute("docList", docList);
			request.setAttribute("result", result);
			request.setAttribute("docName", docName);
			request.setAttribute("today", today);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "appByDoc.jsp";
	}

}
