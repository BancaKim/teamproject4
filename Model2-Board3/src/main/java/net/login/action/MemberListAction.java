package net.login.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.login.db.UserDAO;

 public class MemberListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		UserDAO userdao=new UserDAO();
		List userlist=new ArrayList();
		
	  	int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("getUserCount 전");
		int listcount=userdao.getUserCount(); 
		System.out.println("listCount="+listcount);
		userlist = userdao.getUserList(page,limit); 
		
   		int maxpage=(int)((double)listcount/limit+0.95); 
   		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   		int endpage = maxpage;
   		
   		if (endpage>startpage+10-1) endpage=startpage+10-1;
   		System.out.println("page:"+page);
   		System.out.println("maxpage:"+maxpage);
   		System.out.println("startpage:"+startpage);
   		System.out.println("endpage:"+endpage);
   		System.out.println("listcount:"+listcount);
   		System.out.println("userlist:"+userlist);

   		request.setAttribute("page", page);		
   		request.setAttribute("maxpage", maxpage); 
   		request.setAttribute("startpage", startpage);
   		request.setAttribute("endpage", endpage);     
		request.setAttribute("listcount",listcount); 
		request.setAttribute("userlist", userlist);
		
		ActionForward forward= new ActionForward();
	   	forward.setRedirect(false);
   		forward.setPath("./login/Member_list.jsp");
   		return forward;
	 }
 }