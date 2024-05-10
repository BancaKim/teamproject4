package net.login.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserBean;
import net.login.db.UserDAO;

 public class LoginAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		UserBean userbean = new UserBean();
		UserDAO userdao=new UserDAO();
		ActionForward forward= new ActionForward();
		List boardlist=new ArrayList();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		
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
		 
		request.setAttribute("userdata", userdata);
		
		if(user_id.equals("admin")) {
		   	forward.setRedirect(false);
	   		forward.setPath("/MemberListAction.lo");
	   		return forward;
		} else {
		   	forward.setRedirect(true);
	   		forward.setPath("/main.lo");
	   		return forward;
		}
	 }
 }
		
		
		
		
		
		
		
		
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=boarddao.getListCount(); 
		boardlist = boarddao.getBoardList(page,limit); 
		
   		int maxpage=(int)((double)listcount/limit+0.95); 
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		
   		request.setAttribute("page", page);		
   		request.setAttribute("maxpage", maxpage); 
   		request.setAttribute("startpage", startpage);
   		request.setAttribute("endpage", endpage);     
		request.setAttribute("listcount",listcount); 
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward= new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./board/qna_board_list.jsp");
   		return forward;
	 }
 }