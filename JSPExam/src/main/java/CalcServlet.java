

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		int num1, num2;
		int result;
		String op;
		//클라이언트 응답 시 전달될 컨텐츠에 대한 mime type과 캐릭터셋 지정
		res.setContentType("text/html; charset=euc-kr");
		
		//클라이언트 응답을 위한 출력 스트림 확보
		PrintWriter out = res.getWriter();
		
		//html form 을 통해 전달된 num1, num2 패러미터 값을 변수에 할당
		// 이때 getParameter() 메소드는 문자열을 리턴하므로 숫자형 데임터의 경우 Integer.parseInt()
		
		num1 = Integer.parseInt(req.getParameter("num1"));
		num2 = Integer.parseInt(req.getParameter("num2"));
		op = req.getParameter("operator");
		//calc() 메서드 호출로 결과 받아옴.
		result = calc(num1, num2, op);

		//출력 스트림을 통해 화면 구성
		out.println("<HTML>");
		out.println("<HEAD><TITLE>계산기</TITLE></HEAD>");
		out.println("<BODY><CENTER>");
		out.println("<H2>계산결과");
		out.println("<HR>");
	}
	
	public int calc(int num1, int num2, String op) {
		switch(op) {
		case "+":
			return num1+num2;
		case "-":
			return num1-num2;
		case "*":
			return num1*num2;
		default:
			return num1/num2;
		}
	}
}