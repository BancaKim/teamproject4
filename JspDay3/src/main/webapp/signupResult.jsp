<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<jsp:useBean id="signupbe" class="w" scope="page"/>
    <!-- 자바 객체 생성완료 pageContext에 스코프 담김 -->
	<jsp:setProperty property="*" name="signupbean"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Result</title>
<style>
body {
	display: flex;
	justify-content : center;
	align-items : center;
}
</style>
</head>
<body>

<table border="1">
	<tr>
	<td>id</td>	<td><jsp:getProperty property="id" name="signupbean"/></td>
	</tr>
	<tr>
	<td>password</td>	<td><jsp:getProperty property="password" name="signupbean"/></td>
	</tr>
	<tr>
	<td>email</td>	<td><jsp:getProperty property="email" name="signupbean"/></td>
	</tr>
	<tr>
	<td>userName</td>	<td><jsp:getProperty property="userName" name="signupbean"/></td>
	</tr>
	<tr>
	<td>ssn</td>	<td><jsp:getProperty property="ssn" name="signupbean"/></td>
	</tr>
	<tr>
	<td>birthYear</td>	<td><jsp:getProperty property="birthYear" name="signupbean"/></td>
	</tr>
	<tr>
	<td>birthMonth</td>	<td><jsp:getProperty property="birthMonth" name="signupbean"/></td>
	</tr>
	<tr>
	<td>birthDay</td>	<td><jsp:getProperty property="birthDay" name="signupbean"/></td>
	</tr>
	<tr>
	<td>hobby</td>	<td>
		<%
		for(String hobby : signupbean.getHobbies()){
			out.println(hobby+"<br>");
		}%>
	</td>
	</tr>
	<tr>
	<td>introduction</td>	<td><jsp:getProperty property="introduction" name="signupbean"/></td>
	</tr>
</table>
</body>
</html>