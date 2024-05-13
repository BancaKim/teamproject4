package net.basket.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.basket.db.BasketBean;
import net.basket.db.BasketDAO;

public class ItemAddAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		BasketDAO basketdao=new BasketDAO();
	   	ActionForward forward=new ActionForward();
	   	HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
	   	System.out.println("item addaction in execute");
   		
   		try{
   			
   			String user_id = (String)session.getAttribute("userId");
	   		int apple_num = Integer.parseInt(request.getParameter("apple_num"));
	   		int peer_num = Integer.parseInt(request.getParameter("peer_num"));
	   		int mandarin_num = Integer.parseInt(request.getParameter("mandarin_num"));
	   		System.out.println("apple_num: "+apple_num);
	   		System.out.println("peer_num: "+peer_num);
	   		System.out.println("manda: "+mandarin_num);
	   		
	   		
	   		boolean result1 = basketdao.insertItem(user_id, "사과",apple_num);
	   		boolean result2 = basketdao.insertItem(user_id, "배", peer_num);
	   		boolean result3 = basketdao.insertItem(user_id, "귤", mandarin_num);
	   		
	   		if(result1 == true&&result2 == true&&result3 == true) {

		   		System.out.println("장바구니 추가에 성공하였습니다.");
//	   			response.setContentType("text/html;charset=utf-8");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert(회원가입에 성공하였습니다');");
//		   		out.println("</script>");
//		   		out.close();
		   		
		   		apple_num = basketdao.getItem(user_id,"사과");
		   		peer_num = basketdao.getItem(user_id,"배");
		   		mandarin_num = basketdao.getItem(user_id,"귤");
		   		
		   		session.setAttribute("apple_num",apple_num);
		   		session.setAttribute("peer_num",peer_num);
		   		session.setAttribute("mandarin_num",mandarin_num);
		   		
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("./basket/confirmItem.jsp");
		   		System.out.println(forward.getPath());
		   		return forward;
	   		}
	   		
  		}catch(Exception ex){
   			ex.printStackTrace();
   		}
  		return null;
	}  	
}