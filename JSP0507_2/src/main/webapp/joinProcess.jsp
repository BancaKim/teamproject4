<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<jsp:useBean id="signupbean" class="User.User" scope="page"/>
<jsp:setProperty property="*" name="signupbean"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 완료</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO USER (id, password, email, userName, ssn, introduction) VALUES (?, ?, ?, ?, ?, ?)";

    try {
        Context init = new InitialContext();
        DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
        conn = ds.getConnection();
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, signupbean.getId());
        pstmt.setString(2, signupbean.getPassword());
        pstmt.setString(3, signupbean.getEmail());
        pstmt.setString(4, signupbean.getUserName());
        pstmt.setString(5, signupbean.getSsn());
        pstmt.setString(6, signupbean.getIntroduction());

        if (pstmt.executeUpdate() > 0) {
            session.setAttribute("userID", signupbean.getId());
            %>
            <script>
                Swal.fire({
                    title: 'Success!',
                    text: '회원가입이 완료되었습니다.',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = "Main2.jsp";
                    }
                });
            </script>
            <%
        }
    } catch (Exception e) {
        e.printStackTrace();
        %>
        <script>
            Swal.fire({
                title: 'Error!',
                text: '회원가입이 실패하였습니다.',
                icon: 'error',
                confirmButtonText: 'OK'
            }).then((result) => {
                if (result.isConfirmed) {
                    history.back();
                }
            });
        </script>
        <%
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
        if (conn != null) try { conn.close(); } catch (SQLException ex) {}
    }
    %>
</body>
</html>