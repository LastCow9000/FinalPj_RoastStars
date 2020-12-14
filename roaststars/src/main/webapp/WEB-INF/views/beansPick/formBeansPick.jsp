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
	<%-- 	<div class="pagingInfo">
			<!-- 
                     step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
                                 페이징빈의 previousPageGroup 이용 
                           2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
                                  hint)   startPageOfPageGroup-1 하면 됨        
                -->
			<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
                           2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
                              현 페이지이면 링크를 처리하지 않는다.  
                              PagingBean의 nowPage
                              jstl choose 를 이용  
                              예) <a href="DispatcherServlet?command=list&pageNo=...">               
                -->
			성호 : 페이징 가운데 정렬 : 시작
			<ul class="pagination pagination-sm justify-content-center">
				성호 : 페이징 가운데 정렬 : 끝
				<c:if test="${pb.previousPageGroup}">
					<li><a href="${pageContext.request.contextPath}/form-beansPick.do?beansNo=${beansNo}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	               &nbsp;
               </c:if>

				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/form-beansPick.do?beansNo=${beansNo}&pageNo=${i}">${i}</a></li>
						</c:when>

						<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
						</c:otherwise>
					</c:choose>
                  &nbsp; 
               </c:forEach>

				<c:if test="${pb.nextPageGroup}">
					<li><a href="${pageContext.request.contextPath}/form-beansPick.do?beansNo=${beansNo}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
				</c:if>
			</ul>

		</div>
		<!-- 페이징 바 --> --%>
	</div>
</body>
</html>


