package net.login.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.db.UserBean;
import net.login.db.UserDAO;

public class JoinAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		UserDAO userdao=new UserDAO();
		UserBean userdata=new UserBean();
	   	ActionForward forward=new ActionForward();
	   	HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
	   	System.out.println("joinaction in execute");
   		
   		try{
   			userdata.setUser_id(request.getParameter("user_id"));
   			userdata.setUser_pw(request.getParameter("user_pw"));
	   		userdata.setEmail(request.getParameter("email"));
	   		userdata.setUser_name(request.getParameter("user_name"));
	   		userdata.setSsn(request.getParameter("ssn"));
	   		userdata.setIntroduction(request.getParameter("introduction"));
	   		
	   		System.out.println("getUser_id:"+userdata.getUser_id());
	   		
	   		boolean result = userdao.hasUser(request.getParameter("user_id"));
	   		if(result==true){
	   			System.out.println("중복되는 아이디가 있습니다.");
	   			response.setContentType("text/html;charset=");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert(아이디 중복');");
		   		out.println("location.href='../joinForm.lo';");
		   		out.println("</script>");
		   		out.close();
	   			return null;
	   		}
	   		
	   		boolean result2 = userdao.insertUser(userdata);
	   		
	   		if(result2 == true) {

		   		System.out.println("회원가입에 성공하였습니다.");
//	   			response.setContentType("text/html;charset=utf-8");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert(회원가입에 성공하였습니다');");
//		   		out.println("</script>");
//		   		out.close();
		   		session.setAttribute("userId",userdata.getUser_id());
		   		forward.setRedirect(true);
		   		forward.setPath("./main.lo");
		   		System.out.println(forward.getPath());
		   		return forward;
	   		}
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}