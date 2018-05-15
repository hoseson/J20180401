package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.SearchDAO;

public class DeptAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			//진료과 검색 메인
			System.out.println("진료과 검색창");
			SearchDAO sd = SearchDAO.getInstance();
			List<DeptDTO> list = sd.deptListA();
			request.setAttribute("list", list);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "deptSearch.jsp";
	}

}
