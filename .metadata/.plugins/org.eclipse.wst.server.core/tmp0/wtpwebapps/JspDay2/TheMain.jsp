<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JSP ����</title>
</head>
<body>
<center>
	<h1>����� JSP ���¼�!!</h1>
	<hr>
	<div>
		<%@ include file="TheBar.jsp" %>
	</div>
	
	<table>
	<tr>
	<td>	<%@ include file="TheBody1.jsp" %></td>
	<td>	<%@ include file="TheBody2.jsp" %></td>
	</tr>
	</table>
</center>
</body>
</html>