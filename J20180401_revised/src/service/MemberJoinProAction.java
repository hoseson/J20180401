package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dao.MemberDTO;

public class MemberJoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String authcheck = request.getParameter("authcheck");// 본인인증 확인에
			String id = request.getParameter("id");// 사용자가 입력한 아이디
			String pw = request.getParameter("pw");// 사용자가 입력한 비밀번호
			String name = request.getParameter("name");// 사용자가 입력한 이름
			String tel = request.getParameter("tel");// 사용자가 입력한 전화번호
			String addr = request.getParameter("addr");// 사용자가 입력한 주소
			String email = request.getParameter("email2");// 사용자가 입력한 이메일
			String idcheck = request.getParameter("idcheck");//아이디 중복체크용 히든값
			MemberDTO member = new MemberDTO();// DTO에 일괄적으로 저장하기 위해 MemberDTO
			member.setId(id);
			member.setPw(pw);
			member.setName(name);
			member.setTel(tel);
			member.setAddr(addr);
			member.setEmail(email);
			MemberDAO md = MemberDAO.getInstance();
			int result = md.memInsert(member, authcheck, idcheck); // DB로 사용자 정보 저장
			System.out.println("joinProAction result : "+result);
			System.out.println("idcheck : "+idcheck);
			request.setAttribute("result", result);
			request.setAttribute("authcheck", authcheck);
			request.setAttribute("idcheck", idcheck);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memberJoinPro.jsp";
	}

}
