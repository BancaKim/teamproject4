<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="el.test.*" %>

<% Eltest eltest = new Eltest();
session.setAttribute("eltest", eltest);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상품목록 - JSTL 버전</h3>
	
	<form name=form1 method="post" action="./ex4.jsp">
			
			<select name="sel">
			<% for(String test : eltest.getProductList()){ %>
			<option><%= test %></option>
			<% } %>
			</select>
		<input type="submit" value="선택"/>
	</form>
</body>
</html>
