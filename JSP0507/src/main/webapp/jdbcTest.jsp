<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn=null;
	
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/mydb?serverTimezone=UTC";
	
	Boolean connect=false;
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url,"root","qwe123!@#");
		
		connect=true;
		
		conn.close();
	}catch(Exception e){
		connect=false;
		e.printStackTrace();
	}
%>
<html>
<head>
<title>JDBC ���� �׽�Ʈ ����</title>
</head>
<body>
<h3>
<%if(connect==true){ %>
	����Ǿ����ϴ�.
<%}else{ %>
	���ῡ �����Ͽ����ϴ�.
<%} %>
</h3>
</body>
</html>