package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseBoardDAO;
import dao.ExerciseBoardDAO;
import dao.NoticeDAO;
import dao.NutritionBoardDAO;

public class DeleteContentProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		int result = 0;
		try {
			String boardNo = request.getParameter("boardno");
			String regDate = request.getParameter("regdate");
			// 게시물 삭제
			if (boardType.equals("notice")) {
				NoticeDAO dao = NoticeDAO.getInstance();
				result = dao.deleteBoard(boardNo, regDate);
			} else if (boardType.equals("disease")) {
				DiseaseBoardDAO dao = DiseaseBoardDAO.getInstance();
				result = dao.deleteBoard(boardNo, regDate);
			} else if (boardType.equals("nutrition")) {
				NutritionBoardDAO dao = NutritionBoardDAO.getInstance();
				result = dao.deleteBoard(boardNo, regDate);
			} else if (boardType.equals("exercise")) {
				ExerciseBoardDAO dao = ExerciseBoardDAO.getInstance();
				result = dao.deleteBoard(boardNo, regDate);
			}
			request.setAttribute("result", result);
			request.setAttribute("boardType", boardType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "deleteContentPro.jsp";
	}

}
