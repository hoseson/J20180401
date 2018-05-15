package service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticatior extends Authenticator{
	
	@Override
	//이메일 전송을 위한 메소드(보내는 이의 아이디와 패스워드)
	protected PasswordAuthentication getPasswordAuthentication(){
		return new PasswordAuthentication("beenjh6088@naver.com", "wnsgud00!!");
	}
}
