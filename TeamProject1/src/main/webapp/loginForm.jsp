<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale="1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="loginForm.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
</head>
<body>

<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Banca@log</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-Secondary" type="submit">
        <i class='bx bx-search' ></i>
        </button>
      </form>
    </div>
  </div>
</nav>
	
<div class="login-container">
	<div class="login">
		<div class="logo">
		<i class='bx bx-user-circle'></i>
			<p>Login</p>	
		</div>
		
		<form action="#">
			<div class="input_box">
				<span>Username</span>
					<div class="icon">
						<i class='bx bxs-user' ></i>
						<input type="text" placeholder="Enter Username" required>
					</div>
			</div>
			<div class="input_box">
				<span>Password</span>
					<div class="icon">
						<i class='bx bxs-lock-alt' ></i>
						<input type="password" placeholder="Enter Password" required>
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
				<p>Already have an account? <a href="#">Sign in</a></p>
			</div>
			
		</form>
	</div>
	</div>
</body>
</html>