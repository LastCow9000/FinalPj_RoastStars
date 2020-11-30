<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %> 
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Header</title>
</head>
<%-- Header Start --%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="home.do">Roast Stars</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Beans Pick</a></li>
			<li><a href="#">관심목록</a></li>
		</ul>
		
		<%--로그인 X 사용자 (인증X) --%>
		<sec:authorize access="!isAuthenticated()">
		<ul class="nav navbar-nav navbar-right">
			<li><a href="register-form.do">
				<span class="glyphicon glyphicon-user"></span>
               회원가입</a>
            </li>
			
			<li>
				<a href="login-form.do">
				<span class="glyphicon glyphicon-log-in"></span>
					로그인
				</a>
			</li>
		</ul>
		</sec:authorize>
		
		<%-- 로그인 O 사용자 (인증O) --%>
		<sec:authorize access="isAuthenticated()">
			<li>
			<a href="#" id="logoutAction">로그아웃</a>
			<form id="logoutForm"
				action="${pageContext.request.contextPath}/logout.do" method="post"
				style="display: none">
				<sec:csrfInput />
			</form>
			</li>
		</sec:authorize>
	</div>
</nav>
<%-- Hearder End --%>