package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			ConDAO cdao = ConDAO.getInstance();
			String memNo = request.getParameter("memNo");
			int totCnt = cdao.getTotalCnt(memNo);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals(" ")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			int pageCnt = (int) Math.ceil((double) totCnt / pageSize);
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if (endPage > pageCnt)
				endPage = pageCnt;
			List<ConDTO> list2 = cdao.list2(memNo, startRow, endRow);

			request.setAttribute("memNo", memNo);
			request.setAttribute("list2", list2);
			System.out.println("list2 -> " + list2);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "conSelectForm.jsp"; // 컨트롤러에 경로를 알려줌. 값도 넘겨줘 리스트 뷰에서 뿌려주래
	}

}
