<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="t beante" class="w User.BeanTe" scope="page"/>
    <!-- �ڹ� ��ü �����Ϸ� pageContext�� ������ ��� -->
    <jsp:setProperty name="beantest" property="name" value="Batman"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<b>�ڹٺ� ��� ����</b>

	<h3><%= beantest.getName() %></h3>
	
	<h3><jsp:getProperty name="beantest" property="name"/></h3>
</body>
</html>