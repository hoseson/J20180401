package service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import dao.AppointmentDTO;
import dao.AppointmentDTO2;
import dao.SearchDAO;

public class AppCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			SearchDAO sdao = SearchDAO.getInstance();
			String memNo = request.getParameter("memNo");
			int totCnt = sdao.getTotalCnt(memNo);
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals(" ")){pageNum = "1"; }
			System.out.println("toc카운트"+totCnt);
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1)*pageSize + 1;
			int endRow  = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) endPage = pageCnt;
			System.out.println("startRow"+startRow);
			System.out.println("endRow"+endRow);
			System.out.println(memNo);
			List<AppointmentDTO2> checklist = sdao.checklist(memNo, startRow, endRow);
			request.setAttribute("memNo", memNo);
			request.setAttribute("checklist", checklist);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return "appCheckForm.jsp";
	}

}
