<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#menu-btn").click(function() {
		var cafeNo = $(this).prev().val();
		var tags='';
		var updateMenuName = $("#updateMenuName").val().trim();
		var updateMenuPrice = $("#updateMenuPrice").val().trim();	
		   $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/updateMenu-Ajax.do",
	            data : "cafeNo="+cafeNo+"&menuName="+updateMenuName+"&menuPrice="+updateMenuPrice,
	            //dataType : "json",
	            beforeSend : function(xhr){
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result) {
	     		   		tags+='<tr><td>';
	     		   		tags+=result.menuName
	     		   		tags+='</td><td>';
	     		   		tags+=result.menuPrice
	     		    	tags+='</td></tr>';
	     		    $(".menuInfo").html(tags); 	
	     		       location.reload();
	            }//ajax1 success
	     
	         });//ajax1 
		   
	});//click
	$(document).on("click", "#del-btn", function() {
		var cafeNo = $(this).prev().val();//상위에 있는 값 불러오기
		
		//var menuName = $(this).parent().parent().parent().children("td:nth-child(1)").text();
		var menuName = $(this).val();
		 <%-- $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/deleteCafe-Ajax.do",
	            data : "cafeNo="+cafeNo+"&menuName",
	            beforeSend : function(xhr){   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result) {
	                if (result == "ok"){
	         			alert("삭제되었습니다.");	
		            	location.reload();
	               }
	               else{
	            	   
	            	}//else 
	               
	            }//ajax1 success
	         
	         });//ajax1 --%>
	});//on
	
	var checkName="";
	var cafeNo = ${cafeNo};
    /* 길이 체크 공간 */
    
    // 1. 메뉴명 길이 체크
    $("#updateMenuName").keyup(function() {
    	checkName="";
       var nameValue= $(this).val().trim();
      /*  alert(nameValue);
       alert(cafeNo); */
       // 메뉴명 길이 체크
      if(nameValue.length<5||nameValue.length>12){
          $("#nameCheckResult").html("메뉴는 5~12자 이내로 작성해주세요").css("color","violet");
          return;
       }
         
       // 메뉴명 중복 체크
       $.ajax({
          type : "get",
          url : "${pageContext.request.contextPath}/menuName-checkAjax.do",
          data : "menuName="+nameValue+"&cafeNo="+cafeNo,
          success : function(result) {
             // 아이디가 사용가능하면 = 중복이 아니면
             if (result == "ok"){
                $("#nameCheckResult").html("사용가능한 메뉴명입니다.").css(
                      "color", "blue");
                checkId = idValue; 
             } else { // 아이디가 사용불가하면 = 중복이면
                $("#nameCheckResult").html("중복된 메뉴명입니다.").css(
                      "color", "red");
             }
          }//success
       });//ajax
    });//keyup
   <%--
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
	              $("#address").val(data.address);
	          }//oncomplete
	      
	      }).open();
		
	});//goToAddrAPIBtn
	--%>

});
</script>
</head>
<body>

<table>
<tr><td>메뉴명</td><td>가격</td><td>비고</td></tr>
<c:forEach items="${menuList}" var="menuList">
<div class="menuInfo"></div>

<tr><td class="menuName">${menuList.menuName }</td><td>${menuList.menuPrice}</td>
 <td>
		<form method="get" action="${pageContext.request.contextPath}/update-cafeform.do">
			<input type="hidden" name="command" value="updateCafe">
			<input type="hidden" name="cafeNo" value="${cafeNo}">
			<input type="submit" value="수정하기">
		 </form>
	</td>
<td>
		<form method="POST" action="${pageContext.request.contextPath}/delete-menu.do">
			<sec:csrfInput/>
			<input type="hidden" name="command" value="deleteCafe">
			<input type="hidden" name="cafeNo" value="${cafeNo}">
			<%-- <input type="hidden" name="menuName" value="${menuList.menuName}"> --%>
			<%-- <input type="button" id="del-btn" value="삭제하기"> --%>
			<button type="button" id="del-btn" value="${menuList.menuName}" >삭제하기</button>	
		 </form> 
</td> 
</tr>
</c:forEach>
</table>
<hr>

<form method="post" action="${pageContext.request.contextPath}/update-menuAjax.do" id="updateMenuForm" enctype="multipart/form-data">
<sec:csrfInput/>
   메뉴명: <input type="text" name="menuName" id="updateMenuName" placeholder="메뉴명(ICE) or 메뉴명(HOT)" required="required" size=30><span id="nameCheckResult"></span><br>
   가격: <input type="text" name="menuPrice" id="updateMenuPrice" required="required" size=30 placeholder="가격은 숫자로만 입력해주세요."><br>
 메뉴사진 <input type="file" name="uploadFile">
  <input type="hidden" name="menuName" value="이름">
 <input type="hidden" name="menuPrice" value="가격"> 
 <input type="hidden" name="cafeNo" value="${cafeNo}">
<input  type="button" id="menu-btn" value="등록하기">
</form>
 
</body>
</html>