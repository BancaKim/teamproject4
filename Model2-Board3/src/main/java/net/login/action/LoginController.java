package net.login.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
		HttpSession session=request.getSession();
		   if(command.equals("/MainLoginForm.lo")){
			   forward=new ActionForward();
			   forward.setRedirect(true);
			   forward.setPath("./login/loginForm.jsp");
		   }else if(command.equals("/MainLogout.lo")){
			   session.invalidate();
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./index.jsp");
		   }else if(command.equals("/LoginForm.lo")){
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("./login/loginForm.jsp");		   
		   }else if(command.equals("/main.lo")){
			   System.out.println("main place");
				   forward=new ActionForward();
				   forward.setRedirect(false);
				   forward.setPath("./index.jsp");	   
			}else if(command.equals("/LoginAction.lo")){
				   action = new LoginAction();
				   try{
					   forward=action.execute(request, response);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
		   }else if(command.equals("/joinForm.lo")){
				   forward=new ActionForward();
				   forward.setRedirect(true);
				   forward.setPath("./login/joinForm.jsp");
			}else if(command.equals("/joinAction.lo")){
				System.out.println("join controller");
				   action = new JoinAction();
				   try{
					   forward=action.execute(request, response);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			}else if(command.equals("/MemberListAction.lo")){
				   action = new MemberListAction();
				   try{
					   forward=action.execute(request, response);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			}else if(command.equals("/MemberViewAction.lo")){
				   action = new MemberViewAction();
				   try{
					   forward=action.execute(request, response);
				   }catch(Exception e){
					   e.printStackTrace();
				   }
			}else if(command.equals("/MemberDeleteAction.lo")){
				   action = new MemberDeleteAction();
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
