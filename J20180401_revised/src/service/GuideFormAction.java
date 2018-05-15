package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuideFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pageNum = "";
		try {
			pageNum = request.getParameter("pageNum");
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "guideForm" + pageNum + ".jsp";
	}

}
