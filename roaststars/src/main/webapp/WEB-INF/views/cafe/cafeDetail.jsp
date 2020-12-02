<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>카페 상세보기</title>
</head>

<body>
	<div class="container" style="margin-top: 10px">
		<div class="row">
			<!-- 카페 상세정보 영역 -->
			<div class="col-sm-6" style="background-color: #ffe2e2">
				<font size="20px"><strong>${cafeVO.cafeName}</strong></font>
				<span id="myPickStar"><button>별표</button></span>
				<div class="fakeimg">${cafeVO.cafeName}
					Cafe Image
					<%-- <img src="${initParam.root}upload/${requestScope.fileName}"> --%>
					<img src=""
						  width="500" height="300">
				</div>
				<p>${cafeVO.cafeInfo}</p>
				<table class="table">
					<tr>
						<td>전화번호</td>
						<td>${cafeVO.cafeTel}</td>
					</tr>
					<tr>
						<td>운영시간</td>
						<td>
						평일 : ${cafeVO.cafeOperatingTimeVO.weekdayTime} <br>
						주말 : ${cafeVO.cafeOperatingTimeVO.weekendTime} | 공휴일 : ${cafeVO.cafeOperatingTimeVO.holidayTime}
						</td>
					</tr>
					
					<tr>
						<td>주소</td>
						<td>${cafeVO.cafeLoc}</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center"><button>바로 주문하기</button></td>
					</tr>
				</table>
				
			</div><!-- 카페 상세보기 영역 -->
		
		
			<!-- 리뷰 영역 -->
			<div style="margin-top: 30px">
			  <div class="col-sm-5 col-sm-offset-1" style="background-color: #cbf1f5;">
				 <font size="15px"><strong>리뷰 (${reviewTotalCount})</strong></font>
				 <span id="reviewBtn"><button>리뷰작성</button></span>
				
				 <div class="col-sm-11" style="margin-top: 20px; margin-bottom: 20px; margin-left: 20px; margin-right: 10px; background-color: #f9f7f7;">
				  <%-- 리뷰 테이블 영역 --%>
				  <%-- <table class="table"> --%>
				  <table>
					 <c:forEach items="${lvo.reviewList}" var="review">
					 	<tr>
					 		<td align="left"><strong>${review.userVO.nickname}</strong></td>
					 		<td align="right">${review.reviewRegdate}</td>
					 	</tr>

					 	<tr>
					 		<td colspan="2">${review.reviewContent}</td>
					 	</tr>
					 </c:forEach>
				  </table> <%-- 리뷰 테이블 영역 --%>
				  
				  
				  <div class="pagingInfo">
					<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
					<c:set var="pb" value="${requestScope.lvo.pagingBean}"/>
					<%-- cafeNo도 변수에 담는다. --%>
					<c:set var="cafeNo" value="${cafeVO.cafeNo}"/>

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
					<ul class="pagination pagination-sm">
					<c:if test="${pb.previousPageGroup}">	
						<li><a href="${pageContext.request.contextPath}/cafe-detail.do?cafeNo=${cafeNo}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
					</c:if>
					
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<c:choose>
							<c:when test="${pb.nowPage!=i}">
							<li><a href="${pageContext.request.contextPath}/cafe-detail.do?cafeNo=${cafeNo}&pageNo=${i}">${i}</a></li> 
							</c:when>
							
							<c:otherwise>
							<li class="active"><a href="#">${i}</a></li>
							</c:otherwise>
						</c:choose>
						&nbsp; 
					</c:forEach>
					
					<c:if test="${pb.nextPageGroup}">	
					<li><a href="${pageContext.request.contextPath}/cafe-detail.do?cafeNo=${cafeNo}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
					</c:if>
					</ul>	 		
					
					</div> 
				 
				</div> 
			  </div>
			</div><!-- 리뷰영역 -->
			
		</div><!-- row -->
	</div><!-- container -->
</body>
</html>