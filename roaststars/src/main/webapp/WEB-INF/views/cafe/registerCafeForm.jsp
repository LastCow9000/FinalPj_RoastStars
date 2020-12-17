<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페등록폼</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
    .timeBox {
        text-align:center;
        width:200px;    
    }
</style>
<script type="text/javascript">

/* 길이 체크 공간 */

$(document).ready(function() {
	
   var checkName="";
   var checkInfo="";
   var checkTel="";
   
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
   });// end registCafeName keyup
   
   // 본문 길이 체크
   $("#cafeInfo").keyup(function() {
	   checkInfo = "";
	   var infoValue = $(this).val().trim();
	   
	   //본문 길이 200자 넘어가면 빨갛게
       if(infoValue.length > 200){
           $("#infoCheckResult").html(infoValue.length).css("color","red");
           return;
        //본문 길이 평소에는 grey로
        } else {
           $("#infoCheckResult").html(infoValue.length).css("color","grey");
           checkInfo = infoValue;
        }
   });// end registCafeName keyup
   
   
   //전화번호 문자 입력 불가 & 길이제한
   $("#cafeTel").keyup(function() {
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
	}); //end cafeTel keyup
   
    
   /* 길이 넘었을 때 submit 안 되도록 막기 */
   $("#registerCafeForm").submit(function() {
	   // 제목 길이 체크
      if(checkName == ""){
         alert("상호명은 10자 이내로 작성해주세요.");
         return false;
      } 
	   // 본문 길이 체크
      if(checkInfo == ""){
          alert("카페 소개는 200자 이내로 작성해주세요.");
          return false;
       } 
	   
      //전화번호 문자 입력 시 alert
      if(checkTel==""){
          alert("전화번호를 확인해주세요.");
          return false;
       }
      
      if(confirm("잘못된 정보를 입력할 경우 그대로 입력되니 주의하시길 바랍니다.")){
 			return true;
 		}else{
 			return false;
 		}
   });//sumit
   
   /* 공휴일 운영 안함 체크 시, 공휴일 운영시간에 '운영 안 함' 할당하기*/
   $("#noOperating").click(function() {
      //alert($(this).val());
      $('#radioClosed').val($(this).val());
   });//noOperating
   
   
   $(".classification").change(function(){ //라디오 버튼 변화 시
 	  var tags='';
 	  if( $(this).val() == "open"){	//사장 체크 시 
 		  alert("공휴일에도 일을 한다구?!");
 		  tags+='<input type="text" name="holidayTime" class="timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM~HH:MM" maxlength="12"/>';
 		  $(".classification:input[value='closed']").prop("checked", false);//일반회원 체크라디오버튼 풀림
 	  }else{
 		  tags='';
 		  $(".classification:input[value='open']").prop("checked", false);//일반 체크시 사장체크 풀림
 	  }
 	  $("#managerInfo").html(tags); //위의 tags를 동적으로 생성
   });
// 주소 팝업
	  $("#goToAddrAPIBtn").click(function() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              $("#address").val(data.address);
	          }//oncomplete
	      
	      }).open();
		
	});//goToAddrAPIBtn

	 /* 길이 넘었을 때 submit 안 되도록 막기 */
	   $("#registerCafeForm").submit(function() {
	      if(checkName == ""){
	         alert("상호명은 10자 이내로 작성해주세요.");
	         return false;
	      }
	    //전화번호 문자 입력 시 alert
	      if(checkTel==""){
	          alert("전화번호를 확인해주세요!");
	          return false;
	       }
	   });//sumit
	
});//ready

