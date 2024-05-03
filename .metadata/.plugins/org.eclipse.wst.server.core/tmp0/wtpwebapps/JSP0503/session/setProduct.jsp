<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setProduct page</title>
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

body {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background-color : #008BC6;
}
.main-container {
	background-color: white;
	width: 700px;
	height: 500px;
	border-radius: 20px;
}
.fruits-container {

display: flex;
align-items: center;
justify-content: center;
}
.fruits {

width: 400px;
margin: 0 auto;
border : 1px solid black;
}
</style>
</head>
<body>
<div class="main-container">
	<h2 align="center">Choose items</h2>
	<hr>
	<div align="center">
	<%request.setCharacterEncoding("UTF-8");
	
		String username1 = request.getParameter("name");
		if(username1 != null) {
			session.setAttribute("username", username1);
		}
		
		HashMap<String, Integer> map = (HashMap<String, Integer>) session.getAttribute("itemMap");
			if (map==null){
				map = new HashMap<String, Integer>();
			}
			session.setAttribute("itemMap", map);
	%>
	<% if (username1==""){ %>
	<script>
		alert("아이디를 입력하고 로그인해주세요.");
		history.back();
	</script>
	<% }else if(session.getAttribute("username") == null){
		response.sendRedirect("login.jsp");
	}else{%>
	- Gamja Market shop - <br>

	<%= session.getAttribute("username")%>님의 로그인 페이지입니다. <br>
	구매를 원하는 품목을 선택해주세요.
	<%} %>
	</div>
	<div align="right">
		<form action="logOut.jsp">
			<input type="submit" value="로그아웃">
		</form>
	</div>
	<hr>
	<div class="fruits-container">
		<div class="fruits">
		<form name = "form1" method="post" action="add.jsp">
			<table>
				<tr>
					<td><input type="hidden" name="apple" value="사과">🍎사과</td>
					<td><button type="button" onclick="modifyQuantity('apple_num', -1)">-</button>
					<td><input type="number" name="apple_num" id="apple_num" value= <%= map.get("사과") %>></td>
					<td><button type="button" onclick="modifyQuantity('apple_num', 1)">+</button>
				</tr>
				<tr>
					<td><input type="hidden" name="peer" value="배">🍐배</td>
					<td><button type="button" onclick="modifyQuantity('peer_num', -1)">-</button>
					<td><input type="number" name="peer_num" id="peer_num" value= <%= map.get("배") %>></td>
					<td><button type="button" onclick="modifyQuantity('peer_num', 1)">+</button>
				</tr>
				<tr>
					<td><input type="hidden" name="mandarin" value="귤">🍊귤</td>
					<td><button type="button" onclick="modifyQuantity('mandarin_num', -1)">-</button>
					<td><input type="number" name="mandarin_num" id="mandarin_num" value=<%= map.get("귤") %>></td>
					<td><button type="button" onclick="modifyQuantity('mandarin_num', 1)">+</button>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type=submit align="center" value=담기></td>
				</tr>
			</table>
		</form>
		</div>
		</div>
		<script>
		function modifyQuantity(item, change) {
			var input = document.getElementById(item);
			var currentValue = parseInt(input.value);
			if (currentValue + change >= 0) {
				input.value = currentValue + change;
			}
		}
		</script>
		</div>
</body>
</html>