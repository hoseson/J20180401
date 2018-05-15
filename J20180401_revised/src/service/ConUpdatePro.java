package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConUpdatePro implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("utf-8");
			ConDAO cdao = ConDAO.getInstance();
			ConDTO cdto = new ConDTO();
			String memNo = request.getParameter("memNo");
			String consultNo = request.getParameter("consultNo");
			String startNum = request.getParameter("startNum");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			cdto.setMemNo(memNo);
			cdto.setConsultNo(consultNo);
			cdto.setSubject(subject);
			cdto.setContent(content);
			int result = cdao.update(cdto);
			System.out.println("result = " + result);
			request.setAttribute("memNo", memNo);
			request.setAttribute("consultNo", consultNo);
			request.setAttribute("startNum", startNum);
			request.setAttribute("subject", subject);
			request.setAttribute("content", content);
			request.setAttribute("result", result);
			
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "conUpdatePro.jsp";
	}

}
