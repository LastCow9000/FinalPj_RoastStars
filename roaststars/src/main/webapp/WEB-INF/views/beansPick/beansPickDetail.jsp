<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick Detail Form</title>
</head>
<body>
	<div id=beansPickLayout class="container-fluid row justify-content-center">
		<c:forEach items="${requestScope.beansNo}" var="BeansPickNo">
			<div class="card col-sm-8 ">
				<%-- 추후에 src변경"${BeansPickVO.beansPic}" --%>
				<img class="card-img-top" src="resources/upload/cake.png" alt="Card image">
				<div class="card-body">
					<h4 class="card-title">${BeansPickNo.beansNo}</h4>
					<p class="card-text">${BeansPickNo.beansTitle}</p>
					<p class="card-text">${BeansPickNo.beansContent}</p>
					<p class="card-text">${BeansPickNo.beans_regdate}</p>
					<a href="${pageContext.request.contextPath}/beansPick-form.do">BeansPick으로</a> 
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>