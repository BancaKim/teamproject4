package net.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.*;

public class MemberDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
	   	boolean result=false;
	   	String user_id=(String)request.getParameter("user_id");
	   	
	   	UserDAO userdao=new UserDAO();
	   	
	   	result=userdao.userDelete(user_id);
	   	if(result==false){
	   		return null;
	   	}
	   	
	   	forward.setRedirect(true);
   		forward.setPath("./MemberListAction.lo");
   		return forward;
	 }
}