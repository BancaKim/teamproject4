<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="index2.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
</head>
<body>
<!--     <div class="main-container"> -->
        <nav>
            <img src="./image/logo.png" class="logo">
            <ul>
                <li><a href="main.lo">홈</a></li>
                <li><a href="BoardList.bo">게시판</a></li>
                <li><a href="setProduct.ba">장바구니</a></li> 
<%-- <% if (user_id !=null && user_id.equals("admin")){ %>  --%>
	<c:if test="${userId !=null && userId.equals('admin')}">
                <li><a href="MemberListAction.lo">운영자화면</a></li>  
	</c:if>
<%--             <% }  %>       --%>     
            </ul>
            
    <c:choose>
	    <c:when test="${userId != null}">
     	   <div>
           	<span>${userId}님 환영합니다!</span>
            <a href="MainLogout.lo" class="btn">로그아웃</a>                
           </div>
	    </c:when>
	    <c:otherwise>
	        <div>
           		 <a href="MainLoginForm.lo" class="btn">로그인</a>            
            </div>
	    </c:otherwise>
    </c:choose>        
<%--             <% if (user_id != null){ %> --%>

<%--             <% } else { %>

            <% } %> --%>
        </nav>
</body>
</html>