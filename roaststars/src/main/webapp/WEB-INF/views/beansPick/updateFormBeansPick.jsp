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
${beansPickVO}
<form method="post" action="${pageContext.request.contextPath}/update-result-beansPick.do" enctype="multipart/form-data">
		
		 <sec:csrfInput/><br>
		 <input type="hidden" name="beansNo" value="${beansPickVO.beansNo}">
		 BeansPick 사진 : <input type="file" name="uploadFile"  required="required" value="${beansPickVO.beansPic}"><br>
		 BeansPick 제목 : <input type="text" name="beansTitle"  required="required" value="${beansPickVO.beansTitle}"><br>
		 BeansPick 내용 : <textarea rows="10" cols="120" placeholder="${beansPickVO.beansContent}" name="beansContent" required="required"></textarea>
		 
		 <input type="submit" value="수정하기">
	</form> 
</body>
</html>
