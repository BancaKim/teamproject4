package net.login.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.db.UserBean;
import net.login.db.UserDAO;

 public class LoginAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		UserBean userbean = new UserBean();
		UserDAO userdao=new UserDAO();
		ActionForward forward= new ActionForward();
		HttpSession session = request.getSession();
		System.out.println("login action 들어옴");
		String user_id = (String)request.getParameter("user_id");
		System.out.println("userid:"+user_id);
		String user_pw = (String)request.getParameter("user_pw");
		System.out.println("user_pw:"+user_pw);
		
		
		 boolean usercheck=userdao.isUser(user_id, user_pw);
		 if(usercheck==false){
		   		response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('비밀번호 오류');");
		   		out.println("location.href='/main.lo';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		 }
		 
		UserBean userdata = userdao.getUserData(user_id); 
		 
		session.setAttribute("userId", user_id);
		
		if(user_id.equals("admin")) {
		   	forward.setRedirect(false);
	   		forward.setPath("/MemberListAction.lo");
	   		return forward;
		} else {
		   	forward.setRedirect(true);
	   		forward.setPath("main.lo");
	   		return forward;
		}
	 }
 }
 