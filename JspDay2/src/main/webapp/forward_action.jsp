<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>forward_action.jsp에서 작성한 내용입니다</h2>
forward에서 작성한 내용은 출력되지 않습니다.
	<jsp:forward page="footer2.jsp">
		<jsp:param name = "email" value = "test@test.net"/>
		<jsp:param name = "tel" value = "000-000-0000"/>
	</jsp:forward>		
</body>
</html>