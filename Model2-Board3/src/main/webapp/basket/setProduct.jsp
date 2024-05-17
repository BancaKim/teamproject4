<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% String user_id = (String)session.getAttribute("userId");
	HashMap<String, Integer> map = (HashMap<String, Integer>) session.getAttribute("itemMap");
	if (map==null){
		map = new HashMap<String, Integer>();
	}

	System.out.println(session.getAttribute("itemMap"));	
	System.out.println(map);	
	System.out.println(map.get("사과"));
	System.out.println(map.get("배"));
	System.out.println(map.get("귤"));
	session.setAttribute("itemMap", map);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./basket/setProduct.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
		<script>
		function modifyQuantity(item, change) {
			var input = document.getElementById(item);
			if (input.value==''){
				input.value=0;
			}
			var currentValue = parseInt(input.value);
			if (currentValue + change >= 0) {
				input.value = currentValue + change;
			}
		}
		</script>
</head>
<body>
	<% if (user_id == null || user_id ==""){ %>
	
	<script>
		alert("아이디를 입력하고 로그인해주세요.");
		location.href="./main.lo";
	</script>
	<%	
	/* response.sendRedirect("./main.lo"); */
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
        
<div class="board-container">
	<div class="title">Choose items</div>
	<div class="subtitle">
	구매를 원하는 품목을 선택해주세요.
	</div>
<!-- 
	<div class="fruits-container"> -->
		<form class="fruits-container" name = "form1" method="post" action="itemAddAction.ba">
			<table>
				<tr>
					<td><input type="hidden" name="apple" value="사과">🍎사과</td>
					<td><button type="button" onclick="modifyQuantity('apple_num', -1)" class="text-gray-900 bg-gradient-to-r from-teal-200 to-lime-200 hover:bg-gradient-to-l hover:from-teal-200 hover:to-lime-200 focus:ring-4 focus:outline-none focus:ring-lime-200 dark:focus:ring-teal-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">-</button></td>
					<td><input type="number" name="apple_num" id="apple_num" value=<%= map.get("사과") %>></td>
					<td><button type="button" onclick="modifyQuantity('apple_num', 1)" class="text-gray-900 bg-gradient-to-r from-red-200 via-red-300 to-yellow-200 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">+</button></td>
				</tr>
				<tr>
					<td><input type="hidden" name="peer" value="배">🍐배</td>
					<td><button type="button" onclick="modifyQuantity('peer_num', -1)" class="text-gray-900 bg-gradient-to-r from-teal-200 to-lime-200 hover:bg-gradient-to-l hover:from-teal-200 hover:to-lime-200 focus:ring-4 focus:outline-none focus:ring-lime-200 dark:focus:ring-teal-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">-</button></td>
					<td><input type="number" name="peer_num" id="peer_num" value=<%= map.get("배") %>></td>
				<td><button type="button" onclick="modifyQuantity('peer_num', 1)" class="text-gray-900 bg-gradient-to-r from-red-200 via-red-300 to-yellow-200 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">+</button></td>
			</tr>
				<tr>
					<td><input type="hidden" name="mandarin" value="귤">🍊귤</td>
					<td><button type="button" onclick="modifyQuantity('mandarin_num', -1)" class="text-gray-900 bg-gradient-to-r from-teal-200 to-lime-200 hover:bg-gradient-to-l hover:from-teal-200 hover:to-lime-200 focus:ring-4 focus:outline-none focus:ring-lime-200 dark:focus:ring-teal-700 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">-</button></td>
					<td><input type="number" name="mandarin_num" id="mandarin_num" value=<%= map.get("귤") %>></td>
					<td><button type="button" onclick="modifyQuantity('mandarin_num', 1)" class="text-gray-900 bg-gradient-to-r from-red-200 via-red-300 to-yellow-200 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-red-100 dark:focus:ring-red-400 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">+</button></td>
			</tr>
				<tr>
					<td colspan="4" align="center">
					<input type=submit class="text-white bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-large rounded-lg text-lg px-5 py-2.5 text-center me-2 mb-2 mt-10" value="담기"/>
					</td>
				</tr>
			</table>
			
		</form>
		</div>
		</div>
		<!-- </div> -->
            <% } %>
</body>
</html>