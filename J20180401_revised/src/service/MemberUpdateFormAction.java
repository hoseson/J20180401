package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDTO;

public class MemberUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try{
			//회원 정보 변경하기 세팅
			MemberDAO md = MemberDAO.getInstance();
			String id = request.getParameter("id");
			MemberDTO memInfo = md.getMemInfo(id);
			MemberDTO member = md.getMember(memInfo.getMemno()); // 회원정보 가져오기
			
			request.setAttribute("member", member);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return "memberUpdateForm.jsp";
	}
}
