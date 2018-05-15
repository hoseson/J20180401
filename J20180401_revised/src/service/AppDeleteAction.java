package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AppointmentDTO2;
import dao.SearchDAO;

public class AppDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String memNo = request.getParameter("memNo");
			String appDate = request.getParameter("appDate");
			String appTime = request.getParameter("appTime");
			request.setAttribute("memNo", memNo);
			request.setAttribute("appDate", appDate);
			request.setAttribute("appTime", appTime);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "appDeleteForm.jsp";
	}
}
