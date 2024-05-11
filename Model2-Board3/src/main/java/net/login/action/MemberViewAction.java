package net.login.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserBean;
import net.login.db.UserDAO;

 public class MemberViewAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("euc-kr");
   		
		UserDAO userdao=new UserDAO();
		UserBean userdata=new UserBean();
	   	
		String user_id=(String)request.getParameter("user_id");
	   	userdata=userdao.getDetail(user_id);
	   	
	   	if(userdata==null){
	   		System.out.println("해당 회원 없습니다");
	   		return null;
	   	}
	   	System.out.println("조회완료");
	   	
	   	request.setAttribute("userdata",userdata);
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./login/Member_info.jsp");
   		return forward;

	 }
}