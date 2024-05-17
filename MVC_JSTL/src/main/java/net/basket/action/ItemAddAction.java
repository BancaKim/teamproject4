package net.basket.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
   			HashMap<String, Integer> finalMap = (HashMap<String, Integer>) session.getAttribute("itemMap");
   			if(finalMap==null){
   				finalMap= new HashMap<String, Integer>();
   			}
   			
   			if(!request.getParameter("apple_num").equals("")) {
   				finalMap.put(request.getParameter("apple"), Integer.parseInt(request.getParameter("apple_num")));
   			}
   			
   			if(!request.getParameter("peer_num").equals("")) {
   				finalMap.put(request.getParameter("peer"), Integer.parseInt(request.getParameter("peer_num")));
   			}
   			
   			if(!request.getParameter("mandarin_num").equals("")) {
   				finalMap.put(request.getParameter("mandarin"), Integer.parseInt(request.getParameter("mandarin_num")));
   				
   			}
	   		
   			int count = 0;
   			int result = 0;
   			
   			for (Entry<String, Integer> entry: finalMap.entrySet()){
	   		
   			if(basketdao.insertItem(user_id, entry.getKey(),entry.getValue())){
   				result++;
   				}
   	 		count ++;
   			}
   			
	   		if(result == count) {

		   		System.out.println("장바구니 추가에 성공하였습니다.");
				/*
				 * response.setContentType("text/html;charset=utf-8"); PrintWriter
				 * out=response.getWriter(); out.println("<script>");
				 * out.println("alert('장바구니 추가에 성공하였습니다.')"); out.println("</script>");
				 * out.close(); return null;
				 */
		   		
		   		session.removeAttribute("itemmap");
				/*
				 * session.invalidate(); session = request.getSession();
				 * session.setAttribute("userId",user_id);
				 */
	   			finalMap= new HashMap<String, Integer>();
		   		finalMap.put("사과", basketdao.getItem(user_id,"사과")) ;
		   		finalMap.put("배", basketdao.getItem(user_id,"배")) ;
		   		finalMap.put("귤", basketdao.getItem(user_id,"귤")) ;
		   		session.setAttribute("itemMap",finalMap);
		   		
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