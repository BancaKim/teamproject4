<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>c:remove</h3>

	<c:set value="batman" var="msg"/>
	msg: <c:out value="${msg}"/><br>
	msg: ${msg}<br>
	<c:remove var="msg"/>
	after remove : <c:out value="${msg}"/>
	
	</body>
</html>
