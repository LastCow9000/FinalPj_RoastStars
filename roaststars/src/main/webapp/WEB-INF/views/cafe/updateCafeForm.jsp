<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/update-cafe.do" id="updateCafeForm">
<input type="hidden" name="command" value="register">
<input type="hidden" name="cafeNo" value="${cafeVO.cafeNo}">

	<sec:csrfInput/>
	카페명: <input type="text" name="cafeName" value="${cafeVO.cafeName }" required="required"><br>
	위치: <input type="text" name="cafeLoc" value="${cafeVO.cafeLoc }" required="required"><br>
	<!-- 사진: <input type="text" name="" required="required"><br> -->
	전화번호 <input type="text" name="cafeTel" value="${cafeVO.cafeTel }" required="required"><br>
	정보:<textarea rows="10" cols="120" placeholder="본문 내용을 입력하세요" name="cafeInfo" required="required"></textarea>
	운영시간<br> 
	평일<input type="time" name="weekdayTime" > ~ <input type="time" name="weekdayTime" ><br>
	주말<input type="time" name="weekendTime" > ~ <input type="time" name="weekendTime" ><br>
	공휴일<input type="time" name="holidayTime" > ~ <input type="time" name="holidayTime" ><br>
	
<input  type="submit" value="등록하기">
</form>
</body>
</html>