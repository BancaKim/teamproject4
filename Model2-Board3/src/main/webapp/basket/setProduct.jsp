<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% String user_id = (String)session.getAttribute("userId");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index2.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</head>
<body>
	<% if (user_id == null || user_id ==""){ %>
	
	<script>
		alert("아이디를 입력하고 로그인해주세요.");
		history.back();
	</script>
	
	<% }else if(user_id == null){
		response.sendRedirect("index.jsp");
	}else{%>

<div class="main-container">
        <nav>
            <img src="./image/logo.png" class="logo">
            <ul>
                <li><a href="main.lo">홈</a></li>
                <li><a href="BoardList.bo">게시판</a></li>
                <li><a href="setProduct.ba">장바구니</a></li> 
            <% if (user_id !=null && user_id.equals("admin")){ %>
                <li><a href="MemberListAction.lo">운영자화면</a></li>  
            <% }  %>           
            </ul>
            <% if (user_id != null){ %>
            <div>
                <span><%= user_id %>님 환영합니다!</span>
                <a href="MainLogout.lo" class="btn">로그아웃</a>                
            </div>
            <% } else { %>
            <div>
            <a href="MainLoginForm.lo" class="btn">로그인</a>            
            </div>
            <% } %>
        </nav>
        
<div class="content">
	<h2 align="center">Choose items</h2>

	<div align="center">
	구매를 원하는 품목을 선택해주세요.
	</div>

	<div class="fruits-container">
		<div class="fruits">
		<form name = "form1" method="post" action="itemAddAction.ba">
			<table>
				<tr>
					<td><input type="hidden" name="apple" value="사과">🍎사과</td>
					<td><button type="button" onclick="modifyQuantity('apple_num', -1)">-</button>
					<td><input type="number" name="apple_num" id="apple_num" placeholder=0></td>
					<td><button type="button" onclick="modifyQuantity('apple_num', 1)">+</button>
				</tr>
				<tr>
					<td><input type="hidden" name="peer" value="배">🍐배</td>
					<td><button type="button" onclick="modifyQuantity('peer_num', -1)">-</button>
					<td><input type="number" name="peer_num" id="peer_num" placeholder=0></td>
					<td><button type="button" onclick="modifyQuantity('peer_num', 1)">+</button>
				</tr>
				<tr>
					<td><input type="hidden" name="mandarin" value="귤">🍊귤</td>
					<td><button type="button" onclick="modifyQuantity('mandarin_num', -1)">-</button>
					<td><input type="number" name="mandarin_num" id="mandarin_num" placeholder=0></td>
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
</div>
            <% } %>
</body>
</html>