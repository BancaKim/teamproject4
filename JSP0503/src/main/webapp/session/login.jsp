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
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
</head>
<body>
<div align="center">
	<h2>로그인</h2>
	<p>이름을 입력하고 로그인하세요.
</div>
<div class="nes-container is-centered" style="display:flex; justify-content:center; border:0px;">
	<div class="nes-container with-title" style="width:600px; display:flex; justify-content:center;">
		<p class="title">로그인</p>
		<form name="form1" method="post" action="setProduct.jsp" style="display:flex; align-items:center;">
			<input type="text"  class="nes-input is-success" placeholder="your ID"  name="name" style="margin-right: 10px;"/>
			<input type="submit" class="nes-btn is-success" value="login"/>
		</form>
	</div>
</div>
<section class="icon-list" style="display:flex; justify-content:center; margin:20px">
  <!-- Copyright Nintendo -->
  <i class="nes-mario"></i>
  <i class="nes-ash"></i>
  <i class="nes-pokeball"></i>
  <i class="nes-bulbasaur"></i>
  <i class="nes-charmander"></i>
  <i class="nes-squirtle"></i>
  <i class="nes-kirby"></i>
</section>
</body>
</html>