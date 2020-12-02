<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<meta charset="UTF-8">
<!-- title이 null인 경우는 무시된다 -->
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>
	<div class="container">
		<%-- 상단 헤더 start --%>
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<!-- 상단 헤더 end -->
		<hr>

		<div id="main">
			<tiles:insertAttribute name="main" />
		</div>

		<hr>
		<%-- 하단 풋터 start --%>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
		<%-- 하단 풋터 end --%>
	</div>
</body>
</html>