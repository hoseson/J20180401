package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class MemberFindPwProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			String number = request.getParameter("number");// 사용자가 인증번호 입력란에 입력한
															// 숫자
			String authNum = request.getParameter("authNum");// 난수 발생 메소드에서 발송한
																// 난수
			String email = request.getParameter("email");// 사용자가 입력한 이메일
			String id = request.getParameter("id");// 사용자가 입력한 아이디
			String pw = "";
			if (number.equals(authNum)) {
				// 입력한 숫자와 난수의 일치여부
				MemberDAO dao = MemberDAO.getInstance();
				pw = dao.getPw(email, id);// 일치할 경우 DB로부터 비밀번호 추출
				request.setAttribute("pw", pw);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "memberFindPwPro.jsp";
	}
}
