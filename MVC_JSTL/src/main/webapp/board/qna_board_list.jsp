<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="net.board.db.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	String user_id = (String)session.getAttribute("userId");
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=((Integer)request.getAttribute("listcount")).intValue();
	int nowpage=((Integer)request.getAttribute("page")).intValue();
	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
	int startpage=((Integer)request.getAttribute("startpage")).intValue();
	int endpage=((Integer)request.getAttribute("endpage")).intValue();
%> --%>

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
	<c:import url="../nav.jsp"></c:import>

<div class="wrapper">
<div class="title" align="center">🏬MVC 게시판🚀</div>
<p align="right">글 개수 : ${requestScope.listcount}</p>
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
        <c:forEach items="${requestScope.boardlist}" var="bl">
 			<tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">   
 			<%-- <td><%=bl.getBOARD_NUM()%></td>   --%>  
     		<td>${bl.BOARD_NUM}</td>       
    		<td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
     		<c:choose>
	     		<c:when test="${bl.BOARD_RE_LEV!=0}">
	     			<c:forEach var="a" begin="0" end="${bl.BOARD_RE_LEV*2}" step="1">
	     				&nbsp;
	     			</c:forEach>
	     			▶
	     		</c:when>
	     		<c:otherwise>
	     			▶
	     		</c:otherwise>
        	</c:choose>
        		<a href="./BoardDetailAction.bo?num=${bl.BOARD_NUM}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
<%-- 					<%=bl.getBOARD_SUBJECT()%> --%>
					${bl.BOARD_SUBJECT}
				</a>
				</td>
				<td>
<%-- 					<%=bl.getBOARD_NAME() %> --%>
					${bl.BOARD_NAME}
				</td>
				<td>
<%-- 					<%=bl.getBOARD_DATE() %> --%>
					${bl.BOARD_DATE}
				</td>
				<td>
<%-- 					<%=bl.getBOARD_READCOUNT()%> --%>
					${bl.BOARD_READCOUNT}
				</td>
				</tr>
        </c:forEach>                    
		<tr>
			<td colspan=5 align="center">
				<c:choose>
					<c:when test="${requestScope.page<=1}">
						[이전]&nbsp;
					</c:when>
					<c:otherwise>
						<a href="./BoardList.bo?page=${requestScope.page-1}">[이전]</a>&nbsp;
					</c:otherwise>
				</c:choose>

				<c:forEach var="a" begin="${requestScope.startpage}" end="${requestScope.endpage}" step="1">
					<c:choose>
						<c:when test="${a==requestScope.page}">
<%-- 						[<%=a %>] --%>
						[${a}]
						</c:when>
						<c:otherwise>
							<a href="./BoardList.bo?page=${a}">[${a}]</a>&nbsp;
						</c:otherwise>
						</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${requestScope.page>=requestScope.maxpage}">
						[다음]
					</c:when>
					<c:otherwise>
						<a href="./BoardList.bo?page=${requestScope.page+1}">[다음]</a>
					</c:otherwise>
				</c:choose>
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