<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

   $(document).ready(function() {
      var checkId="";
      var checkNick="";
      /* 길이 체크 공간 */
      
      // 1. 아이디 길이 체크
      $("#memberId").keyup(function() {
         checkId="";
         var idValue= $(this).val().trim();
         // 아이디 길이 체크
         if(idValue.length<4||idValue.length>10){
            $("#idCheckResult").html("아이디는 4~10자 이내로 작성해주세요").css("color","violet");
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
                        "color", "blue");
                  checkId = idValue; 
               } else { // 아이디가 사용불가하면 = 중복이면
                  $("#idCheckResult").html("중복된 아이디입니다.").css(
                        "color", "red");
               }
            }//success
         });//ajax
      });//keyup
      
      // 2. 닉네임 길이 체크
        $("#memberNick").keyup(function() {
         checkNick="";
         var nickValue= $(this).val().trim();
         // 닉네임 길이 체크
         if(nickValue.length<2||nickValue.length>7){
            $("#nickCheckResult").html("닉네임은 2~7자 이내로 작성해주세요").css("color","violet");
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
                        "color", "blue");
                  checkNick = nickValue; 
                  //alert($(this).text());
               } else { // 닉네임 사용불가하면 = 중복이면
                  $("#nickCheckResult").html("중복된 닉네임입니다.").css(
                        "color", "red");
               }
            }
         });
      });//keyup    
   /* 중복 확인 공간 */   
      // 아이디 중복확인해서 사용가능 상태일때만 가입되도록 한다.
      $("#registerForm").submit(function() {
         if(checkId==""){
            alert("아이디를 확인해주세요!");
            return false;
         }
      });   
      // 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
        $("#registerForm").submit(function() {
         if(checkNick==""){
            alert("닉네임을 확인해주세요!");
            return false;
         }
      }); 
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
      
   	  //3. 회원구분 라디오 버튼 
      $(".classification").change(function(){ //라디오 버튼 변화 시
    	  var tags='';
    	  if( $(this).val() == "ROLE_MANAGER"){	//사장 체크 시 
    		  alert("관리자가 확인 후 사장 권한이 부여됩니다.");
    		  tags+='사업장명 <input type="text" name="businessName"><br>';
    		  tags+='사업자등록번호<input type="text" name="businessNo"><br>';
    		  tags+='사업자등록증<input type="file" name="uploadFile"><br>';
    		  $(".classification:input[value='ROLE_MEMBER']").prop("checked", false);//일반회원 체크라디오버튼 풀림
    	  }else{
    		  tags='';
    		  $(".classification:input[value='ROLE_MANAGER']").prop("checked", false);//일반 체크시 사장체크 풀림
    	  }
    	  $("#managerInfo").html(tags); //위의 tags를 동적으로 생성
      });
   	  
   	  
   	  // 주소 팝업
   	  $("#goToAddrAPIBtn").click(function() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	              // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	              $("#address").val(data.address);
	          }//oncomplete
	      
	      }).open();
		
	});//goToAddrAPIBtn
	
   });//ready
   

</script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/register-user.do" id="registerForm" enctype="multipart/form-data">
	<sec:csrfInput/>
	아이디 <input type="text" name="id" id="memberId" required="required"><span id="idCheckResult"></span><br>
	패스워드 <input type="password" name="password" id="passwordC" required="required"><span id="passwordCheckResult"></span><br>
	패스워드확인 <input type="password" id="passwordChecked" required="required"><span id="passwordCheckResult"></span><br>
	이름 <input type="text" name="name" required="required"><br>
	닉네임 <input type="text" name="nickname" id="memberNick" required="required"><span id="nickCheckResult"></span><br>
	전화번호 <input type="text" name="tel" required="required"><br>
	주소 <input type="text" name="address" id="address" value="" required="required" size=80>&nbsp;<button class="btn" id="goToAddrAPIBtn">주소 검색하기</button><br>
	상세주소 <input type="text" name="address"><br>
	회원구분
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
 	<br>
 	<div id="managerInfo"></div>	
	<input  type="submit" value="회원가입" class="btn btn-primary">
</form>
</body>
</html>