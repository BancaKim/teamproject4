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
	<h3>상품목록 - JSTL 버전</h3>
	
	<form name=form1 method="post" action="./jstl_ex4.jsp">
		<jsp:useBean id="eltest" class="el.test.Eltest" scope="session"/>
			
			<select name="sel">
				<c:forEach items="${eltest.productList}" var="item">
					<option>${item}</option>
				</c:forEach>
			</select>
		<input type="submit" value="선택"/>
	</form>
</body>
</html>
