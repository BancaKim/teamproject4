<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
	<body>
		<center>
			<h1>������</h1>
				<table border="1" style="background-color:#C4FCEF">
					  <tr>
    					<th style="background-color:#00C9A7"></th>
    					<% for(int k=2;k<10;k++){ %>
    						<th scope="col" style="background-color:#00C9A7"> <%=k %>�� </th>
    						<% } %>
  						</tr>
					<%for(int i=1;i<10;i++){%> 
					<tr>
					<th scope="row" style="background-color:#4D8076">  <%=i %> </th>
					<% for(int j=2;j<10;j++){%>
						<td>
						<%=j %> x <%=i %> = <%=i*j %>
					<% }%>
						</td>
					<%}%>
					</tr>
				</table>
		</center>
	</body>
</html>
