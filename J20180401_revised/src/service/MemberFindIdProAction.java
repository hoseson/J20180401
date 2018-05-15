package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class MemberFindIdProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String number = request.getParameter("number");// 사용자가 인증번호 입력란에 입력한
		// 숫자
		String authNum = request.getParameter("authNum");// 난수 발생 메소드에서 발송한
		// 난수
		String email = request.getParameter("email");// 사용자가 입력한 이메일
		String tel = request.getParameter("tel");// 사용자가 입력한 전화번호
		String id = "";// 조건에 부합할 경우 아이디를 정장하기 위한 아이디 참조변수 설정
		try {
			if (number.equals(authNum)) {
				// 사용자가 입력한 번호와 생성된 인증번호 일치여부
				MemberDAO dao = MemberDAO.getInstance();
				id = dao.getId(email, tel); // 일치했을 경우 아이디를 db로부터 추출
			}else{
				id=null;
			}
			System.out.println("findIdProAction id : "+id);
			request.setAttribute("id", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "memberFindIdPro.jsp";
	}

}
