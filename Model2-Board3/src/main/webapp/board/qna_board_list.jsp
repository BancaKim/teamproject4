user<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
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
    <title>�������</title>
    <link rel="stylesheet" href="./board/boardlist.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</head>

<body>

  <div class="main-container">
        <nav>
            <img src="./image/logo.png" class="logo">
            <ul>
                <li><a href="main.lo">Ȩ</a></li>
                <li><a href="BoardList.bo">�Խ���</a></li>
                <li><a href="#">��ٱ���</a></li>                
            </ul>
            <% if (user_id != null){ %>
            <div>
                <span><%= user_id %>�� ȯ���մϴ�!</span>
                <a href="MainLogout.lo" class="btn">�α׾ƿ�</a>                
            </div>
            <% } else { %>
            <div>
            <a href="MainLoginForm.lo" class="btn">�α���</a>            
            </div>
            <% } %>
        </nav>
<!-- �Խ��� ����Ʈ -->
<div class="wrapper">
<div class="board-container">
	<table class="board-table">
		<tr align="center" valign="middle">
			<td colspan="4">MVC �Խ���</td>
			<td align=right>
				<font size=2>�� ���� : ${listcount }</font>
			</td>
		</tr>
		
		<tr>
			<td>
				<div>��ȣ</div>
			</td>
			<td>
				<div>����</div>
			</td>
			<td>
				<div>�ۼ���</div>
			</td>
			<td>
				<div>��¥</div>
			</td>
			<td>
				<div>��ȸ��</div>
			</td>
		</tr>
		
		<%
			for(int i=0;i<boardList.size();i++){
				BoardBean bl=(BoardBean)boardList.get(i);
		%>
		<tr>
			<td>
				<%=bl.getBOARD_NUM()%>
			</td>
			
			<td >
				<div>
				<%if(bl.getBOARD_RE_LEV()!=0){ %>
					<%for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ %>
					&nbsp;
					<%} %>
					��
				<%}else{ %>
					��
				<%} %>
				<a href="./BoardDetailAction.bo?num=<%=bl.getBOARD_NUM()%>">
					<%=bl.getBOARD_SUBJECT()%>
				</a>
				</div>
			</td>
			
			<td >
				<div><%=bl.getBOARD_NAME() %></div>
			</td>
			<td>
				<div><%=bl.getBOARD_DATE() %></div>
			</td>	
			<td>
				<div><%=bl.getBOARD_READCOUNT() %></div>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan=7 >
				<%if(nowpage<=1){ %>
				[����]&nbsp;
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=nowpage-1 %>">[����]</a>&nbsp;
				<%} %>
				
				<%for(int a=startpage;a<=endpage;a++){
					if(a==nowpage){%>
					[<%=a %>]
					<%}else{ %>
					<a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp;
					<%} %>
				<%} %>
				
				<%if(nowpage>=maxpage){ %>
				[����]
				<%}else{ %>
				<a href="./BoardList.bo?page=<%=nowpage+1 %>">[����]</a>
				<%} %>
			</td>
		</tr>
		<tr align="right">
			<td colspan="5">
		   		<a href="./BoardWrite.bo">[�۾���]</a>
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</body>
</html>