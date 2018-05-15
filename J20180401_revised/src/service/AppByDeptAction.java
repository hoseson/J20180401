package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.SearchDAO;

public final class AppByDeptAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String deptNo = request.getParameter("deptNo") == null ? null : request.getParameter("deptNo");
			
			SearchDAO searchDAO = SearchDAO.getInstance();
			List<DeptDTO> deptList = searchDAO.deptListSort();
			request.setAttribute("deptNo", deptNo);
			request.setAttribute("deptList", deptList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "appByDept.jsp";
	}

}
