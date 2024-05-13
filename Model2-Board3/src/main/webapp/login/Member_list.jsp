<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.login.db.*" %>

<%
	String user_id = (String)session.getAttribute("userId");
	List userList=(List)request.getAttribute("userlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매일통닭</title>
    <link rel="stylesheet" href="./login/memberlist.css">
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
<!-- 게시판 리스트 -->
<div class="wrapper">
<div class="title" align="center">👨회원관리 게시판👩</div>
<p align="right">회원 수 : ${listcount}</p>
<div class="board-container">
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                    ID
                </th>
                <th scope="col" class="px-6 py-3">
                    비밀번호
                </th>
                <th scope="col" class="px-6 py-3">
                    이메일
                </th>
                <th scope="col" class="px-6 py-3">
                    유저이름
                </th>
                <th scope="col" class="px-6 py-3">
                    주민등록번호
                </th>
               	<th scope="col" class="px-6 py-3">
                    자기소개
                </th>
            </tr>
        </thead>
        <tbody>
        
        
        
     		<%
			for(int i=0;i<userList.size();i++){
				UserBean ul=(UserBean)userList.get(i);
		%>
		
       <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
          <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
			<a href="./MemberViewAction.lo?user_id=<%=ul.getUser_id()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
				<%= ul.getUser_id() %>
			</a>
          </th>
     
		  <td class="px-6 py-4">
					<%=ul.getUser_pw()%>
			</td>
		  <td class="px-6 py-4">
				<%=ul.getEmail() %>
			</td>
		  <td class="px-6 py-4">
				<%=ul.getUser_name() %>
			</td>	
		  <td class="px-6 py-4">
				<%=ul.getSsn() %>
			</td>
		  <td class="px-6 py-4">
				<%=ul.getIntroduction() %>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan=6 align="center">
				<%if(nowpage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="./MemberListAction.lo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int a=startpage;a<=endpage;a++){
					if(a==nowpage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="./MemberListAction.lo?page=<%=a %>">[<%=a %>]</a>&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage>=maxpage){ %>
				[다음]
				<%}else{ %>
				<a href="./MemberListAction.lo?page=<%=nowpage+1 %>">[다음]</a>
				<%} %>
			</td>
		</tr>
		</tbody>
	</table>
</div>
</div>
</div>
</div>
</body>
</html>