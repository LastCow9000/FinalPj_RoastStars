<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div class="container">
		<div class="row">
			<!-- 카페 상세정보 영역 -->
			<div class="col-sm-6" style="background-color: cyan">
				<font size="6"><strong>${cafeVO.cafeName}</strong></font>
				${cafeVO.cafePic}
				(이 줄의 끝에)별표
				<hr>
				<span style="display:inline-block; height: 300px; width: 500px; background-color: blue">
					<%-- <img src="${initParam.root}upload/${requestScope.fileName}"> --%>
					<img src="${pageContext.request.contextPath}/resources/upload/${cafeVO.cafePic}" width="500" height="300">
				</span>
				<hr>
				<table class="table">
					<tr>
						<td colspan="3">${cafeVO.cafeInfo}</td>
					</tr>
					<tr>
						<td>운영시간</td>
						<td>평일 : ${cafeVO.cafeOperatingTimeVO.weekdayTime}</td>
						<td>주말 : ${cafeVO.cafeOperatingTimeVO.weekendTime} | 공휴일 : ${cafeVO.cafeOperatingTimeVO.holidayTime}</td>
					</tr>
					<tr>
						<td>위치</td>
						<td colspan="2">${cafeVO.cafeLoc}</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<button>바로 주문하기</button>
						</td>
					</tr>
				</table>

			</div>
	
			<!-- 리뷰 영역 -->
			<div class="col-sm-5 col-sm-offset-1" style="background-color: red">
				리뷰 영역
			</div>
		</div> <!-- row -->
	</div> <!-- container -->
</body>
</html>