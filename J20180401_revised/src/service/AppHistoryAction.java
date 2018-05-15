package service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AppointmentDTO2;
import dao.SearchDAO;

public class AppHistoryAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			SearchDAO sdao = SearchDAO.getInstance();
			String memNo = request.getParameter("memNo");
			String date1 = request.getParameter("date1");
			String date2 = request.getParameter("date2");
			int totCnt = sdao.getTotalCnt2(memNo);
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals(" ")){pageNum = "1"; }
			
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1)*pageSize + 1;
			int endRow  = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) endPage = pageCnt;
			List<AppointmentDTO2> history = new ArrayList<AppointmentDTO2>();
			if(date1 != null && date2 != null) {
				history = sdao.datesearch(memNo, startRow, endRow, date1, date2);
			} else {
				history = sdao.history(memNo, startRow, endRow);				
			}
			request.setAttribute("memNo", memNo);
			request.setAttribute("history", history);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("date1", date1);
			request.setAttribute("date2", date2);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "appHistoryForm.jsp";
	}
}
