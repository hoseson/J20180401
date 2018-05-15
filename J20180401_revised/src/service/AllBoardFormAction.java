package service;

import java.io.IOException;
import java.util.List;

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

public class AllBoardFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String boardType = null;
		try {
			boardType = request.getParameter("boardType"); // 게시판 종류
			System.out.println("asdfasdfasfassadf "+boardType);
			if (boardType.equals("notice")) {
				// 공지 게시판 검색, 게시글 종류 / 전체or 내용검색 or 제목검색
				String type = request.getParameter("type"); // 전체 , 공지 , 뉴스 , 학회
				String subcon = request.getParameter("subcon");// 전체 , 제목 , 내용
				String search = request.getParameter("search");// 검색어
				// 공지사항 데이터 받아오기
				NoticeDAO boardDAO = NoticeDAO.getInstance();
				List<NoticeDTO> boardList = boardDAO.getNotice(type, subcon,
						search);
				int boardMax = boardDAO.getMax(); // 마지막 번호 = 가장 최신 글

				request.setAttribute("boardMax", boardMax);
				request.setAttribute("list", boardList);
			} else if (boardType.equals("disease")) {
				// 질병정보 게시판
				// 검색어
				String search = request.getParameter("search");
				// 질병정보 게시판 데이터 받아오기
				DiseaseBoardDAO boardDAO = DiseaseBoardDAO.getInstance();
				List<DiseaseBoardDTO> boardList = boardDAO
						.getDiseaseBoard(search);
				int boardMax = boardDAO.getMax();// 마지막 번호 = 가장 최신 글

				request.setAttribute("boardMax", boardMax);
				request.setAttribute("list", boardList);
			} else if (boardType.equals("nutrition")) {
				// 영양정보 게시판
				// 검색어
				String search = request.getParameter("search");
				// 질병정보 게시판 데이터 받아오기
				NutritionBoardDAO boardDAO = NutritionBoardDAO.getInstance();
				List<NutritionBoardDTO> boardList = boardDAO
						.getNutritionBoard(search);
				int boardMax = boardDAO.getMax();// 마지막 번호 = 가장 최신 글

				request.setAttribute("boardMax", boardMax);
				request.setAttribute("list", boardList);
			} else if (boardType.equals("exercise")) {
				// 운동정보 게시판
				// 검색어
				String search = request.getParameter("search");
				// 질병정보 게시판 데이터 받아오기
				ExerciseBoardDAO boardDAO = ExerciseBoardDAO.getInstance();
				List<ExerciseBoardDTO> boardList = boardDAO
						.getExerciseBoard(search);
				int boardMax = boardDAO.getMax();// 마지막 번호 = 가장 최신 글

				request.setAttribute("boardMax", boardMax);
				request.setAttribute("list", boardList);
			}
			// 게시판 타입
			request.setAttribute("boardType", boardType);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		// 해당 게시판 이동 없으면 에러페이지
		if (boardType.equals("notice")) {
			return "noticeBoardForm.jsp";
		} else if (boardType.equals("disease")) {
			return "diseaseBoardForm.jsp";
		} else if (boardType.equals("nutrition")) {
			return "nutritionBoardForm.jsp";
		} else if (boardType.equals("exercise")) {
			return "exerciseBoardForm.jsp";
		} else {
			return "error.jsp";
		}
	}
}
