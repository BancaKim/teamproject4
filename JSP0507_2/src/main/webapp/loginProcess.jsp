<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>
<body>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "SELECT password FROM USER where id=?";

try {
    Context init = new InitialContext();
    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
    conn = ds.getConnection(); 
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        if(!password.equals(rs.getString(1))){
%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
Swal.fire({
    title: 'Error!',
    text: '비밀번호가 일치하지 않습니다!',
    icon: 'error',
    confirmButtonText: '다시 시도'
}).then((result) => {
    if (result.isConfirmed) {
        history.back();
    }
});
</script>
<%
        } else {
            session.setAttribute("userID", id);
%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
Swal.fire({
    title: 'Success!',
    text: '로그인되었습니다!',
    icon: 'success',
    confirmButtonText: '계속'
}).then((result) => {
    if (result.isConfirmed) {
        window.location.href = "Main2.jsp";
    }
});
</script>
<%
        }
    } else {
%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
Swal.fire({
    title: 'Error!',
    text: '존재하지 않는 사용자 ID입니다.',
    icon: 'error',
    confirmButtonText: '다시 시도'
}).then((result) => {
    if (result.isConfirmed) {
        history.back();
    }
});
</script>
<%
    }
} catch(Exception e){
%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
Swal.fire({
    title: 'Database Error',
    text: '데이터베이스 오류가 발생했습니다.',
    icon: 'error',
    confirmButtonText: '다시 시도'
}).then((result) => {
    if (result.isConfirmed) {
        history.back();
    }
});
</script>
<%
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace(); }
    if (pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace(); }
}
%>
</body>
</html>
