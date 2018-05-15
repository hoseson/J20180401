package service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocADTO;
import dao.SearchDAO;

public class DocSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			// 선택한의료진 출력
			String pagechk = request.getParameter("pagechk");
			String docNo = request.getParameter("docNo");
			SearchDAO sd = SearchDAO.getInstance();
			// 의사번호를 dao에 넘겨주고 정보를 가져온다.
			DocADTO doctor = sd.docList(docNo);
			// 의사경력
			List<String> career = sd.career(docNo);
			// 의사학회
			List<String> institute = sd.institute(docNo);
			System.out.println(doctor.getCureName());
			System.out.println(doctor.getDeptNo());
			System.out.println(doctor.getDocName());

			request.setAttribute("pagechk", pagechk);
			request.setAttribute("doctor", doctor);
			request.setAttribute("career", career);
			request.setAttribute("institute", institute);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "docInform.jsp";
	}

}
