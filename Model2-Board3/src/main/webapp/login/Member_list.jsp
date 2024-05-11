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
<div class="board-container">
	<table class="board-table">
		<tr align="center" valign="middle">
			<td colspan="5">회원관리 게시판</td>
			<td align=right>
				<font size=2>회원 수 : ${listcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>ID</div>
			</td>
			<td>
				<di>비밀번호</div>
			</td>
			<td>
				<div>이메일</div>
			</td>
			<td>
				<div>유저이름</div>
			</td>
			<td>
				<div>주민등록번호</div>
			</td>
			<td>
				<div>자기소개</div>
			</td>
		</tr>
		
		<%
			for(int i=0;i<userList.size();i++){
				UserBean ul=(UserBean)userList.get(i);
		%>
		<tr>
			<td>
			<a href="./MemberViewAction.bo?user_id=<%=ul.getUser_id()%>">
				<%= ul.getUser_id() %>
			</td>
			
			<td >
				<div>
					<%=ul.getUser_pw()%>
				</a>
				</div>
			</td>
			
			<td >
				<div><%=ul.getEmail() %></div>
			</td>
			<td>
				<div><%=ul.getUser_name() %></div>
			</td>	
			<td>
				<div><%=ul.getSsn() %></div>
			</td>
			<td>
				<div><%=ul.getIntroduction() %></div>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan=7 >
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
	</table>
</div>
</div>
</div>
</body>
</html>