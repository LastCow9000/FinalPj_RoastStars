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
	<div id=beansPickLayout class="container-fluid row justify-content-center">
	<%-- 빈즈픽 상세 내용 --%>
		<div class="card col-sm-8 ">
			<img class="card-img-top" src="resources/upload/${BeansPickNo.beansPic}" alt="no image">
			<div class="card-body">
				<h4 class="card-title">${BeansPickNo.beansNo}</h4>
				<p class="card-text">${BeansPickNo.beansTitle}</p>
				<p class="card-text">${BeansPickNo.beansContent}</p>
				<p class="card-text">${BeansPickNo.beansRegdate}</p>
				<a href="${pageContext.request.contextPath}/main-beansPick.do">BeansPick으로</a>
			</div>
		</div>
		<%-- 삭제 --%>
		<button form="deleteForm" type="submit">삭제</button>
		<form action="delete-beansPick.do" id="deleteForm" method="post">
			<sec:csrfInput />
			<input type="hidden" name="no" value="${BeansPickNo.beansNo}">
		</form>
		<%-- 수정 --%>
		<button form="updateForm" type="submit">수정</button>
		<form action="update-form-beansPick.do" id="updateForm" method="post">
			<sec:csrfInput />
			<input type="hidden" name="no" value="${BeansPickNo.beansNo}">
		</form>
	</div>
</body>
</html>