package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConConAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			String memNo=request.getParameter("memNo");
			String consultNo=request.getParameter("consultNo");
			String pageNum = request.getParameter("pageNum");
			String startNum = request.getParameter("startNum");
			ConDAO cd = ConDAO.getInstance();
			cd.readcount(consultNo,memNo);
			String manage=cd.manage(memNo);
			ConDTO con = cd.content(consultNo);
			if(memNo==null || memNo.equals("")){
				memNo="0";
			}
			System.out.println("manage======================>>>>"+manage);
			request.setAttribute("manage", manage);
			request.setAttribute("memNo", memNo);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("startNum", startNum);
			request.setAttribute("con", con);
			request.setAttribute("cmemNo", con.getMemNo());
		}catch(Exception e){
			System.out.println("본문 서비스==>"+e.getMessage());
		}
		
		return "conContent.jsp";
	}

}
