<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩4 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    // 기존 닉네임
    var orgNickValue = $("#memberNick").val();
    // 닉네임 체크
    var checkNick=$("#memberNick").val();
	//현재 비밀번호 체크
    var checkPassNow=""; 
    // 1. 비밀번호 길이 체크	 
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

    // 2. 닉네임 길이 체크
    $("#memberNick").keyup(function() {
     // 입력된 닉네임
     var nickValue= $(this).val().trim();
    
     // 원래 본인 닉네임을 다시 입력했을 경우, 중복체크 메서드가 돌아가지 않도록 막아줌
     if (orgNickValue == nickValue){
    	 nickValue = orgNickValue;
    	 return;
     }

     checkNick = "";

     // 닉네임 길이 체크
     if(nickValue.length<2||nickValue.length>7){
        $("#nickCheckResult").html("닉네임은 2~7자 이내로 작성해주세요").css("color","red");
        return;
     }
     
     // 닉네임 중복 체크
     $.ajax({
        type : "get",
        url :"${pageContext.request.contextPath}/nick-checkAjax.do",
        data : "nickname="+nickValue,
        success : function(result) {
           // 닉네임이 사용가능하면 = 중복이 아니면
           if (result == "ok"){
              $("#nickCheckResult").html("사용가능한 닉네임입니다.").css(
                    "color", "green");
              checkNick = nickValue; 
              //alert($(this).text());
           } else { // 닉네임 사용불가하면 = 중복이면
              $("#nickCheckResult").html("중복된 닉네임입니다.").css(
                    "color", "red");
           }
        }
     });
  });// end memberNick keyup    
    
  /* 서브밋 확인 공간 */   
  $("#updateUserForm").submit(function() {
	  if(checkPassNow==""){
	         alert("현재비밀번호를 확인해주세요!");
	         return false;
	      } 

     // 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
     if(checkNick == ""){
         alert("닉네임을 확인해주세요!");
         return false;
      }
  }); // end updateUserForm submit
  
  
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
<div class="container" style="width: 500px; float: center;">
	<h2>회원정보 수정</h2>
  	<hr style="width: 300px; float:left;"><br><br>

 <form method="post" action="${pageContext.request.contextPath}/update-useraction.do" class="was-validated" id="updateUserForm">
	<%-- 
	 		csrf 토큰 : csrf 공격을 막기 위한 1회성 인증키인 
	 		              csrf토큰을 함께 전달해야 전송이 가능하다
	
	 --%>
	<sec:csrfInput/>
	<input type="hidden" name="command" value="update">
	
	<div class="form-group">
      <label for="id">아이디 : </label>
      <input type="text" name="id" value="<sec:authentication property="principal.id"/>" class="form-control" readonly>
    </div>
    
     <div class="form-group">
      <label for="passwordNow">현재 비밀번호 : </label>
      <input type="password" name="passwordNow" id="passwordNow" class="form-control" placeholder="현재 비밀번호를 입력해주세요.">
      <span id="passwordNowResult"></span>
    </div>
   
   <hr style="width: 480px; float:left;"><br><br>
    
   <div class="form-group">
      <label for="userName"> 이름 : </label>
      <input type="text" name="name" id="userName" class="form-control" required
  			value="${userVO.name}" readonly="readonly">
    </div>
    
    <div class="form-group">
       <label for="memberNick"> 닉네임 : </label>
      <input type="text" name="nickname" id="memberNick" class="form-control"
     	 value="${userVO.nickname}"  required>
	      <div class="valid-feedback"><span id="nickCheckResult"></span></div>
	      <div class="invalid-feedback">  닉네임을 입력해주세요.</div>
    </div>
    
   <div class="form-group">
       <label for="tel"> 휴대전화 번호 : </label>
       <input type="text" name="tel"  id="tel" class="form-control" 
       	placeholder="Enter your phone number(숫자로만 입력해주세요)" required
       	value="${userVO.tel}">
	      <div class="valid-feedback"></div>
	      <div class="invalid-feedback">  휴대전화 번호를 입력해주세요.</div>
    </div>
       
    <div class="form-group">
       <label for="address"> 주소 : <button type="button" class="btn btn-warning btn-sm" id="goToAddrAPIBtn">주소 검색하기</button></label>
        <input type="text" name="address" id="address" 
        value="<sec:authentication property="principal.address"/>" readonly="readonly" class="form-control"  
        size=80  placeholder="'주소검색'을 통해 입력해주세요" required>
	      <div class="valid-feedback"></div>
	      <div class="invalid-feedback">  주소를 입력해주세요.</div>
	      상세주소: <input type="text" name="address" size="50" style="margin-top: 10px; height: 20px;">
    </div>
   
   <hr style="width: 480px; float:left;"><br>
   
   <input type="submit" class="btn btn-info" value="회원정보수정">
   <sec:authentication property="principal.id" var="loginId"/>
   <a href="${pageContext.request.contextPath}/update-PasswordForm.do?id=${loginId}">비밀번호 변경하기</a>
</form>

</div><!-- container -->
</sec:authorize>
</body>
</html>