function inputTimeColon(time) {
    // replace 함수를 사용하여 콜론( : )을 공백으로 치환한다.
    var replaceTime = time.value.replace(/\:/g, "");
    // replace 함수를 사용하여 콜론( ~ )을 공백으로 치환한다.
    var replaceTime2 = replaceTime.replace(/\~/g, "");
    // 텍스트박스의 입력값이 8~9글자 사이가 되는 경우에만 실행한다.
    if(replaceTime2.length >= 8 && replaceTime2.length < 9) {
        var hours = replaceTime2.substring(0, 2);      // 선언한 변수 hours에 시간값을 담는다.
        var minute = replaceTime2.substring(2, 4);    // 선언한 변수 minute에 분을 담는다.
         var hours2=replaceTime2.substring(4, 6);
        var minute2 = replaceTime2.substring(6, 8);   
        // isFinite함수를 사용하여 문자가 선언되었는지 확인한다.
        if(isFinite(hours + minute) == false) {
            alert("문자는 입력하실 수 없습니다.");
            time.value = "00:00~00:00";
            return false;
        }
        if(isFinite(hours2 + minute2) == false) {
            alert("문자는 입력하실 수 없습니다.");
            time.value = "00:00~00:00";
            return false;
        }
        // 두 변수의 시간과 분을 합쳐 입력한 시간이 24시가 넘는지를 체크한다.
        if(hours + minute > 2400) {
            alert("시간은 24시를 넘길 수 없습니다.");
            time.value = "00:00~24:00";
            return false;
        }
        if(hours2 + minute2 > 2400) {
            alert("시간은 24시를 넘길 수 없습니다.");
            time.value = "00:00~24:00";
            return false;
        }
        // 입력한 분의 값이 60분을 넘는지 체크한다.
        if(minute > 60) {
            alert("분은 60분을 넘길 수 없습니다.");
            time.value = hours + ":00"+"~" + hours2 + ":00";
            return false;
        }
        if(minute2 > 60) {
            alert("분은 60분을 넘길 수 없습니다.");
            time.value = hours + ":00" +"~"+ hours2 + ":00";
            return false;
        }
        if(hours + minute>hours2 + minute2){
           alert("오픈시간이 마감시간보다 늦습니다. 다시한번 확인해주세요");
            return false;

        }
        time.value = hours + ":" + minute + "~" + hours2 + ":" + minute2;
    }
}
</script>
</head>
<body>
<div class="container" style="width: 800px; float: center;">
  <h2>카페 등록하기</h2>
<form method="post" action="${pageContext.request.contextPath}/register-cafe.do" 
		id="registerCafeForm" enctype="multipart/form-data">
	<input type="hidden" name="command" value="register">
	<sec:csrfInput/>
	<table class="table table-sm">
		<thead></thead>
		<tbody>
			<tr>
				<td>카페명</td>
				<td colspan=2><input type="text" name="cafeName" size=50 id="registCafeName" placeholder="카페명을 입력해주세요" required>&nbsp;<span id="nameCheckResult"></span>/10</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan=2><input type="text" name="cafeLoc" id="address" onkeydown="return false;" style="caret-color: transparent !important;" required size=50 placeholder="주소 검색으로 주소를 입력해주세요" onkeydown="return false;" style="caret-color: transparent !important;" required>&nbsp;
  				<button type="button" class="btn btn-sm btn-warning" id="goToAddrAPIBtn">주소 검색하기</button></td>

			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan=2><input type="text" name="cafeTel" id="cafeTel" required placeholder="전화번호를 숫자로만 입력해주세요" size=50 >
				&nbsp;<span id="telResult"></span></td>
			</tr>
			<tr>
				<td>카페사진</td>
				<td colspan=2>
					<div class="input-group mb-1">
				   	<input type="file" class="form-control" name="uploadFile" id="inputGroupFile02" size=50>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<textarea rows="7" cols="100" placeholder="카페에 대한 소개를 입력해주세요!" id="cafeInfo" 
						 name="cafeInfo" required></textarea><br>
					<span id="infoCheckResultSpan"><span id="infoCheckResult"></span>/200</span>
				</td>
			</tr>
			<tr>
				<td rowspan="4">운영시간</td>
			</tr>
			<tr>
				<td>평일</td>
				<td colspan="2">
					<input type="text" name="weekdayTime" class="timeBox" onKeyup="inputTimeColon(this);" required placeholder="HH:MM~HH:MM" maxlength="12" />
				</td>
			</tr>
			<tr>
				<td>주말</td>
				<td colspan="2">
					<input type="text" name="weekendTime" class="timeBox" onKeyup="inputTimeColon(this);" required placeholder="HH:MM~HH:MM" maxlength="12"/>
				</td>
			</tr>
			<tr>
				<td>공휴일</td>
				<td colspan="2">
					<div id="managerInfo"></div>
					<div class="form-check-inline">
				      <label class="form-check-label" for="radioMember">
		              	<input type="radio"  name="holidayTime" class="classification" id="radioClosed" value="closed" checked>운영안함
				      </label>
				    </div>
				    <div class="form-check-inline">    
		         		<label class="form-check-label" for="radioManager">
				       	  <input type="radio" name="radioHolidayTime" class="classification" id="radioOpen"  value="open" onKeyup="inputTimeColon(this);" placeholder="HH:MM~HH:MM" maxlength="12"/>운영함
				    	</label>
				    </div>
				</td>
			</tr>
			
			<tr>
				<td colspan="3" align="center">
					<input type="submit" class="btn btn-success" value="등록하기">
				</td>
			</tr>
		</tbody>

	</table>
	
	
</form>
</div><!-- container -->
</body>
</html>