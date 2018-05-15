package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NoticeDAO;
import dao.NoticeDTO;

public class MainFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			// 공지사항 데이터 받아오기
			NoticeDAO boardDAO = NoticeDAO.getInstance();
			List<NoticeDTO> list = boardDAO.getNotice("", "", ""); // 메인에서는 검색 내용 없음

			int boardSize = 5; // 메인페이지에 기록될 게시물 수
			int boardMax = boardDAO.getMax(); // 마지막 번호 = 가장 최신 글
			request.setAttribute("boardMax", boardMax);
			request.setAttribute("boardSize", boardSize);
			request.setAttribute("list", list);
		} catch (Exception e) {

		}
		return "mainForm.jsp";
	}
}
