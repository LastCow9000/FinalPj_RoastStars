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
				<h2>${cafeVO.cafeName}* 끝에 별표</h2>
				<div class="fakeimg">${cafeVO.cafeName}
					Cafe Image
					<%-- <img src="${initParam.root}upload/${requestScope.fileName}"> --%>
					<img src="${pageContext.request.contextPath}/resources/upload/${cafeVO.cafePic}"
						  width="500" height="300">
				</div>
				<p>${cafeVO.cafeInfo}</p>
				<table class="table">
					<tr>
						<td>운영시간</td>
						<td>
						평일 : ${cafeVO.cafeOperatingTimeVO.weekdayTime} <br>
						주말 : ${cafeVO.cafeOperatingTimeVO.weekendTime} | 공휴일 : ${cafeVO.cafeOperatingTimeVO.holidayTime}
						</td>
					</tr>
					
					<tr>
						<td>위치</td>
						<td>${cafeVO.cafeLoc}</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center"><button>바로 주문하기</button></td>
					</tr>
				</table>
				
			</div><!-- 카페 상세보기 영역 -->
		
			<!-- 리뷰 영역 -->
			<div style="margin-top: 30px">
			  <div class="col-sm-5 col-sm-offset-1" style="background-color: #cbf1f5">
				 리뷰 영역
				 ${cafeVO.cafeNo}
				 <!--<c:import url="/review-list.do">
				 	<c:param name="cafeNo" value="${cafeVO.cafeNo}"/>
				 </c:import>-->
			  </div><!-- 리뷰영역 -->
			</div>
			
		</div><!-- row -->
	</div><!-- container -->
</body>
</html>