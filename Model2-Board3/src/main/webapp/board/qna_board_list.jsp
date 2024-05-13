<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>

<%
	String user_id = (String)session.getAttribute("userId");
	List boardList=(List)request.getAttribute("boardlist");
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
    <title>Banca@Dev</title>
    <link rel="stylesheet" href="./board/boardlist.css">
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
                <li><a href="#">장바구니</a></li>    
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
<div class="title" align="center">🏬MVC 게시판🚀</div>
<p align="right">글 개수 : ${listcount}</p>
<div class="board-container">
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                    번호
                </th>
                <th scope="col" class="px-6 py-3">
                    제목
                </th>
                <th scope="col" class="px-6 py-3">
                    작성자
                </th>
                <th scope="col" class="px-6 py-3">
                    날짜
                </th>
                <th scope="col" class="px-6 py-3">
                    조회수
                </th>
            </tr>
        </thead>
        <tbody>
		
		<%
			for(int i=0;i<boardList.size();i++){
				BoardBean bl=(BoardBean)boardList.get(i);
		%>
		<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">

			<td><%=bl.getBOARD_NUM()%></td>
			<td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
				<%if(bl.getBOARD_RE_LEV()!=0){ %>
					<%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %>
					&nbsp;
					<%} %>
					▶
				<%}else{ %>
					▶
				<%} %>
			<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
					<%=bl.getBOARD_SUBJECT()%>
				</a>
			</td>
			<td >
				<%=bl.getBOARD_NAME() %>
			</td>
			<td>
				<%=bl.getBOARD_DATE() %>
			</td>	
			<td>
				<%=bl.getBOARD_READCOUNT()%>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan=5 align="center">
				<%if(nowpage<=1){ %>
				[이전]&nbsp;
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
				<%} %>
				
				<%for(int a=startpage;a<=endpage;a++){
					if(a==nowpage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage>=maxpage){ %>
				[다음]
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=nowpage+1 %>">[다음]</a>
				<%} %>
			</td>
		</tr>
	</table>
	<div class="write_btn">
		<a class="linkbutton" href="./BoardWrite.bo">
	<button type="button" class="text-white bg-gradient-to-r from-cyan-500 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-cyan-300 dark:focus:ring-cyan-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2 mt-5">글쓰기</button>
		</a>
	</div>
</div>
</div>
</div>
</div>

</body>
</html>