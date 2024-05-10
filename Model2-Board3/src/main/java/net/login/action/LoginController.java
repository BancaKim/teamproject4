package net.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();

    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI(); // 주소 가져오기
		String contextPath = request.getContextPath(); // context(프로젝트명)까지 가져오기
		String command = RequestURI.substring(contextPath.length()); //그길이 이후부분만 substring으로 가져오기
		ActionForward forward = null; //request인지 forward인지 결정
		Action action = null;  //인터페이스 - 동적 바인딩
		   if(command.equals("/LoginForm.lo")){
			   forward=new ActionForward();
			   forward.setRedirect(true);
			   forward.setPath("./login/loginForm.jsp");
		   }else if(command.equals("/main.lo")){
				   forward=new ActionForward();
				   forward.setRedirect(true);
				   forward.setPath("./index.jsp");	   
			}else if(command.equals("/BoardModify.bo")){
				   action = new LoginAction();
				   try{
					   forward=action.execute(request, response);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			}
		   
		   if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath());
		   }else{
			   RequestDispatcher dispatcher=
				   request.getRequestDispatcher(forward.getPath());
			   dispatcher.forward(request, response);
	 }
 }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	
}
