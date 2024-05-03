<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>

	<script>
		alert("로그아웃 되셨습니다.");
	</script>
	<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
</head>
<body>
<%out.print("<script>(\"로그아웃 되었습니다.\");</script>"); %>
<%session.invalidate(); %>
<%response.sendRedirect("login.jsp"); %>
</body>
</html>