<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <header>
        <h2 class="logo">Logo</h2>
        <nav class="navigation">
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Services</a>
            <a href="#">Contact</a>
            <button class="btnLogin-popup">Login</button>

        </nav>
    </header>

    <div class="wrapper">
        <span class="icon-close"><span class="material-symbols-outlined">
            close
        </span></span>
        <div class="form-box login">
            <h2>Login</h2>
            <form action="#">
                <div class="input-box">
                    <span class="icon"><span class="material-symbols-outlined">
                        mail
                    </span></span>
                    <input type="email" required>
                    <label>Email</label>
                </div>
                <div class="input-box">
                    <span class="icon"><span class="material-symbols-outlined">
                        lock
                    </span></span>
                    <input type="Password" required>
                    <label>Password</label>
                </div>
                <div class="remember-forgot">
                    <label><input type="checkbox">Remember me</label>
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit" class="btn">Login</button>
                <div class="login-register">
                    <p>Don't have an account?<a href="#" class="register-link">Register</a></p>
                </div>
            </form>
        </div>

<div class="form-box register">
    <h2>Registration</h2>
    <form action="#">
        <div class="input-box">
            <span class="icon"><span class="material-symbols-outlined">
                person
            </span></span>
            <input type="text" required>
            <label>Username</label>
        </div>
        <div class="input-box">
            <span class="icon"><span class="material-symbols-outlined">
                    mail
                </span></span>
            <input type="email" required>
            <label>Email</label>
        </div>
        <div class="input-box">
            <span class="icon"><span class="material-symbols-outlined">
                    lock
                </span></span>
            <input type="Password" required>
            <label>Password</label>
        </div>
        <div class="remember-forgot">
            <label><input type="checkbox">agree to the terms & conditions </label>
        </div>
        <button type="submit" class="btn">Register</button>
        <div class="login-register">
            <p>Already have an account?<a href="#" class="login-link">Login</a></p>
        </div>
    </form>
</div>


    </div>
    <script src="script.js"></script>
</body>
</html>