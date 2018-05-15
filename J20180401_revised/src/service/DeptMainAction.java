package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.SearchDAO;

public class DeptMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			try{
				String deptNo = request.getParameter("deptNo");
				System.out.println("deptNo="+deptNo);
				SearchDAO sd = SearchDAO.getInstance();
				DeptDTO dept = sd.deptInfo(deptNo);		
				request.setAttribute("dept", dept);
				System.out.println("check         1111111" +dept.getDeptName());
				System.out.println("dept---"+dept.getDeptName());
			}catch(Exception e){
				System.out.println("진료과 메인 서비스-->"+e.getMessage());
			}
		return "deptMain.jsp";
	}

}
