<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* 중복 확인 공간 */   
    // 비밀번호 길이 체크
    var checkPass="";
    
    $("#passwordChecked").keyup(function() {
    	checkPass="";
       var passValue =$("#passwordC").val().trim();
       var passChecked = $(this).val().trim();
       if(passChecked===passValue){
          $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","blue");
          checkPass = passValue;
       }else{
          $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
       }
    });
    //비밀번호가 다르면 정보수정 안됨
    $("#updateUserForm").submit(function() {
        if(checkPass==""){
           alert("비밀번호를 확인해주세요!");
           return false;
        }
     });//submit
     
 	 // 주소 팝업	
 	  $("#goToAddrAPIBtn").click(function() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              $("#address").val(data.address);
	          }//oncomplete 
	      }).open();
	});//goToAddrAPIBtn
	
});//ready
</script>
</head>
<body>
 <sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_MANAGER')">
 <form method="post" action="${pageContext.request.contextPath}/update-useraction.do" id="updateUserForm">
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
		<br>주소 : <input type="text" name="address" id="address" value="<sec:authentication property="principal.address"/>" required="required" size=80><button type="button" class="btn" id="goToAddrAPIBtn">주소 검색하기</button>	
		<br>전화번호 <input type="text" name="tel"  value="<sec:authentication property="principal.tel"/>" required="required"><br>
		<br><input type="submit" value="회원정보수정">
		</form>
</sec:authorize>
</body>
</html>