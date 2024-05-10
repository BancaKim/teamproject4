<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banca@Dev</title>
<link rel="icon" href="images/favicon.ico">
<link rel="stylesheet" href="loginForm.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
</head>
<body>
	<div class="nav-container">
		<nav>
			<h2>Banca@Dev</h2>
			
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Explore</a></li>
				<li><a href="#">Review</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="#">Content</a></li>
				<li><a href="#">Help</a></li>
			</ul>
		</nav>
	</div>
	
<div class="login-container">
	<div class="login">
		<div class="logo">
		<i class='bx bx-user-circle'></i>
			<p>Login</p>	
		</div>
		
		<form action="loginProcess.jsp" method="post">
			<div class="input_box">
				<span>ID</span>
					<div class="icon">
						<i class='bx bxs-user' ></i>
						<input type="text" placeholder="Enter ID" name="id" required>
					</div>
			</div>
			<div class="input_box">
				<span>Password</span>
					<div class="icon">
						<i class='bx bxs-lock-alt' ></i>
						<input type="password" placeholder="Enter Password" name="password" required>
					</div>
			</div>
			<div class="forgot_password">
				<a href="#">Forgot Password?</a>
			</div>
			<button type="submit">Login</button>
			<p class="signup">Or Sign Up Using</p>
			<div class="social_icon">
				<a href="#" id="facebook"><i class='bx bxl-facebook' ></i></a>
				<a href="#" id="twitter"><i class='bx bxl-twitter' ></i></a>
				<a href="#" id="google"><i class='bx bxl-google' ></i></a>
				<a href="#" id="github"><i class='bx bxl-github' ></i></a>
			</div>
			<div class="alreadyAccount">
				<p>아직 회원가입을 하지 않았다면? <a href="joinForm.jsp">회원가입</a></p>
			</div>
			
		</form>
	</div>
	</div>
</body>
</html>