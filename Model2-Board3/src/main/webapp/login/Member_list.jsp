<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디지캠</title>
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
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT * FROM USER";

try {
	Context init = new InitialContext();
	DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
	conn = ds.getConnection(); 
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>
	<h1 align="center">회원 목록 조회</h1>
	<div class= "nes-container with-title is-centered">
	<p class="title" style="font-weight:900; font-size:x-large;">회원 명단</p>
	<div class="nes-table-responsive" style="display:flex; justify-content:center; align-items:center;">
		<table class="nes-table is-bordered is-centered">
		<thead>
		<tr>
		<th>ID</th>
		<th>Password</th>
		<th>E-mail</th>
		<th>이름</th>
		<th>주민번호</th>
		<th>자기소개</th>
		</tr>
		</thead>
		<tbody>

		<% while (rs.next()) { %>
			<tr>
			<td>
			<a href="Member_info.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
			</td>
			<%
			for(int i=2;i<7;i++){ %>
				<td><%= rs.getString(i) %></td>
			<% } %>

			</tr>
	
		<%}%>
		</tbody>
	</table>
	</div>
	</div>

	<% rs.close();
	}catch(Exception e){
	e.printStackTrace();
	}%>
</body>
</html>