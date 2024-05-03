<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>footer에서 작성한 파일입니다.</h3>
<hr>
	<%=request.getParameter("email") %>,
	<%=request.getParameter("tel") %>,
</body>
</html>