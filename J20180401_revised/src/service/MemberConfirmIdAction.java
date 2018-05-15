package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class MemberConfirmIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String id = request.getParameter("id");//사용자가 입력한 아이디
			MemberDAO dao = MemberDAO.getInstance();
			int result = dao.confirmId(id); //아이디 중복확인 결과와 메소드 
			request.setAttribute("result", result);
			request.setAttribute("id", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "memberConfirmIdForm.jsp";
	}

}
