<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <%
        String select = request.getParameter("pageChange");
        if (select == null) {
            select = "bestitem.jsp";
        }
    %>
<table border='1'>
<tr>
<td colspan="2"><%@ include file="top.jsp" %></td></tr>
<tr>
<td width="200px"><%@ include file="left.jsp" %></td>
<td width="1000px" height="100px">
<jsp:include page="<%= select %>" flush="false" />
</td>
</tr>
<tr>
<td colspan="2"><%@ include file="bottom.jsp" %></td>
</tr>
</table>
</body>
</html>