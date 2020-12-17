<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

   $(document).ready(function() {
      var checkId="";
      var checkNick="";
      var checkPassword = "";
      var checkTel="";
      
      /* 길이 체크 공간 */
      
      // 1. 아이디 길이 체크
      $("#memberId").keyup(function() {
         checkId="";
         var idValue= $(this).val().trim();
         // 아이디 길이 체크
         if(idValue.length<4||idValue.length>10){
            $("#idCheckResult").html("아이디는 4~10자 이내로 작성해주세요").css("color","red");
            return;
         }
         // 아이디 중복 체크
         $.ajax({
            type : "get",
            url : "${pageContext.request.contextPath}/id-checkAjax.do",
            data : "id="+idValue,
            /* beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                }, 포스트방식일떄 사용*/
            success : function(result) {
               // 아이디가 사용가능하면 = 중복이 아니면
               if (result == "ok"){
                  $("#idCheckResult").html("사용가능한 아이디입니다.").css(
                        "color", "green");
                  checkId = idValue; 
               } else { // 아이디가 사용불가하면 = 중복이면
                  $("#idCheckResult").html("중복된 아이디입니다.").css(
                        "color", "red");
               }
            }//success
         });//ajax
      });// end memberId keyup
      
      // 2. 닉네임 길이 체크
        $("#memberNick").keyup(function() {
         checkNick="";
         var nickValue= $(this).val().trim();
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
     
    
      // 비밀번호 길이 체크
      $("#passwordC").keyup(function() {
         var passValue=$(this).val();  //기존 기입 비밀번호
         //$("#passwordResult").html($(this).val());
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
            //$(".pass valid-feedback").attr('class', ".pass invalid-feedback");
            
         }
      });// end passwordChecked
      

    //전화번호 문자 입력 불가 & 길이제한
 	 $("#tel").keyup(function() {
 		 var telValue=$(this).val().trim();
          
          if(telValue.length<3||telValue.length>11){
               $("#telResult").html("전화번호는 3~11자 이내로 작성해주세요").css("color","red");
               checkTel="";
               return;
            } else {
         	   if(isFinite(telValue) == false){
                    $("#telResult").html("문자는 입력하실 수 없습니다.").css("color","red");
                    checkTel="";
                 }else{
                    $("#telResult").html("사용가능한 번호입니다.").css("color","green");

                    checkTel=telValue;
                 }
            }
 	 });//end tel keyup 

   	  //3. 회원구분 라디오 버튼 
      $(".classification").change(function(){ //라디오 버튼 변화 시
    	  var tags='';
    	  if( $(this).val() == "ROLE_MANAGER"){	//사장 체크 시 
    		  alert("관리자가 확인 후 사장 권한이 부여됩니다.");
    	  
    	  	  tags+='<div class="form-group">';
    	  	  tags+='<label for="businessName">사업장명 : </label>';
    		  tags+='<input type="text" name="businessName" id="businessName" class="form-control" placeholder="Enter Your Business place name" required>';
       	  	  tags+='<div class="valid-feedback"></div>';
       	  	  tags+='<div class="invalid-feedback">  사업장명을 입력해주세요.</div></div>';
       	  	  
       	  	  tags+='<div class="form-group">';
       	  	  tags+='<label for="businessNo">사업자 등록번호 : </label>';
       	  	  tags+='<input type="text" name="businessNo" id="businessNo" class="form-control" placeholder="Enter Your Business registration number" required>';
       	      tags+='<div class="valid-feedback"></div>';
    	  	  tags+='<div class="invalid-feedback">  사업자 등록번호를 입력해주세요.</div></div>';
    	  	  
    	      tags+='<div class="form-group">';
    	      tags+='<label for="uploadFile">사업장등록증 : </label>';
    		  tags+='<input type="file" name="uploadFile" id="uploadFile" class="form-control" placeholder="Upload Your Business Registration" required>';
       	      tags+='<div class="valid-feedback"></div>';
    	  	  tags+='<div class="invalid-feedback">  사업자 등록증을 업로드해주세요.</div></div>';
    	  	  
    		  tags+='<hr style="width: 454px; float:left;"><br>';
    		  $(".classification:input[value='ROLE_MEMBER']").prop("checked", false);//일반회원 체크라디오버튼 풀림
    	  }else{
    		  tags='';
    		  $(".classification:input[value='ROLE_MANAGER']").prop("checked", false);//일반 체크시 사장체크 풀림
    	  }
    	  $("#managerInfo").html(tags); //위의 tags를 동적으로 생성
      });// end classification
   	  
   	  
   	  // 주소 팝업
   	  $("#goToAddrAPIBtn").click(function() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              $("#address").val(data.address);
	          }//oncomplete
	      
	      }).open();

	});// end goToAddrAPIBtn

	//전화번호 문자 입력 불가 & 길이제한
    $("#tel").keyup(function() {
       var telValue=$(this).val().trim();
         
         if(telValue.length<3||telValue.length>11){
              $("#telResult").html("전화번호는 3~11자 이내로 작성해주세요").css("color","red");
              checkTel="";
              return;
           } else {
              if(isFinite(telValue) == false){
                   $("#telResult").html("문자는 입력하실 수 없습니다.").css("color","red");
                   checkTel="";
                }else{
                   $("#telResult").html("사용가능한 번호입니다.").css("color","green");

                   checkTel=telValue;
                }
           }
    });//end tel keyup 

    /* 중복 확인 공간 */   
    $("#registerForm").submit(function() {
  	  // 아이디 중복확인해서 사용가능 상태일때만 가입되도록 한다.
       if(checkId==""){
          alert("아이디를 확인해주세요!");
          return false;
       }
  	  
       // 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
       if(checkNick==""){
           alert("닉네임을 확인해주세요!");
           return false;
        }
       
       // 비밀번호 일치 여부 체크해서 사용가능 상태일때만 가입되도록 한다.
       if(checkPassword==""){
           alert("비밀번호를 확인해주세요!");
           return false;
        }
       
       //전화번호 문자 입력 시 alert
       if(checkTel==""){
           alert("전화번호를 확인해주세요!");
           return false;
        }
    }); // end registerForm submit
    
});//ready
</script>
</head>
<body>
<div class="container shadow-sm p-4 mb-4 bg-white" style="width: 500px; float: center;">
  <h2>회원가입</h2>
  <hr style="width: 300px; float:left;"><br><br>
  <form method="post" action="${pageContext.request.contextPath}/register-user.do" class="was-validated" id="registerForm" enctype="multipart/form-data">
  <sec:csrfInput/>
    <div class="form-group">
      <label for="memberId">아이디 : </label>
      <input type="text" name="id" id="memberId" class="form-control" placeholder="Enter Id" required>
      <div class="valid-feedback"><span id="idCheckResult"></span></div>
      <div class="invalid-feedback">  아이디를 입력해주세요.</div>
    </div>
    <div class="form-group">
      <label for="passwordC">비밀번호 : </label>
      <input type="password" name="password" id="passwordC" class="form-control" placeholder="Enter password" required>
      <div class="valid-feedback"><span id="passwordResult"></span></div>
      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>
    <div class="form-group">
      <label for="passwordChecked">비밀번호 확인 : </label>
      <input type="password" id="passwordChecked" class="form-control"placeholder="Enter password for checking" required>
	      <div class="valid-feedback"><span id="passwordCheckResult"></span></div>
	      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>
    
    <hr style="width: 454px; float:left;"><br><br>
    
    <div class="form-group">
      <label for="userName"> 이름 : </label>
      <input type="text" name="name" id="userName" class="form-control" placeholder="Enter your name" required>
	      <div class="valid-feedback"></div>
	      <div class="invalid-feedback">  이름을 입력해주세요.</div>
    </div>
    
    <div class="form-group">
       <label for="memberNick"> 닉네임 : </label>
      <input type="text" name="nickname" id="memberNick" class="form-control" placeholder="Enter your nickname" required>
	      <div class="valid-feedback"><span id="nickCheckResult"></span></div>
	      <div class="invalid-feedback">  닉네임을 입력해주세요.</div>
    </div>
    
    <div class="form-group">
       <label for="tel"> 휴대전화 번호 : </label>
       <input type="text" name="tel"  id="tel" class="form-control" placeholder="Enter your phone number(숫자로만 입력해주세요)" required>
	      <div class="valid-feedback"><span id="telResult"></span></div>
	      <div class="invalid-feedback">  휴대전화 번호를 입력해주세요.</div>
    </div>
   
    <div class="form-group">
       <label for="address"> 주소 : <button type="button" class="btn btn-warning btn-sm" id="goToAddrAPIBtn">주소 검색하기</button></label>
        <input type="text" name="address" id="address" onkeydown="return false;" style="caret-color: transparent !important;" required class="form-control"  
       	 size=80  placeholder="'주소검색'을 통해 입력해주세요" required>
	      <div class="valid-feedback"></div>
	      <div class="invalid-feedback">  주소를 입력해주세요.</div>

    </div>
    
    <hr style="width: 454px; float:left;"><br>
    
    
    <label class="radioMember">회원 구분</label><br>
	<div class="form-check-inline">
		<label class="form-check-label" for="radioMember">
   			<input type="radio" class="classification" id="radioMember" value="ROLE_MEMBER" checked>일반
   		</label>
	</div>
 		
   	<div class="form-check-inline">	 
   		<label class="form-check-label" for="radioManager">
        	<input type="radio" class="classification" id="radioManager" value="ROLE_MANAGER">사장
    	</label>
    </div>
    
    <hr style="width: 454px; float:left;"><br>

 	<div id="managerInfo"></div>	
 	<div style="text-align:center;">
		<input type="submit" value="회원가입" class="btn btn-primary">
	</div>
  </form>
  
</div><!-- container -->
</body>
</html>