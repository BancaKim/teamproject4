<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
<p><center>
<head>
<meta charset="UTF-8">
<title> Banca@Dev </title> 
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
<link rel="icon" href="images/favicon.ico">
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script defer src="./login.js">
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="loginForm.jsp">
    	<i class="nes-icon reddit is-large"></i>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="joinForm.jsp">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Main.jsp">메인화면</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            회원정보
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
            <li><a class="dropdown-item" href="#">회원가입</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="title-container" style="display:flex; justify-content:center; align-items:center;">
<i class="nes-pokeball"></i>
<h1>회원가입</h1>
</div>

<form action = "joinProcess.jsp" id="regiform" method="post">

<div class="nes-table-responsive" style="margin:10px;">
	<table class="nes-table is-bordered is-centered" bgcolor = "white" border="1">

<tr style="height: 40px;">
<td colspan="2" bgcolor="pink"> <center> 회원기본정보 </td>
</tr>

<tr> 
<td bgcolor="gray"> <center> 아이디: </td>
<td> <input type="text" name="id" id="id" size="20"> 4~12자의 영문 대소문자와 숫자로만 입력 </td>
</tr>

<tr> 
<td bgcolor="gray"> <center> 비밀번호: </td>
<td> <input type="password" name="password" id="password" size="20"> 4~12자의 영문 대소문자와 숫자로만 입력 </td>
</tr>

<tr> 
<td bgcolor="gray">  <center>비밀번호확인: </td>
<td><input type="password" name="checkPassword" id="checkPassword"  size="20"> </td>
</tr>

<tr> 
<td bgcolor="gray"> <center>메일주소: 
<td> <input type="text" name="email" id="email" size="20"> 예)  id@domain.com </td>
</tr>

<tr> 
<td bgcolor="gray">  <center>이름: 
<td> <input type="text" name="userName" id="userName" size="20"> </td>
</tr>

<tr style="height: 40px;">
<td colspan="2" bgcolor="pink"> <center> 개인 신상 정보 </td>
</tr>

<tr> 
<td bgcolor="gray"> <center> 주민등록번호: </td>
<td> <input type="text" name="ssn" id="ssn" size="20"> 예)1234561234567 </td>
</tr>

<tr> 
<td bgcolor="gray"> <center> 자기소개: </td>
<td> <center> <textarea name = "introduction"  id="introduction" cols="70" rows="5" style="width: 100%; height: 300%;" ></textarea> </td>
</tr>

</table>

</div>
</form>

<button type="button" class="nes-btn is-success" onclick="allFun()">회원가입</button> 
<button type="button" class="nes-btn is-error" onclick="clearForm()">다시입력</button>

</body>

</html>