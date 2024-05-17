package net.basket.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.basket.db.BasketDAO;

public class GoPayAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BasketDAO basketdao = new BasketDAO();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		System.out.println("item addaction in execute");

		try {
			String user_id = (String) session.getAttribute("userId");
			HashMap<String, Integer> finalMap = (HashMap<String, Integer>) session.getAttribute("itemMap");

			for (Entry<String, Integer> entry : finalMap.entrySet()) {
				basketdao.payItem(user_id, entry.getKey(),entry.getValue());
			}
				session.removeAttribute("itemMap");		 
				response.setContentType("text/html;charset=utf-8"); 
				PrintWriter out=response.getWriter(); 
				out.println("<script>");
				out.println("alert('결제가 완료되었습니다.')"); 
				out.println("location.href='./main.lo'");				
				out.println("</script>");
				out.close(); 
				return null;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}