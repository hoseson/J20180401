package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.SearchDAO;

public class DeptInformAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			String deptNo=request.getParameter("deptNo");
			SearchDAO sd = SearchDAO.getInstance();
			
			DeptDTO dept = sd.deptInfo(deptNo);
			request.setAttribute("dept", dept);
			
		}catch(Exception e){
			System.out.println("진료과 안내==>"+e.getMessage());
		}
		return "deptInform.jsp";
	}

}
