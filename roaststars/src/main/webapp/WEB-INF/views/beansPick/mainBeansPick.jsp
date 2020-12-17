<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPick Main</title>
<link rel="stylesheet" href="resources/css/home.css">
</head>
<body>
	<c:set var="pb" value="${lvo.pagingBean}" />
	<div class="container">
		<h2>Bean's Pick</h2>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div style="text-align: right;">
		<sec:csrfInput/>
			<a href="${pageContext.request.contextPath}/register-form-beansPick.do" class="btn btn-info" >등록하기</a>
		</div>
		</sec:authorize>
		<div id=beansPickLayout class="row justify-content-center">
			<c:forEach items="${requestScope.lvo.beansPickList}" var="BeansPickVO">
				<div class="card col-sm-5 ">
					<div class="card-header">
						<img class="card-title beansPickimg" src="resources/upload/${BeansPickVO.beansPic}" alt="no image">
					</div>
					<div class="card-body">
						<h4 class="card-title">${BeansPickVO.beansNo}</h4>
						<p class="card-text">${BeansPickVO.beansTitle}</p>
						<div style="text-align: right">
							<a href="${pageContext.request.contextPath}/detail-beansPick.do?no=${BeansPickVO.beansNo}" class="btn btn-info">See Pick</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	<%-- 성호 : 페이징 가운데 정렬 : 시작 --%>
	<ul class="pagination pagination-warning justify-content-center">
		<c:if test="${pb.previousPageGroup}">
			<li class="page-item"><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${pb.startPageOfPageGroup-1}" class="page-link">&laquo;</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li class="page-item"><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${i}" class="page-link">${i}</a></li>
				</c:when>

				<c:otherwise>
					<li class="active page-item"><a href="#" class="page-link" class="page-link">${i}</a></li>
				</c:otherwise>
			</c:choose>
       &nbsp; 
    </c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li class="page-item"><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${pb.endPageOfPageGroup+1}" class="page-link">&raquo;</a></li>
		</c:if>
	</ul>
	<!-- 페이징 바 -->
</body>
</html>