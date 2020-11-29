<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sec:authorize access="!hasRole('ROLE_MEMBER')">
	<br>
	<h3>로그인</h3>
	<form action="${pageContext.request.contextPath}/login.do" 
		  method="POST" id="loginForm">
		<sec:csrfInput/><%-- csrf 토큰 --%>
		<input type="text" name="id" placeholder="ID" required="required"><br>
		<input type="password" name="password" placeholder="PASSWORD" required="required"><br>
		<input type="submit" value="로그인">
	</form>
</sec:authorize>
</body>
</html>