<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="el.test.*" %>

<% 
Eltest eltest = (Eltest)session.getAttribute("eltest");
String selectItem = (String)request.getParameter("sel");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	1.선택한 상품 : <%= request.getParameter("sel") %><br>
	2. num1 값 : <%= eltest.getNum1() %><br>
	3. num2 값 : <%= eltest.getNum2() %><br>
	4. num1+num2 : <%= eltest.getNum1()+ eltest.getNum2() %>
</body>
</html>