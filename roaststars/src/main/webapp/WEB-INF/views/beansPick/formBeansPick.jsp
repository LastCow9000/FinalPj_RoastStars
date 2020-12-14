<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick</title>
<link rel="stylesheet" href="resources/css/home.css">
</head>

<body>
	<c:set var="pb" value="${lvo.pagingBean}" />
	<div class="container">
		<h2>Bean's Pick</h2>
		<br> <a href="${pageContext.request.contextPath}/register-form-beansPick.do">등록하기</a>
		<div class="row">
			<div id=beansPickLayout class="col-sm-12 row justify-content-center">
				<c:forEach items="${requestScope.list}" var="BeansPickVO">
					<div class="card col-sm-3 ">
						<img class="card-title" src="resources/upload/${BeansPickNo.beansPic}" alt="no image" width="500" height="300">
						<div class="card-body">
							<h4 class="card-title">${BeansPickVO.beansNo}</h4>
							<p class="card-text">${BeansPickVO.beansTitle}</p>
							<a href="${pageContext.request.contextPath}/detail-beansPick.do?no=${BeansPickVO.beansNo}" class="btn btn-info">See Pick</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>


