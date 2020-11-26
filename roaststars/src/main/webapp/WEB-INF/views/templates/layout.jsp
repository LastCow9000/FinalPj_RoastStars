<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<meta charset="UTF-8">
<!-- title이 null인 경우는 무시된다 -->
<title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>
<body>
	<div class="container">
		<%-- 상단 헤더 start --%>
		<div id="header"><tiles:insertAttribute name="header"/></div>
		<!-- 상단 헤더 end -->
		<hr>
			<div class="row content">
				<div id="main"><tiles:insertAttribute name="main"/></div>
			</div>
		<hr>
		<%-- 하단 풋터 start --%>
		<div id="footer"><tiles:insertAttribute name="footer"/></div>
		<%-- 하단 풋터 end --%>
	</div>
	<hr> <%--30번쨰줄부터 33번째줄까지 나중에 지우기 --%>
	<div class="Test icon"> 
		<i class="fas fa-thumbs-up fa-5x"></i>
	</div>
</body>
</html>