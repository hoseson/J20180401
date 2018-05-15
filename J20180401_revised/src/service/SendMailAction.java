package service;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

public class SendMailAction implements CommandProcess {
	public String randomNum() {//난수 발생 메소드
		StringBuffer buffer = new StringBuffer();//난수 저장 참조변수
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");//사용자가 입력한 이메일
		String tel = request.getParameter("tel");//사용자가 입력한 전화번호
		String id = request.getParameter("id");//사용자가 입력한 아이디
		String authcheck = request.getParameter("authcheck");//본인인증 확인에 강제성 부여를 위해 보낸 히든값
		request.setAttribute("authcheck", authcheck);
		String from = "beenjh6088@naver.com";//이메일을 보내는 자의 주소
		String authNum = randomNum();//난수 발생 메소드에서 발송한 난수
		String subject = "인증번호입니다.";//이메일 제목
		int result = 0;//result에 값에 따라 데이터를 보내는 페이지가 다르게 하기 위해 설정
		Properties p = new Properties();//이메일 보내기 세팅값을 저장하기 위한 객체
		p.put("mail.smtp.host", "smtp.naver.com");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			MemberDAO dao = MemberDAO.getInstance();
			if(email!=null&&tel!=null){//입력한 이메일과 전화번호의 유무 확인
				result = dao.findId(email, tel);//입력한 정보를 통해 아이디찾기
				if (result == 0) {//존재하지 않는다면..(result가 0일 때 찾고자하는 아이디가 존재하지않음)
					return "memberNotFoundEmail.jsp";//안내페이지로 이동
				}
				
			}
			if(email!=null&&id!=null){//입력한 이메일과 아이디의 유무 확인
				result = dao.findPw(email, id);//입력한 정보를 통해 비밀번호 찾기
				if(result ==0){//찾고자하는 아이디가 존재하지않는다면
					return "memberNotFoundEmail.jsp";//안내페이지로 이동
				}
			}

			Authenticator auth = new SMTPAuthenticatior();//이메일 아이디랑 비번 세팅
			Session ses = Session.getInstance(p, auth);//메일전송 세팅값인 p와 보내는이 이메일주소 객체인 auth를 인스턴스화시킨 후 세션에 저장

			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses);//메세지 내용에 ses객체를 담고 기본구조를 설정함
			msg.setSubject(subject);//제목 세팅(메세지 형식을 맞춰야함)
			msg.setContent(authNum, "text/html;charset=UTF-8");//내용 세팅(메세지 형식을 맞춰야함)
			request.setAttribute("authNum", authNum);

			Address fromAddr = new InternetAddress(from);//보내는사람
			msg.setFrom(fromAddr);//보내는 이 세팅(메세지 형식을 맞춰야함)

			Address toAddr = new InternetAddress(email);//받는 이
			msg.addRecipient(Message.RecipientType.TO, toAddr);//받는이 세팅

			Transport.send(msg);//메세지 전송

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result == 1) {//결과값이 1일경우 memberFindId.jsp로 이동하기 위해 설정
			request.setAttribute("email", email);
			request.setAttribute("tel", tel);
			return "memberFindId.jsp";
		}
		if (result == 2){//결과값이 2일경우 memberFindPw.jsp로 이동하기 위해 설정
			request.setAttribute("email", email);
			request.setAttribute("id", id);
			return "memberFindPw.jsp";
		}
		else {
			return "sendMail.jsp";
		}
	}

}
