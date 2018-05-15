package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConDeletePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			ConDAO cdao = ConDAO.getInstance();
			String memNo = request.getParameter("memNo");
			String consultNo = request.getParameter("consultNo");
			int result = cdao.remove(memNo, consultNo);
			
			request.setAttribute("memNo", memNo);
			request.setAttribute("consultNo", consultNo);
			request.setAttribute("result", result);
			System.out.println(result);
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
		return "conDeletePro.jsp";
	}

}
