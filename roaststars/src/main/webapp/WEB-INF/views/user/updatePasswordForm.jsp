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
    // 비밀번호 체크
    var checkPassword = "";
  //현재 비밀번호 체크하기
    $("#passwordNow").keyup(function() {
    	checkPassNow="";
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
                $("#passwordNowResult").html("비밀번호가 맞습니다.").css(
                      "color", "green");
                checkPassNow = passValue; 
             } else {
                $("#passwordNowResult").html("비밀번호가 틀립니다.").css(
                      "color", "red");
                checkPassNow="";
             }
          }//success
       });//ajax
    });//keyup
    // 1. 비밀번호 길이 체크	
    
    $("#passwordC").keyup(function() {
       var passValue=$(this).val();  //기존 기입 비밀번호
   
       if(passValue.length<4||passValue.length>12){
          $("#passwordResult").html("비밀번호는 4~12자 이내로 작성해주세요").css("color","red");
          checkPassword="";
          return;
       } else {
          $("#passwordResult").html("적합한 비밀번호입니다.").css("color","green");
          checkPassword=passValue;
       }
       //비밀번호 일치 여부 체크 (기존 기입 비밀번호 변경 시)
     	 checkPassword="";
       $("#passwordCheckResult").html("");
       var passChecked = $("#passwordChecked").val(); // 비밀번호 확인 기입 비밀번호
       if(passChecked === passValue){
          $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","green");
          checkPassword = passChecked;
       } else if (checkPassword == "" || passChecked !=passValue){
          $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
          checkPassword="";
       }
       
    });// end passwordC
    
    //비밀번호 일치 여부 체크 (비밀번호 확인 기입 비밀번호)
    $("#passwordChecked").keyup(function() {
  	 checkPassword="";
       var passValue =$("#passwordC").val(); //기존 기입 비밀번호
       var passChecked = $(this).val(); // 비밀번호 확인 기입 비밀번호
       if(passChecked===passValue){
          $("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","green");
          checkPassword = passChecked;
       }else{
          $("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
          checkPassword="";
       }
    });// end passwordChecked
  
  /* 서브밋 확인 공간 */   
  $("#updateUserPassForm").submit(function() {
	  if(checkPassNow==""){
	         alert("현재비밀번호를 확인해주세요!");
	         return false;
	      } 
	  // 비밀번호 일치 여부 체크해서 사용가능 상태일때만 수정되도록 한다.
      if(checkPassword==""){
         alert("비밀번호를 확인해주세요!");
         return false;
      } 
  }); // end updateUserForm submit

});//ready
</script>
</head>
<body>
<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_MANAGER')">
<%-- <input type="hidden" name="userVO" value="${userVO}">
 --%> <div class="container" style="width: 500px; float: center;">
  <h2>비밀번호 수정하기</h2>
  <hr style="width: 300px; float:left;"><br><br>
  <form method="post" action="${pageContext.request.contextPath}/update-userPasswordaction.do" class="was-validated" id="updateUserPassForm" enctype="multipart/form-data">
  <sec:csrfInput/>
  	<div class="form-group">
      <label for="passwordNow">현재 비밀번호 : </label> 
      <input type="password" name="passwordNow" id="passwordNow" class="form-control" placeholder="현재 비밀번호를 입력해주세요." required>
       <div class="valid-feedback"><span id="passwordNowResult"></span></div>
      
       <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
    </div>
  
    <div class="form-group">
      <label for="passwordC">비밀번호 : </label>
      <input type="password" name="password" id="passwordC" class="form-control" placeholder="변경할 비밀번호를 입력해주세요." required>  
      <div class="valid-feedback"> <span id="passwordResult"></span></div>
      
       <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
    
    </div>
    
    <div class="form-group">
      <label for="passwordChecked">비밀번호 확인 : </label> 
      <input type="password" id="passwordChecked" class="form-control" placeholder="변경할 비밀번호를 다시 한번 입력해주세요." required>
       <div class="valid-feedback"><span id="passwordCheckResult"></span></div>
      
       <div class="invalid-feedback"> 비밀번호를 입력해주세요.</div>
	  
    </div>
    <hr style="width: 480px; float:left;"><br>
	<input type="submit" value="비밀번호 수정" class="btn btn-primary" style="float:center;">
	
  </form>
</div><!-- container -->
</sec:authorize>

</body>
</html>