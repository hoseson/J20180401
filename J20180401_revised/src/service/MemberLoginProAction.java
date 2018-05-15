package service;

import java.io.IOException; 
 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

import dao.MemberDAO;
import dao.MemberDTO;

public class MemberLoginProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			// 입력한 id pw 받아옴
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			MemberDAO md = MemberDAO.getInstance();
			MemberDTO memInfo = md.getMemInfo(id);
			int result = md.memLogin(id, pw); // id pw 체크
			request.setAttribute("result", result); // 결과값 전송 0,1,-1
			request.setAttribute("id", id); // 아이디 전송, 세션에 저장용
			request.setAttribute("memNo", memInfo.getMemno());
			request.setAttribute("manage", memInfo.getManage());
		 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "memberLoginPro.jsp";
	}
}
