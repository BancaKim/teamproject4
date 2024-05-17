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
	1.선택한 상품 : ${param.sel}<br>
	2. num1 값 : ${eltest.num1}<br>
	3. num2 값 : ${eltest.num2}<br>
	4. num1+num2 : ${eltest.num1+eltest.num2}
</body>
</html>