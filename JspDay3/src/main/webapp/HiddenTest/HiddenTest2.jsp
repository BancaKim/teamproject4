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

%>

	<form action="HiddenTest3.jsp" method="post">
	<table border=1>
		<tr>
			<td colspan="2">Application 영역에 저장할 내용들</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="hidden" name="name" value="<%= name %>"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="hidden" name="id" value="<%= id %>"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="전송"></td>
		</tr>
</table>
</form>
</body>
</html>