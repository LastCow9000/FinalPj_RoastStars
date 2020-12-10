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
	<a href="${pageContext.request.contextPath}/beansPick-form.do">BeansPick</a> <!-- 나중에 헤더로 이동 -->
	<div class="bannerbox">
		<video src="resources/upload/main_banner.mp4" width="1200px" height="700px" autoplay loop muted></video>
		<div class="banner-form">
			<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
				<div class="banner-text">
	    			<h1>언제까지 맨날 똑같은 커피만 마실래 ?!</h1>
	    			<h2>진짜 당신의 인생 카페를 찾아드립니다.</h2>
	  			</div>
				<form class="form-inline" action="findListByLoc.do">
					<div class="input-group">
						<input type="text" name="loc" class="form-control" size="100" placeholder="지역을 입력해주세요" required="required">
						<button type="submit" class="btn btn-dark">검색</button>
					</div> 
				</form>
			</div>
		</div>
	</div>
</body>
</html>