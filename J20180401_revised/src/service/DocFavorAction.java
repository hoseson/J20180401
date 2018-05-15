package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.DocDTO;
import dao.SearchDAO;

public class DocFavorAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String docNo = request.getParameter("docNo");
			String docSearch = request.getParameter("docSearch");
			String deptNo = request.getParameter("deptNo");
			String chk=request.getParameter("chk");
			String memNo = request.getParameter("memNo");
			String pagechk = request.getParameter("pagechk");
			System.out.println("페이지체크 선호도쪽==????"+pagechk);
			SearchDAO sd = SearchDAO.getInstance();
			int result=sd.Favor(docNo, memNo);
			System.out.println(result);
			DocDTO doctor = sd.docSearch(docNo);
			DeptDTO dept = sd.deptInfo(doctor.getDeptNo());
			System.out.println("선호도 의사 의과번호"+doctor.getDeptNo());
			System.out.println(chk);
			System.out.println("검색"+docSearch);
			request.setAttribute("pagechk", pagechk);
			request.setAttribute("result", result);
			request.setAttribute("deptNo", deptNo);
			request.setAttribute("deptName", dept.getDeptName());
			request.setAttribute("chk", chk);
			request.setAttribute("docSearch", docSearch);
		}catch(Exception e){
			System.out.println("선호도쪽이야===="+e.getMessage());
		}
		return "docFavor.jsp";
	}
}
