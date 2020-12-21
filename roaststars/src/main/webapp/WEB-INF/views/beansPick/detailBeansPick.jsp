<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick Detail Form</title>
<style type="text/css">
.card { 
	max-height: 100%;
	font-size: 30px;
	padding: 10px;
	margin: 5px;
	justify-content: center;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Bean's Pick Detail</h2>
		<div style="text-align: right">
			<a href="${pageContext.request.contextPath}/main-beansPick.do" class="btn btn-info">BeansPick으로</a>
		</div>
		<div class="row">
			<div class="card h-100 col-sm-8" style="margin: auto; height: auto;">
				<div class="card-hearder" style="font-weight: bold; text-align: center; font-size: 30px;">
					<p>NO.${BeansPickNo.beansNo}</p>
				</div>
				<div class="card-body">
					<img class="card-img-top beansPickimg" src="resources/upload/${BeansPickNo.beansPic}" alt="no image">
					<p class="card-title">${BeansPickNo.beansTitle}</p>
					<p class="card-text">${BeansPickNo.beansContent}</p>
					<p class="card-text">${BeansPickNo.beansRegdate}</p>
				</div>
			</div>
		</div>
	</div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div style="text-align: right">
			<%-- 수정 / 삭제 --%>
			<button form="updateForm" type="submit" class="btn btn-primary" style="text-align: right">수정</button>
			<button form="deleteForm" type="submit" class="btn btn-primary" style="text-align: right">삭제</button>
			<form action="delete-beansPick.do" id="deleteForm" method="post">
				<sec:csrfInput />
				<input type="hidden" name="no" value="${BeansPickNo.beansNo}">
			</form>
			<form action="update-form-beansPick.do" id="updateForm" method="post">
				<sec:csrfInput />
				<input type="hidden" name="no" value="${BeansPickNo.beansNo}">
			</form>
		</div>
	</sec:authorize>
</body>
</html>