<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String id = request.getParameter("id"); 

request.getRequestDispatcher("dataTest3.jsp").forward(request,response);
%>

<a href="dataTest3.jsp">확인하러 가기</a>

</body>
</html>