<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div style="margin-top: 10px; margin-bottom: 20px; margin-left: 10px; margin-right: 10px">
  <%-- 리뷰 테이블 영역 --%>
  <table>
	 <c:forEach items="${lvo.reviewList}" var="review">
	 	<tr>
	 		<td>닉네임:${review.userVO.nickname}</td>
	 	</tr>
	 	<tr>
	 		<td>등록일자:${review.reviewRegdate}</td>
	 	</tr>  
	 	<tr>
	 		<td>리뷰내용:${review.reviewContent}</td>
	 	</tr>
	 </c:forEach>
  </table> <%-- 리뷰 테이블 영역 --%>
  <br>
  
  
  <div class="pagingInfo">
	<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
	<c:set var="pb" value="${requestScope.lvo.pagingBean}"/>
	<%-- cafeNo도 변수에 담는다. --%>
	<c:if test="${fn:length(requestScope.lvo.reviewList) > 0}">
		<c:set var="cafeNo" value="${requestScope.lvo.reviewList[0].cafeVO.cafeNo}"/>
	</c:if>
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
		<li><a href="${pageContext.request.contextPath}/review-list.do?cafeNo=${cafeNo}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
	</c:if>
	
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
			<li><a href="${pageContext.request.contextPath}/review-list.do?cafeNo=${cafeNo}&pageNo=${i}">${i}</a></li> 
			</c:when>
			
			<c:otherwise>
			<li class="active"><a href="#">${i}</a></li>
			</c:otherwise>
		</c:choose>
		&nbsp;
	</c:forEach>
	
	<c:if test="${pb.nextPageGroup}">	
	<li><a href="${pageContext.request.contextPath}/review-list.do?cafeNo=${cafeNo}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
	</c:if>
	</ul>	 		
	
	</div> 
 
</div> 
 
</body>
</html>