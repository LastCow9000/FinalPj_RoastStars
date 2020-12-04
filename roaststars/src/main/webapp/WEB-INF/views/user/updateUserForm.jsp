<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	/* 중복 확인 공간 */   
    // 비밀번호 길이 체크
    $("#passwordC").keyup(function() {
       var passValue=$(this).val();
       //$("#passwordResult").html($(this).val());
       if(passValue.length<4||passValue.length>12){
          $("#passwordResult").html("비밀번호는 4~12자 이내로 작성해주세요").css("color","violet");
          return;
       } else {
          $("#passwordResult").html("적합한 비밀번호입니다.").css("color","blue");
       }
    });
    $("#passwordChecked").keyup(function() {
       var passValue =$("#passwordC").val();
       var passChecked = $(this).val();
       if(passChecked===passValue){
          $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","blue");
       }else{
          $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
       }
    });
});//ready
</script>
</head>
<body>
 <sec:authorize access="hasRole('ROLE_MEMBER')">
 <form method="post" action="${pageContext.request.contextPath}/update-useraction.do">
 <%-- 
  		csrf 토큰 : csrf 공격을 막기 위한 1회성 인증키인 
  		              csrf토큰을 함께 전달해야 전송이 가능하다
 
  --%>
 <sec:csrfInput/>
		<input type="hidden" name="command" value="update">
		아이디 : 
		<input type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>
		<br>패스워드 : <input type="password" name="password" id="passwordC" required="required">	
		<br>패스워드확인 <input type="password" id="passwordChecked" required="required"><span id="passwordCheckResult"></span><br>
		<br>이름 : <input type="text" name="name" value="<sec:authentication property="principal.name"/>" required="required">	
		<br>주소 : <input type="text" name="address" value="<sec:authentication property="principal.address"/>" required="required">	
		<br>전화번호 <input type="text" name="tel"  value="<sec:authentication property="principal.tel"/>" required="required"><br>
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
</body>
</html>