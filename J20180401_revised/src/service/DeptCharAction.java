package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DeptDTO;
import dao.SearchDAO;

public class DeptCharAction implements CommandProcess {

	
	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");
			String c = request.getParameter("cha");
			SearchDAO sd = SearchDAO.getInstance();
			List<DeptDTO> list = sd.deptList(c.charAt(0));
			request.setAttribute("dept", list);
			request.setAttribute("test", "18/03/28");
		}catch(Exception e){
			System.out.println("초성검색 service"+e.getMessage());
		}
		 
		return "deptResult.jsp";
	}

}
