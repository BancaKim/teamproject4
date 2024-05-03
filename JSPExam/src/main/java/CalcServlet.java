

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
		//Ŭ���̾�Ʈ ���� �� ���޵� �������� ���� mime type�� ĳ���ͼ� ����
		res.setContentType("text/html; charset=euc-kr");
		
		//Ŭ���̾�Ʈ ������ ���� ��� ��Ʈ�� Ȯ��
		PrintWriter out = res.getWriter();
		
		//html form �� ���� ���޵� num1, num2 �з����� ���� ������ �Ҵ�
		// �̶� getParameter() �޼ҵ�� ���ڿ��� �����ϹǷ� ������ �������� ��� Integer.parseInt()
		
		num1 = Integer.parseInt(req.getParameter("num1"));
		num2 = Integer.parseInt(req.getParameter("num2"));
		op = req.getParameter("operator");
		//calc() �޼��� ȣ��� ��� �޾ƿ�.
		result = calc(num1, num2, op);

		//��� ��Ʈ���� ���� ȭ�� ����
		out.println("<HTML>");
		out.println("<HEAD><TITLE>����</TITLE></HEAD>");
		out.println("<BODY><CENTER>");
		out.println("<H2>�����");
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