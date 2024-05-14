<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% String user_id = (String)session.getAttribute("userId");
	HashMap<String, Integer> map = (HashMap<String, Integer>) session.getAttribute("itemMap");
	if (map==null){
		map = new HashMap<String, Integer>();
	}
	session.setAttribute("itemMap", map);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./basket/confirmItem.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</head>
<body>
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
	<div class="board-container">
	   <div class="title">💲계산하기💱</div>
			<div class="subtitle"><%= user_id %>님😊의 장바구니</div>
				<table>
				<tr>				
					<td>🍎사과</td>
					<td><%= map.get("사과") %></td></tr>
				<tr>				
					<td>🍐배</td>
					<td><%= map.get("배") %></td></tr>
				<tr>				
					<td>🍊귤</td>
					<td><%= map.get("귤") %></td></tr>
				</table>
			<div>
			<a href="setProduct.ba"><button type="button" class="text-white bg-gradient-to-br from-pink-500 to-orange-400 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-pink-200 dark:focus:ring-pink-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">주문 페이지로</button></a>
			<a href="goPayAction.ba"><button type="button" class="text-white bg-gradient-to-br from-green-400 to-blue-600 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-green-200 dark:focus:ring-green-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">계산하러 가기</button></a>		
			</div>
			</div>
	</div>
    
</body>
</html>