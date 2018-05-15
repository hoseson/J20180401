package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			ConDAO cd = ConDAO.getInstance();
			String deptName = request.getParameter("deptName");
			System.out.println("asdfasdfsadfasdfasdf "+deptName);
			int totcnt = cd.getTotal(deptName);
			String pageNum = request.getParameter("pageNum");
			System.out.println(totcnt);
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;    //1
			int endRow = startRow + pageSize - 1;               //10
			int startNum = totcnt - startRow + 1;    
			System.out.println("startRow-->" + startRow); 
			System.out.println("endRow-->" + endRow); 
			List<ConDTO> list= cd.list(deptName,startRow,endRow);
			int pageCnt = (int) Math.ceil((double) totcnt / pageSize); //double형인 값을 다음 정수값으로 올림한다. page 개수 설정
			int startPage = (int) (currentPage - 1) / blockSize * pageSize + 1; // 1
			int endPage = startPage + blockSize - 1;  // 10
			if (endPage > pageCnt) //10>4 ==> endPage = 4;
				endPage = pageCnt;
			
			request.setAttribute("totcnt", totcnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("list", list);
			request.setAttribute("deptName", deptName);
			
		}catch(Exception e){
			System.out.println("건강상담목록 서비스-->"+e.getMessage());
		}
		
		return "conListAForm.jsp";
	}

}
