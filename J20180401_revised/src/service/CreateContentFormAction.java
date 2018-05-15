package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateContentFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		try {
			// 게시판 생성 메뉴 이동
			request.setAttribute("boardType", boardType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (boardType.equals("notice")) {
			//공지사항 게시물 생성 페이지
			return "createNoticeForm.jsp";
		} else {
			//질병, 영양, 운동 정보 게시물 생성 페이지
			return "createContentForm.jsp";
		}
	}
}
