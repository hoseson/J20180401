package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseBoardDAO;
import dao.ExerciseBoardDAO;
import dao.NoticeDAO;
import dao.NutritionBoardDAO;
import dao.NutritionBoardDTO;

public class UpdateContentProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = "";
		try {
			boardType = request.getParameter("boardType");
			String boardno = request.getParameter("boardno");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			int result = 0;
			if (boardType.equals("notice")) {
				NoticeDAO dao = NoticeDAO.getInstance();
				result = dao.updateBoard(type, boardno, subject, content);
			} else if (boardType.equals("nutrition")) {
				NutritionBoardDAO dao = NutritionBoardDAO.getInstance();
				result = dao.updateBoard(boardno, subject, content);
			} else if (boardType.equals("disease")) {
				DiseaseBoardDAO dao = DiseaseBoardDAO.getInstance();
				result = dao.updateBoard(boardno, subject, content);
			} else if (boardType.equals("exercise")) {
				ExerciseBoardDAO dao = ExerciseBoardDAO.getInstance();
				result = dao.updateBoard(boardno, subject, content);
			}
			request.setAttribute("result", result);
			request.setAttribute("boardType", boardType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "updateContentPro.jsp";
	}

}
