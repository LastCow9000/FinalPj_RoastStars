<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>카페 상세보기</title>
</head>
	
<body>	
	<div class="container">
		<div class="row">
		
			<!-- 카페 상세정보 영역 -->
			<div class="col-sm-6" style="background-color: cyan">
				<font size="10"><strong>${cafeVO.cafeName}</strong></font>
				(이 줄의 끝에)별표
				<hr>
				<span style="display:inline-block; height: 300px; width: 500px; background-color: blue">
					${cafeVO.cafePic}
				</span>
				<hr>
				
			</div>
	
			<!-- 리뷰 영역 -->
			<div class="col-sm-5 col-sm-offset-1" style="background-color: red">
				리뷰 영역
			</div>
		</div> <!-- row -->
	</div> <!-- container -->
</body>
</html>