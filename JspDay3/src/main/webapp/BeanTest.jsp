<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="t beante" class="w User.BeanTe" scope="page"/>
    <!-- 자바 객체 생성완료 pageContext에 스코프 담김 -->
    <jsp:setProperty name="beantest" property="name" value="Batman"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<b>자바빈 사용 예제</b>

	<h3><%= beantest.getName() %></h3>
	
	<h3><jsp:getProperty name="beantest" property="name"/></h3>
</body>
</html>