<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Main</title>
</head>
<body>
	<%-- Main Start --%>
	<div class="jumbotron text-center">
		<h2>언제까지 맨날 똑같은 커피만 마실래 ?!</h2>
		<h6>진짜 당신의 인생 카페를 찾아드립니다.</h6>
		<form class="form-inline">
			<div class="input-group">
				<input type="text" class="form-control" size="50"
					placeholder="지역을 입력해주세요" required>
				<div class="input-group-btn">
					<button type="button" class="btn btn-default">검색</button>
				</div>
			</div>
		</form>
	</div>
	<%-- Main End --%>
</body>
</html>