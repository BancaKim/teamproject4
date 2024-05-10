<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디지캠</title>
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
	<h1>로그인 화면</h1>
</div>
<div class="nes-container is-centered" style="display:flex; justify-content:center; border:0px;">
	<div class="nes-container with-title" style="width:500px; display:flex; justify-content:center; margin:50px;">
		<form name="form1" method="post" action="loginProcess.jsp">
			<input type="text"  class="nes-input is-success" placeholder="your ID"  name="id"/>
			<input type="password" class="nes-input is-success" placeholder="your Password" name="password"/>
			<input type="submit" class="nes-btn is-success" style="margin-top:10px; width:300px;" value="login"/>
			<button class="nes-btn is-warning" style="margin-top:10px; width:300px;">SignIn</button>
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