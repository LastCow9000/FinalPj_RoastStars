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
 	 // 주소 팝업	
 	  $("#goToAddrAPIBtn").click(function() {
	      new daum.Postcode({
	          oncomplete: function(data) {
	              $("#address").val(data.address);
	          }//oncomplete 
	      }).open();
	});//goToAddrAPIBtn
	/* 공휴일 운영 안함 체크 시, 공휴일 운영시간에 '운영 안 함' 할당하기*/
	   $("#noOperating").click(function() {
	      //alert($(this).val());
	      $('#holidayTimeCheck').val($(this).val());
	   });//noOperating
 	 $("#updateCafeForm").submit(function() {
    		if(confirm("잘못된 정보를 입력할 경우 그대로 입력되니 주의하시길 바랍니다.")){
    			return true;
    		}else
    			return false;
    });
 	$(".classification").change(function(){ //라디오 버튼 변화 시
 	 	  var tags='';
 	 	  if( $(this).val() == "open"){	//사장 체크 시 
 	 		  alert("공휴일에도 일을 한다구?!");
 	 		  tags+='<input type="text" name="weekendTime" class="timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM~HH:MM" maxlength="12"/>';
 	 		  $(".classification:input[value='closed']").prop("checked", false);//일반회원 체크라디오버튼 풀림
 	 	  }else{
 	 		  tags='';
 	 		  $(".classification:input[value='open']").prop("checked", false);//일반 체크시 사장체크 풀림
 	 	  }
 	 	  $("#managerInfo").html(tags); //위의 tags를 동적으로 생성
 	   });
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
<form method="post" action="${pageContext.request.contextPath}/update-cafe.do" id="updateCafeForm" enctype="multipart/form-data">
<input type="hidden" name="command" value="register">
<input type="hidden" name="cafeNo" value="${cafeVO.cafeNo}">

	<sec:csrfInput/>
	카페명: <input type="text" name="cafeName" value="${cafeVO.cafeName }" required="required"><br>
	위치: <input type="text" name="cafeLoc" id="address" value="${cafeVO.cafeLoc }" required="required" size=70><button type="button" class="btn" id="goToAddrAPIBtn">주소 검색하기</button>	<br>
	카페사진 <input type="file" name="uploadFile" value="${cafeVO.cafePic} " required="required">
	전화번호 <input type="text" name="cafeTel" value="${cafeVO.cafeTel }" required="required"><br>
	정보:<textarea rows="10" cols="120"  placeholder="본문 내용을 입력하세요" name="cafeInfo" required="required"></textarea>
	  운영시간<br> 
  평일<input type="text" name="weekdayTime" class="timeBox"  onKeyup="inputTimeColon(this);" placeholder="HH:MM~HH:MM" maxlength="12" /><br>
주말<input type="text" name="weekendTime" class="timeBox" onKeyup="inputTimeColon(this);" placeholder="HH:MM~HH:MM" maxlength="12"/><br>
공휴일
<div class="form-check-inline">
		<label class="form-check-label" for="radioMember">
      			<input type="radio"  name="holidayTime" class="classification" id="radioClosed" value="closed" checked>운영안함
    		</label>
 		</div>
    	<div class="form-check-inline">	 
   		<label class="form-check-label" for="radioManager">
        	<input type="radio" class="classification" id="radioOpen" value="open">운영함
    	</label>
    </div>
    
<div id="managerInfo"></div>
	
<input  type="submit" value="등록하기">
</form>
</body>
</html>