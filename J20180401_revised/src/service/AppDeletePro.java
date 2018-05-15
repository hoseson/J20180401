package service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SearchDAO;

public class AppDeletePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String memNo = request.getParameter("memNo");
			String appDate = request.getParameter("appDate");
			String appTime = request.getParameter("appTime");
			SearchDAO sdao = SearchDAO.getInstance();
			int result = sdao.delete(memNo, appDate, appTime);
			request.setAttribute("memNo", memNo);
			request.setAttribute("appDate", appDate);
			request.setAttribute("appTime", appTime);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "appDeletePro.jsp";
	}
}
