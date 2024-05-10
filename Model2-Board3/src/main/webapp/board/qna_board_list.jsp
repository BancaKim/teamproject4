<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>

<%
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%>

<html>
<head>
	<title>MVC �Խ���</title>
    <link rel="stylesheet" href="./board/list.css">
    <link rel="stylesheet"
    	  href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>

<body>
    <header>
        <a href="/"><h2 class="logo">Banca@Dev</h2></a>
        <nav class="navigation">
            <a href="/">Home</a>
            <a href="#">About</a>
            <a href="./BoardList.bo">Board</a>
            <a href="#">Contact</a>
            <button class="btnLogin-popup">Login</button>

        </nav>
    </header>
<!-- �Խ��� ����Ʈ -->

<div class="board-container">
	<table class="board-table" width=50% border="0" cellpadding="0" cellspacing="0">
		<tr align="center" valign="middle">
			<td colspan="4">MVC �Խ���</td>
			<td align=right>
				<font size=2>�� ���� : ${listcount }</font>
			</td>
		</tr>
		
		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
				<div align="center">��ȣ</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="50%">
				<div align="center">����</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="14%">
				<div align="center">�ۼ���</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="17%">
				<div align="center">��¥</div>
			</td>
			<td style="font-family:Tahoma;font-size:8pt;" width="11%">
				<div align="center">��ȸ��</div>
			</td>
		</tr>
		
		<%
			for(int i=0;i<boardList.size();i++){
				BoardBean bl=(BoardBean)boardList.get(i);
		%>
		<tr align="center" valign="middle" bordercolor="#333333"
			onmouseover="this.style.backgroundColor='F8F8F8'"
			onmouseout="this.style.backgroundColor=''">
			<td height="23" style="font-family:Tahoma;font-size:10pt;">
				<%=bl.getBOARD_NUM()%>
			</td>
			
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="left">
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
			
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=bl.getBOARD_NAME() %></div>
			</td>
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=bl.getBOARD_DATE() %></div>
			</td>	
			<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%=bl.getBOARD_READCOUNT() %></div>
			</td>
		</tr>
		<%} %>
		<tr align=center height=20>
			<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
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
</body>
</html>