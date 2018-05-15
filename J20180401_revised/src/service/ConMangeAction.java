package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConMangeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String consultNo = request.getParameter("consultNo");
		String pageNum = request.getParameter("pageNum");
		String startNum = request.getParameter("startNum");
		String recontent = request.getParameter("recontent");
		try {
			ConDAO cd = ConDAO.getInstance();
			ConDTO con = new ConDTO();
			con.setConsultNo(consultNo);
			con.setRecontent(recontent);
			int result = cd.recontent(con);

			request.setAttribute("recontent", recontent);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("consultNo", consultNo);
			request.setAttribute("result", result);
			request.setAttribute("startNum", startNum);
		} catch (Exception e) {
			System.out.println("관리자 답변 서비스=>" + e.getMessage());
		}
		return "conMange.jsp";
	}

}
