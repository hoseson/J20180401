package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDTO;

public class MemberDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			//회원 탈퇴 memDel = Y
			MemberDAO md = MemberDAO.getInstance(); 
			String id = request.getParameter("id");
			MemberDTO memInfo = md.getMemInfo(id);
			
			int result = md.memDelete(memInfo.getMemno());
			
			request.setAttribute("result", result);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "memberDeletePro.jsp";
	}
}
