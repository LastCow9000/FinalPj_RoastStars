<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminDetail</title>
</head>
<body>
	<!-- 성호 : 네비 : 시작 -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" href="#">등급관리</a></li>
		<%--   <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/beanspick-detail-form.do">Bean's Pick관리</a>
  </li> --%>
	</ul>
	<%-- 성호 : 네비 : 종료 --%>
	<%-- 성호 : 등급테이블 : 시작 --%>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">이름</th>
				<th scope="col">사업명</th>
				<th scope="col">사업자등록번호</th>
				<th scope="col">사업자등록증</th>
				<th scope="col">현재등급</th>
				<th scope="col">등급</th>
				<th scope="col">확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="userVO" items="${requestScope.list}">
				<tr>
					<td>${userVO.id}</td>
					<td>${userVO.name}</td>
					<td>${userVO.businessName}</td>
					<td>${userVO.businessNo}</td>
					<td>${userVO.businessPic}</td>
					<td>${authorities.authority}</td>
					<td><select id="getUserPositionList">
							<option value="">등급</option>
							<c:forEach items="${uplist}" var="addr">
								<option value="${addr}">${addr}</option>
							</c:forEach>
					</select></td>
					<td><input type="submit" value="권한추가" id="addAuthority"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%-- 성호 : 등급테이블 : 종료 --%>
	<%-- 성호 : 페이징 : 시작 --%>
	<div class="pagingInfo">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
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
	<ul class="pagination">
	<c:if test="${pb.previousPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/admin-detail-form.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" 
	end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<li><a href="${pageContext.request.contextPath}/admin-detail-form.do.do?pageNo=${i}">${i}</a></li> 
	</c:when>
	<c:otherwise>
	<li class="active"><a href="#" >${i}</a></li>
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/admin-detail-form.do.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	</div> 	
	<%-- 성호 : 페이징 : 끝 --%>
</body>
</html>




