package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiseaseBoardDAO;
import dao.DiseaseBoardDTO;
import dao.ExerciseBoardDAO;
import dao.ExerciseBoardDTO;
import dao.NoticeDAO;
import dao.NoticeDTO;
import dao.NutritionBoardDAO;
import dao.NutritionBoardDTO;

public class CreateContentProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = "";
		try {
			boardType = request.getParameter("boardType");
			int result = 0;
			String type = request.getParameter("type");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			// 게시물 정보 삽입하기/ 종류, 제목, 내용, 등록일, 번호, 조회수
			if (boardType.equals("notice")) {
				//공지사항
				NoticeDAO dao = NoticeDAO.getInstance();
				NoticeDTO board = new NoticeDTO();
				board.setContent(content);
				board.setSubject(subject);
				board.setType(type);
				result = dao.insertBoard(board);
			} else if (boardType.equals("disease")) {
				//질병정보 게시판
				DiseaseBoardDAO dao = DiseaseBoardDAO.getInstance();
				DiseaseBoardDTO board = new DiseaseBoardDTO();
				board.setContent(content);
				board.setSubject(subject);
				result = dao.insertBoard(board);
			} else if (boardType.equals("exercise")) {
				//운동정보 게시판
				ExerciseBoardDAO dao = ExerciseBoardDAO.getInstance();
				ExerciseBoardDTO board = new ExerciseBoardDTO();
				board.setContent(content);
				board.setSubject(subject);
				result = dao.insertBoard(board);
			} else if (boardType.equals("nutrition")) {
				//영양정보 게시판
				NutritionBoardDAO dao = NutritionBoardDAO.getInstance();
				NutritionBoardDTO board = new NutritionBoardDTO();
				board.setContent(content);
				board.setSubject(subject);
				result = dao.insertBoard(board);
			}

			request.setAttribute("boardType", boardType);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "createContentPro.jsp";
	}

}
