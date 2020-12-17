<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<br> <a href="${pageContext.request.contextPath}/register-form-beansPick.do">등록하기</a>
		<div class="row">
			<div id=beansPickLayout class="col-sm-12 row justify-content-center">
				<c:forEach items="${requestScope.lvo.beansPickList}" var="BeansPickVO">
					<div class="card col-sm-5 ">
						<img class="card-title" src="resources/upload/${BeansPickVO.beansPic}" alt="no image" width="500" height="300">
						<div class="card-body">
							<h4 class="card-title">${BeansPickVO.beansNo}</h4>
							<p class="card-text">${BeansPickVO.beansTitle}</p>
							<a href="${pageContext.request.contextPath}/detail-beansPick.do?no=${BeansPickVO.beansNo}" class="btn btn-info">See Pick</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<%--  	<%-- 성호 : 페이징 가운데 정렬 : 시작 --%>
		<ul class="pagination justify-content-center">
			<c:if test="${pb.previousPageGroup}">
				<li><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
			</c:if>

			<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
				<c:choose>
					<c:when test="${pb.nowPage!=i}">
						<li><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${i}">${i}</a></li>
					</c:when>

					<c:otherwise>
						<li class="active"><a href="#">${i}</a></li>
					</c:otherwise>
				</c:choose>
       &nbsp; 
    </c:forEach>
			<c:if test="${pb.nextPageGroup}">
				<li><a href="${pageContext.request.contextPath}/main-beansPick.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<!-- 페이징 바 -->
</body>
</html>


