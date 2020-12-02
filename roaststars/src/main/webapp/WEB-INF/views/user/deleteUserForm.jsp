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
	 var checkPass=""; 
     $("#passwordChecked").keyup(function() {
    	checkPass="";
    	 var passValue= $(this).val().trim();
        $.ajax({
           type : "post",
           url : "${pageContext.request.contextPath}/pass-checkAjax.do",
           data : "password="+passValue,
           beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                   xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
               }, 
           success : function(result) {
              
              if (result == "ok"){
                 $("#passwordCheckResult").html("비밀번호가 맞습니다.").css(
                       "color", "blue");
                 checkPass = passValue; 
              } else {
                 $("#passwordCheckResult").html("비밀번호가 틀립니다.").css(
                       "color", "red");
              }
           }//success
        });//ajax
     });//keyup
     $("#deleteUserForm").submit(function() {
         if(checkPass==""){
            alert("비밀번호를 확인해주세요!");
            return false;
         }
      });//submit
      
     
});//ready
</script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_MEMBER')">
 <form method="post" action="${pageContext.request.contextPath}/delete-useraction.do" id="deleteUserForm">
<input type="hidden" name="command" value="delete">

 <%-- 
  		csrf 토큰 : csrf 공격을 막기 위한 1회성 인증키인 
  		              csrf토큰을 함께 전달해야 전송이 가능하다
 
  --%>
 <sec:csrfInput/>
		아이디 : 
		<input type="text" name="id" value="<sec:authentication property="principal.id"/>" readonly>

		<br>패스워드 <input type="password" id="passwordChecked" required="required"><span id="passwordCheckResult"></span><br>
		
		<br><input type="submit" value="탈퇴하기">
		</form>
</sec:authorize>
</body>
</html>