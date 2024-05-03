<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add page</title>
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String choosen = request.getParameter("items");
	
	HashMap<String, Integer> finalMap = (HashMap<String, Integer>) session.getAttribute("itemMap");
	
	if(finalMap==null){
		finalMap= new HashMap<String, Integer>();
	}
	
	if(!request.getParameter("apple_num").equals("")) {
		finalMap.put(request.getParameter("apple"), Integer.parseInt(request.getParameter("apple_num")));
	}
	
	if(!request.getParameter("peer_num").equals("")) {
		finalMap.put(request.getParameter("peer"), Integer.parseInt(request.getParameter("peer_num")));
	}
	
	if(!request.getParameter("mandarin_num").equals("")) {
		finalMap.put(request.getParameter("mandarin"), Integer.parseInt(request.getParameter("mandarin_num")));
		
	}
	
	
	session.setAttribute("itemMap",finalMap);

	
	
	if (session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
	%>
	
	<h2>계산</h2>
		<div align="right">
			<form action="logOut.jsp">
				<input type="submit" value="로그아웃">
			</form>
		</div>
		<hr/>
			<%= session.getAttribute("username")%>님의 장바구니<br>
			<form action="" method="post">
				<table>
				<% for (Map.Entry<String,Integer> entry: finalMap.entrySet()){  %>
				<tr>
				<td><input type="radio" name="fruitbucket"></td>
				<td><%=entry.getKey()%></td>
				<td><%=entry.getValue()%></td>
				</tr>
				<%} %>
				</table>
			</form>
			<div>
			<a href="setProduct.jsp">주문 페이지로</a>
			<a href="setProduct.jsp">계산하러 가기</a>		
			</div>
</body>
</html>