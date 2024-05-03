<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
</head>
<body>
<div align="center">
	<h2>로그인</h2>
	<p>이름을 입력하고 로그인하세요.
</div>

<div align="center">
<form name="form1" method="post" action="setProduct.jsp">
<input type="text" name="name"/>
<input type="submit" value="login"/>

</form>


</div>


</body>
</html>