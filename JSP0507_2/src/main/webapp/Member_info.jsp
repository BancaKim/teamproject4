<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Banca@Dev</title>
<style>
@font-face{
font-family:'DNFBitBitv2';
font-style:normal;font-weight:400;src:url('//cdn.df.nexon.com/img/common/font/DNFBitBitv2.otf')format('opentype')}

*{
font-family: 'DNFBitBitv2'}

</style>
<link href="https://unpkg.com/nes.css@latest/css/nes.min.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<%
if(session.getAttribute("userID") == null || !session.getAttribute("userID").equals("admin")){
	response.sendRedirect("loginForm2.jsp");
}else{ 

String id = (String)request.getParameter("id");
System.out.println(id);
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT * FROM USER WHERE id=?";

try {
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	conn = ds.getConnection(); 
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	%>
	<h1 align="center">회원 목록 조회</h1>
	<div class= "nes-container with-title is-centered">
	<p class="title" style="font-weight:900; font-size:x-large;">회원 명단</p>
	<div class="nes-table-responsive" style="display:flex; justify-content:center; align-items:center;">
		
	<% while (rs.next()) { %>
		<table class="nes-table is-bordered is-centered">
		<thread>
		<tr>
		<th bgcolor="#5CE75C">구분</td>
		<th bgcolor="#5CE75C">내용</td>
		</tr>
		</thread>
		<tr>
			<td>ID</td>
			<td><%=rs.getString(1)%></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><%=rs.getString(2)%></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><%=rs.getString(3)%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=rs.getString(4)%></td>
		</tr>
		<tr>
			<td>주민번호</td>
			<td><%=rs.getString(5)%></td>
		</tr>
				<tr>
			<td>자기소개</td>
			<td><%=rs.getString(6)%></td>
		</tr>
		</table>
			</div>
			<button type="button" class="nes-btn is-error" style="margin-top:10px;" onclick="location.href='Member_delete.jsp?id=<%=id %>'">회원삭제</button>
	</div>
	<%} 
	rs.close();
	}catch(Exception e){
	e.printStackTrace();
	}
}%>

</body>
</html>