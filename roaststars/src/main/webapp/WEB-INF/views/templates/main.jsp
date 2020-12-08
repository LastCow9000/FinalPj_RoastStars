<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<title>Main</title>
</head>
<body>
	
	<%-- 성호 : 관리자 페이지 링크 : 시작 --%>
	 	<a href="${pageContext.request.contextPath}/admin-detail-form.do">관리자 페이지</a> 
	<%-- 성호 : 관리자 페이지 링크 : 종료 --%>
	<div class="masthead text-center jumbotron">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1>언제까지 맨날 똑같은 커피만 마실래 ?!</h1>
					<h2>진짜 당신의 인생 카페를 찾아드립니다.</h2>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form class="form-inline" action="findListByLoc.do">
						<div class="form-row">
							<div class="input-group">
								<input type="text" name="loc" class="form-control" size="100" placeholder="지역을 입력해주세요" required="required">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default">검색</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>