<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페등록폼</title>
<script type="text/javascript">

/* 길이 체크 공간 */

$(document).ready(function() {
	var checkTitle="";
	// 제목 길이 체크
	$("#registCafeName").keyup(function() {
		checkName = "";
		var nameValue= $(this).val().trim();
		//제목 길이 10자 넘어가면 빨갛게
		if(nameValue.length > 10){
			$("#nameCheckResult").html(nameValue.length).css("color","red");
			return;
		//제목 길이 평소에는 grey로
		} else {
			$("#nameCheckResult").html(nameValue.length).css("color","grey");
			checkName = nameValue;
		}
	});//keyup
	 
	/* 길이 넘었을 때 submit 안 되도록 막기 */
	$("#registerCafeForm").submit(function() {
		if(checkName == ""){
			alert("상호명은 10자 이내로 작성해주세요.");
			return false;
		}
	});//sumit
	
	/* 공휴일 운영 안함 체크 시, 공휴일 운영시간에 '운영 안 함' 할당하기*/
	$("#noOperating").click(function() {
		alert($(this).val());
		$('#noOperatingSpan').text($(this).val());
	});//end noOperating
	
});//ready

</script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/register-cafe.do" id="registerCafeForm" enctype="multipart/form-data">
<input type="hidden" name="command" value="register">
	<sec:csrfInput/>
	카페명: <input type="text" name="cafeName" id="registCafeName" required="required"><span id="nameCheckResult"></span><br>
	주소: <input type="text" name="cafeLoc" required="required"><br>
	카페사진 <input type="file" name="uploadFile">
	전화번호 <input type="text" name="cafeTel" required="required"><br>
	정보:<textarea rows="10" cols="120" placeholder="본문 내용을 입력하세요" name="cafeInfo" required="required"></textarea>
	운영시간<br> 
	평일<input type="time" name="weekdayTime"> ~ <input type="time" name="weekdayTime"><br>
	주말<input type="time" name="weekendTime"> ~ <input type="time" name="weekendTime"><br>
	공휴일<input type="time" name="holidayTime"> ~ <input type="time" name="holidayTime">
	<!-- 병철아.. 체크박스를 클릭하면 공휴일 부분의 value로 들어가도록 이 부분을 쓰거라.. -할미 -->
	<span id="noOperatingSpan"></span>
	&nbsp;<input type="checkbox" id="noOperating" value="운영 안 함"> 운영 안 함<br>
	
<input  type="submit" value="등록하기">
</form>
</body>
</html>