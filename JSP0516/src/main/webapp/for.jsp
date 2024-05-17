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
<h3>c:forTokens</h3>
	<c:forTokens items="123-456-789" delims="-" var="sel">
		${sel}<br>
	</c:forTokens>
</body>
</html>
