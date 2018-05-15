package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMailProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String number = request.getParameter("number");//사용자가 인증번호 입력란에 입력한 숫자
		String authNum = (String)request.getParameter("authNum");//난수 발생 메소드에서 발송한 난수
		String authcheck = request.getParameter("authcheck");//본인인증 확인에 강제성 부여를 위해 보낸 히든값
		request.setAttribute("number", number);
		request.setAttribute("authNum", authNum);
		request.setAttribute("authcheck", authcheck);

		return "sendMailPro.jsp";
	}

}
