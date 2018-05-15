package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocADTO;
import dao.SearchDAO;

public class DocAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//의료진 검색 메인
		try{
			String pagechk = request.getParameter("pagechk");
			SearchDAO sd = SearchDAO.getInstance();
			List<DocADTO> list = sd.docFavSelect(); //그 날의 선호도가 높은 2명의 의료진 선택
			if(list.size()==0){
				request.setAttribute("Fc", "Fc");
			}
			request.setAttribute("list", list);
			request.setAttribute("pagechk", pagechk);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "docSearch.jsp";
	}

}
