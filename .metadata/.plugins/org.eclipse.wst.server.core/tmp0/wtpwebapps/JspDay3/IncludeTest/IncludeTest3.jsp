<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Enumeration"%>
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

%>
<table border=1>
<tr>
<td colspan="2">3 영역</td>
</tr>
<tr>
	<td>이름</td>
	<td><%=name %></td>
</tr>
<tr>
	<td>아이디</td>
	<td><%=id %></td>
</tr> 
</table>
</body>
</html>