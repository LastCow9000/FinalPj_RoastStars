<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Pick Form</title>
</head>
<body>
	<div class="shadow-sm p-4 mb-4 bg-white">
		<div class="container" style="width: 800px; float: center; margin-left: 81px;">
		<h2>BeansPick 등록하기</h2>
			<!-- <div class="container shadow-sm p-4 mb-4 bg-white" style="width: 500px; float: center;"> -->
			<form method="post" action="${pageContext.request.contextPath}/register-result-beansPick.do" class="was-validated" id="registerForm" enctype="multipart/form-data">
				<sec:csrfInput />
				BeansPick 사진 : <input type="file" name="uploadFile" required="required" class="btn btn-primary"><br> <br> BeansPick 제목 : <input type="text" name="beansTitle" required="required"><br> <br> BeansPick 내용 :
				<textarea rows="10" cols="120" placeholder="본문 내용을 입력하세요" name="beansContent" required="required"></textarea>
				<input type="submit" class="btn btn-primary" style="text-align: right" value="등록하기">
			</form>
		</div>
	</div>
</body>
</html>