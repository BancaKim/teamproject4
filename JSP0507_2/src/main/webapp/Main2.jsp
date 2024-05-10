<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banca@Dev</title>
<link rel="icon" href="images/favicon.ico">
<link rel="stylesheet" href="mainStyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
function member_list(){
	location.href="Member_list.jsp"
}
function member_info(){
	location.href="Member_info.jsp"
}
function member_delete(){
	location.href="Member_delete.jsp"
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<%
String userID = (String)session.getAttribute("userID");


if(session.getAttribute("userID") == null){
	response.sendRedirect("loginForm2.jsp");
}else if (userID != null && userID.equals("admin")){ %>
	<div class="container">
		<nav>
			<h2>Banca@Dev</h2>
			
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Explore</a></li>
				<li><a href="#">Review</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="#">Content</a></li>
				<li><a href="logoutAction.jsp">Logout</a></li>
			</ul>
		</nav>

		<div class= "nes-container with-title is-centered">
		<div class="nes-container with-title" style="display:flex; flex-direction:column; justify-content:center; align-items:center; z-index:3; background-color:white;">
			<p class="title" style="font-weight:900; font-size:x-large;">관리자 화면</p>
			<button type="button" class="nes-btn is-primary" style="margin-top:10px;" onclick="member_list()">회원목록</button>
			<button type="button" class="nes-btn is-success" style="margin-top:10px;" onclick="member_info()">회원정보</button>
			<button type="button" class="nes-btn is-error" style="margin-top:10px;" onclick="member_delete()">회원삭제</button>
		</div>
	</div>
</div>
<%}else { %>
	<div class="container">
		<nav>
			<h2>Banca@Dev</h2>
			
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Explore</a></li>
				<li><a href="#">Review</a></li>
				<li><a href="#">Blog</a></li>
				<li><a href="#">Content</a></li>
				
		<%
		if(userID == null){
		%>	
					<li><a href="login.jsp">Login</a></li>
		<% 	} else {
		%>
				<li><a href="logoutAction.jsp">Logout</a></li>
			<%
			} 
			%>
			</ul>
		</nav>
		
		<div class="text_area">
			<div class="title">
				<h1>메인화면입니다</h1>
				<p>기능은 추가될 예정입니다</p>
			</div>
			<div class="buttons">
				<button>Explore More</button>
				<button><i class="fa-solid fa-magnifying-glass"></i>Search</button>
			</div>
			
		</div>
	</div>
	<%} %>
	
</body>
</html>