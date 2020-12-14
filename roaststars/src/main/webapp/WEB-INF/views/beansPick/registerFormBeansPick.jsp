<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Pick Form</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/register-beansPick.do" enctype="multipart/form-data">
		 <sec:csrfInput/>
		 BeansPick 사진 : <input type="file" name="uploadFile"  required="required"><br>
		 BeansPick 제목 : <input type="text" name="beansTitle"  required="required"><br>
		 BeansPick 내용 : <textarea rows="10" cols="120" placeholder="본문 내용을 입력하세요" name="beansContent" required="required"></textarea>
		<input type="submit" value="등록하기">
	</form>
</body>
</html>