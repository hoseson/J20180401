package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocADTO;
import dao.SearchDAO;

public class DocListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			//검색 결과 출력
		request.setCharacterEncoding("utf-8");
		String pagechk=request.getParameter("pagechk");
		System.out.println("페이지체크=="+pagechk);
		String deptNo=request.getParameter("deptNo");
		System.out.println("deptNo==="+deptNo);
		String docSearch = request.getParameter("docSearch");
		SearchDAO sd = SearchDAO.getInstance();
		//의과번호와 의료진,질병 검색결과를 dao에 넘겨준다.
		List<DocADTO> doctor=sd.docListA(deptNo,docSearch);
		request.setAttribute("doctor", doctor);
		request.setAttribute("pagechk", pagechk);
		request.setAttribute("docSearch", docSearch);
		request.setAttribute("deptNo", deptNo);
		
		System.out.println("deptNo"+deptNo);
		System.out.println("docSearch"+docSearch);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "docResult.jsp";
	}
}
