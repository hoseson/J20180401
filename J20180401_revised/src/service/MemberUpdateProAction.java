package service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;
import javax.websocket.Session;

import dao.MemberDAO;
import dao.MemberDTO;

public class MemberUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			// 변경된 회원 정보 DB에 넣기
			MemberDTO member = new MemberDTO();
			MemberDAO md = MemberDAO.getInstance();
			member.setMemno(request.getParameter("memNo"));
			member.setId(request.getParameter("id"));
			member.setPw(request.getParameter("pw"));
			member.setName(request.getParameter("name"));
			member.setAddr(request.getParameter("addr"));
			member.setTel(request.getParameter("tel"));
			member.setEmail(request.getParameter("email"));
			member.toString();
			int result = md.memUpdate(member);

			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memberUpdatePro.jsp";
	}
}
