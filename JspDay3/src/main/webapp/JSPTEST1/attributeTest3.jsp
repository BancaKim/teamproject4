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
	String name = (String)application.getAttribute("name");
	String id = (String)application.getAttribute("id");
	String email = (String)session.getAttribute("email");
	String address = (String)session.getAttribute("address");
	String tel = (String)session.getAttribute("tel");

%>
<table border=1>
<tr>
<td colspan="2">Application 영역</td>
</tr>
<tr>
	<td>이름</td>
	<td><%=application.getAttribute("name") %></td>
</tr>
<tr>
	<td>아이디</td>
	<td><%=application.getAttribute("id") %></td>
</tr> 
</table>
<br>

<table border="1">
<tr>
<td colspan="2">Session 영역</td>
</tr>
<%
Enumeration e = session.getAttributeNames();
while(e.hasMoreElements()){
String attributeName = (String)e.nextElement();
String attributeValue = (String)session.getAttribute(attributeName);
%>

<tr>
	<td><%=attributeName %></td>
	<td><%=attributeValue %></td>
</tr>
<%
}
%>
</table>
</body>
</html>