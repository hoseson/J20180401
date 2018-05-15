package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConDAO;
import dao.ConDTO;

public class ConWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String str="";
		try{
		String pageNum=request.getParameter("pageNum");
		String deptName=request.getParameter("deptName");
		String memNo=request.getParameter("memNo");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		ConDAO cd = ConDAO.getInstance();
		ConDTO con = new ConDTO();
		con.setMemNo(memNo);
		con.setDeptName(deptName);
		con.setSubject(subject);
		con.setContent(content);
		int result = cd.insert(con);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("deptName", deptName);
		if(result>0){
			str= "conListAction.do";
		}else{
			str= "conWriteAction.do";
		}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return str;
		
	}

}
