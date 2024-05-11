<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="joinForm.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
   	<script defer src="./login.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</head>
<body>
    <div class="main-container">
        <nav>
            <img src="../image/logo.png" class="logo">
            <ul>
                <li><a href="../main.lo">홈</a></li>
                <li><a href="../BoardList.bo">게시판</a></li>
                <li><a href="#">장바구니</a></li>                
            </ul>
            <div>
                <a href="../LoginForm.lo" class="btn">로그인</a>                
            </div>
        </nav>
        <div class="content">

        <h1>회원가입</h1>
        	<form action = "../joinAction.lo" id="regiform" method="post">
				<table class="signup">
			
					<tr>
					<td colspan="2" bgcolor="pink">회원기본정보 </td>
					</tr>
			
					<tr> 
					<td>아이디</td>
					<td> <input type="text" name="user_id" id="id" size="20"> 4~12자의 영문 대소문자와 숫자로만 입력 </td>
					</tr>
			
					<tr> 
					<td>비밀번호</td>
					<td> <input type="password" name="user_pw" id="password" size="20"> 4~12자의 영문 대소문자와 숫자로만 입력 </td>
					</tr>
					
					<tr> 
					<td>비밀번호 확인</td>
					<td><input type="password" name="checkPassword" id="checkPassword"  size="20"> </td>
					</tr>
					
					<tr> 
					<td>메일주소</td>
					<td> <input type="text" name="email" id="email" size="20"> 예)  id@domain.com </td>
					</tr>
					
					<tr> 
					<td>이름</td>
					<td><input type="text" name="user_name" id="userName" size="20"> </td>
					</tr>
					
					<tr style="height: 40px;">
					<td colspan="2" bgcolor="pink">개인 신상 정보 </td>
					</tr>
					
					<tr> 
					<td>주민등록번호</td>
					<td> <input type="text" name="ssn" id="ssn" size="20"> 예)1234561234567 </td>
					</tr>
					
					<tr> 
					<td>자기소개</td>
					<td><textarea name = "introduction"  id="introduction" cols="70" rows="5" style="width: 100%; height: 300%;" ></textarea> </td>
					</tr>
			
				</table>
			<div class="register-button flex justify-center items-center"> 
				<input type="submit" class="text-white bg-gradient-to-r from-pink-400 via-pink-500 to-pink-600 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-pink-300 dark:focus:ring-pink-800 shadow-lg shadow-pink-500/50 dark:shadow-lg dark:shadow-pink-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2" value="회원가입"/>
				<button type="button" class="text-white bg-gradient-to-r from-purple-500 via-purple-600 to-purple-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-purple-300 dark:focus:ring-purple-800 shadow-lg shadow-purple-500/50 dark:shadow-lg dark:shadow-purple-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2" onclick="clearForm()">다시입력</button>
			</div>
			</form>
			</div>
        </div>
</body>

</html>