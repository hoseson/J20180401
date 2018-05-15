package control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// map 변수 선언 key , value
	private Map<String, Object> commandMap = new HashMap<String, Object>();

	public void init(ServletConfig config) throws ServletException {
		// 최초 한번 실행(서블릿이 서버에 올라갈 때)
		// web.xml에 있는 config 파라미터를 받아옴 > command.properties 파일의 명령어를 받아옴
		String props = config.getInitParameter("config");
		// 속성값 객체화 선언
		Properties pr = new Properties();
		FileInputStream f = null;
		try {
			// config가 있는 경로 설정
			String configFilePath = config.getServletContext().getRealPath(props);
			// /WEB-INF/command.properties 가 들어감
			f = new FileInputStream(configFilePath);
			// command.properties에 있는 /list.do=service.ListAction를 포함한 모든 소스 로드함
			pr.load(f);
		} catch (IOException e) {
			throw new ServletException(e);
		} finally {
			if (f != null)
				try {
					f.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		// command.properties에 명령어가 여러개 있다고 가정하여 iterator 사용
		Iterator keyIter = pr.keySet().iterator();
		while (keyIter.hasNext()) {
			// command.properties에 명령어에 있는 경우 변수에 넣음
			String command = (String) keyIter.next(); // /list.do 
			String className = pr.getProperty(command); // service.ListAction 가
														// 들어감
			try {
				// 해당 문자열을 클래스로 만듬 = new ListAction(); 
				Class commandClass = Class.forName(className);
				// 클래스를 인스턴스화 함 class > object 가 됨
				Object commandInstance = commandClass.newInstance();
				// map에 key와 value를 넣음  ( list.do  , (Object)service.ListAction )
				commandMap.put(command, commandInstance);
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		CommandProcess com = null;
		try {
			// pacakage.list.do 를 받아옴 = uri 주소
			String command = request.getRequestURI();
			System.out.println(command);
			//pacakage.list.do 중 pacakage가 잘림
			command = command.substring(request.getContextPath().length());
			//value값(object)를 가져옴  com = service.ListAction;
			com = (CommandProcess) commandMap.get(command);
			System.out.println("command > " + command);
			System.out.println("com > " + com);
			//requestPro를 하는순간 list.do 실행 view에는 list.jsp가 들아감
			view = com.requestPro(request, response);
			System.out.println("view > " + view);
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		//list.jsp 이동
		RequestDispatcher ds = request.getRequestDispatcher(view);
		ds.forward(request, response);
	}

}
