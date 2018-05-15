package service;

import java.io.IOException;
import java.util.Date;

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

public class BoardFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = request.getParameter("boardType");
		try {
			if (boardType.equals("notice")) {
				// 공지사항 게시판
				// 게시판에서 게시물 1개 클릭했을 경우 게시물 값 전달. +조회수 증가
				NoticeDTO board = new NoticeDTO();
				NoticeDAO boardDAO = NoticeDAO.getInstance();
				board.setBoardno(request.getParameter("boardno"));
				board.setType(request.getParameter("type"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));
				board.setRegdate(request.getParameter("regdate"));
				int readCount = boardDAO.plusReadCnt(board);
				board.setReadcount(readCount);
				// 이전 페이지, 다음 페이지 정보 가져와야 함
				NoticeDTO prevPage = boardDAO.getPage((Integer.parseInt(board
						.getBoardno()) - 1));
				NoticeDTO nextPage = boardDAO.getPage((Integer.parseInt(board
						.getBoardno()) + 1));
				// 저장된 값 보내기
				request.setAttribute("board", board);
				request.setAttribute("prevPage", prevPage);
				request.setAttribute("nextPage", nextPage);
			} else if (boardType.equals("disease")) {
				// 질병정보 게시물
				DiseaseBoardDTO board = new DiseaseBoardDTO();
				DiseaseBoardDAO boardDAO = DiseaseBoardDAO.getInstance();
				board.setBoardno(request.getParameter("boardno"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));
				board.setRegdate(request.getParameter("regdate"));
				int readCount = boardDAO.plusReadCnt(board);
				board.setReadcount(readCount);
				// 이전 페이지, 다음 페이지 정보 가져와야 함
				DiseaseBoardDTO prevPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) - 1));
				DiseaseBoardDTO nextPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) + 1));
				// 저장된 값 보내기
				request.setAttribute("board", board);
				request.setAttribute("prevPage", prevPage);
				request.setAttribute("nextPage", nextPage);
			} else if (boardType.equals("nutrition")) {
				// 영양정보 게시물
				NutritionBoardDTO board = new NutritionBoardDTO();
				NutritionBoardDAO boardDAO = NutritionBoardDAO.getInstance();
				board.setBoardno(request.getParameter("boardno"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));
				board.setRegdate(request.getParameter("regdate"));
				int readCount = boardDAO.plusReadCnt(board);
				board.setReadcount(readCount);
				// 이전 페이지, 다음 페이지 정보 가져와야 함
				NutritionBoardDTO prevPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) - 1));
				NutritionBoardDTO nextPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) + 1));
				// 저장된 값 보내기
				request.setAttribute("board", board);
				request.setAttribute("prevPage", prevPage);
				request.setAttribute("nextPage", nextPage);
			} else if (boardType.equals("exercise")) {
				// 운동정보 게시물
				ExerciseBoardDTO board = new ExerciseBoardDTO();
				ExerciseBoardDAO boardDAO = ExerciseBoardDAO.getInstance();
				board.setBoardno(request.getParameter("boardno"));
				board.setSubject(request.getParameter("subject"));
				board.setContent(request.getParameter("content"));
				board.setRegdate(request.getParameter("regdate"));
				int readCount = boardDAO.plusReadCnt(board);
				board.setReadcount(readCount);
				// 이전 페이지, 다음 페이지 정보 가져와야 함
				ExerciseBoardDTO prevPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) - 1));
				ExerciseBoardDTO nextPage = boardDAO.getPage((Integer
						.parseInt(board.getBoardno()) + 1));
				// 저장된 값 보내기
				request.setAttribute("board", board);
				request.setAttribute("prevPage", prevPage);
				request.setAttribute("nextPage", nextPage);
			}
			request.setAttribute("boardType", boardType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		//해당 게시물 이동
		return boardType + "ContentForm.jsp";
	}
}
