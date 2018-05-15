package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateContentFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = "";
		try {
			boardType = request.getParameter("boardType");
			String type = request.getParameter("type");
			String content = request.getParameter("content");
			String subject = request.getParameter("subject");
			String boardno = request.getParameter("boardno");

			request.setAttribute("type", type);
			request.setAttribute("boardno", boardno);
			request.setAttribute("subject", subject);
			request.setAttribute("content", content);
			request.setAttribute("boardType", boardType);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (boardType.equals("notice")) {
			return "updateNoticeForm.jsp";
		} else {
			return "updateContentForm.jsp";
		}
	}
}
