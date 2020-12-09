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
	<div class="container">
		<h2>Bean's Pick</h2>
		<div class="row">
			<div id=beansPickLayout class="col-sm-12 row justify-content-center">
				<c:forEach items="${requestScope.list}" var="BeansPickVO">
					<div class="card col-sm-3 ">
						<%-- 추후에 src변경"${BeansPickVO.beansPic}" --%>
						<img class="card-img-top" src="resources/upload/cake.png" alt="Card image">
						<div class="card-body">
							<h4 class="card-title">${BeansPickVO.beansNo}</h4>
							<p class="card-text">${BeansPickVO.beansTitle}</p>
							<a href="${pageContext.request.contextPath}/beansPick-detail.do?no=${BeansPickVO.beansNo}" class="btn btn-info">See Pick</a>				
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>


