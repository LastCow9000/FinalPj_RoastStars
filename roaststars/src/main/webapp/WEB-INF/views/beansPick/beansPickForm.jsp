<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick</title>
</head>
<body>
	<div class="container">
		<h2>Bean's Pick</h2>
		<p>관리자의 Pick!! 많은 혜택을 누려보세요</p>
		<c:forEach var="bpl" items="${list}">
		<div class="card" style="width: 400px">
			<img class="card-img-top" src="resources/upload/cake.png" alt="Card image" style="width: 100%">
			<div class="card-body">
				<h4 class="card-title">${bpl.beansNO}</h4>
				<p class="card-text">${bpl.beansContent}</p>
				<a href="#" class="btn btn-primary">See Pick</a>
			</div>
		</div></c:forEach>
	</div>
</body>
</html>