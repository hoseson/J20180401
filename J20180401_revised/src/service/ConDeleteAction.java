package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String memNo = request.getParameter("memNo");
			String consultNo = request.getParameter("consultNo");
			request.setAttribute("memNo", memNo);
			request.setAttribute("consultNo", consultNo);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return "conDeleteForm.jsp";
	}

}
