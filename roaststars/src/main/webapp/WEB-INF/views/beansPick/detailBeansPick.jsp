<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick Detail Form</title>
</head>
<body>
	<div class="container">
		<h2>Bean's Pick Detail</h2>
		<div style="text-align: right">
			<a href="${pageContext.request.contextPath}/main-beansPick.do" class="btn btn-info">BeansPick으로</a>
		</div>
		<div style="text-align: center">
			<p>NO.${BeansPickNo.beansNo}</p>
		</div>
		<div class="card" style="width: 600px; margin: auto">

			<img class="card-img-top beansPickimg" src="resources/upload/${BeansPickNo.beansPic}" alt="no image">
			<div class="card-body">
				<h4 class="card-title">${BeansPickNo.beansTitle}</h4>
				<p class="card-text">${BeansPickNo.beansContent}</p>
				<p class="card-text">${BeansPickNo.beansRegdate}</p>
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