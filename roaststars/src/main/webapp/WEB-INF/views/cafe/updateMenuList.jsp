<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	var cafeNo = ${cafeNo};
	
	$("#menu-btn").click(function() {
		var updateMenuName = $("#updateMenuName").val();
		var updateMenuPrice = $("#updateMenuPrice").val();
		var UpdateEspresso = $("#updateMenuForm :radio[name=espresso]:checked()").val();
        
		// 100원 단위 아닐 때 submit 막기
		if((updateMenuPrice%100)!=0){
           alert("가격은 100원단위로 입력해주세요!!");
           return false;
        }//if 
	      else {
		   $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/updateMenu-Ajax.do",
	            data : "cafeNo="+cafeNo+"&menuName="+updateMenuName+"&menuPrice="+updateMenuPrice
	          		  +"&espresso="+UpdateEspresso,
	            beforeSend : function(xhr){   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result) {
	                if (result){
	         			alert("메뉴가 추가되었습니다.");	
		            	location.reload();
		            	//$("#menuInfo").html(tags);
	               }
	               else{
	            	   alert("메뉴 추가가 실패되었습니다.");
	            	}//else 
	            }//ajax1 success
	         });//ajax1 
        }//else
	});//click
	
	$("#updateMenuName").keyup(function() {
        checkName="";
        var nameValue= $(this).val().trim();
        
        // 메뉴명 길이 체크
        if(nameValue.length<5||nameValue.length>20){
           $("#nameCheckResult").html("메뉴명은 5~20자 이내로 작성해주세요").css("color","red");
           return;
        }
        // 메뉴명중복 체크
        $.ajax({
           type : "get",
           url : "${pageContext.request.contextPath}/menuName-checkAjax.do",
           data : "menuName="+nameValue+"&cafeNo="+cafeNo,
           success : function(result) {
              if (result == "ok"){
                 $("#nameCheckResult").html("사용가능한 메뉴명입니다.").css(
                       "color", "green");
                 checkName = nameValue; 
              } else { 
                 $("#nameCheckResult").html("중복된 메뉴명입니다.").css(
                       "color", "red");
              }
           }//success
        });//ajax 
     });// end updateMenuName keyup
     
     
    // 메뉴 100원 단위 아닐 때, 밑에 span 영역에 글자 띄우기 
    $("#updateMenuPrice").keyup(function() {
        var priceValue=$(this).val().trim();
        if((priceValue%100) !=0){
           $("#priceCheckResult").html("가격은 100원단위로 작성해주세요").css("color","red");
           return ;
        }else{
           $("#priceCheckResult").html("사용가능한 가격입니다.").css("color","green");
        }
   }); // end updateMenuPrice keyup
     
 
   /* 중복 확인 공간 */   
   $("#menu-btn").click(function() {
 	  // 아이디 중복확인해서 사용가능 상태일때만 가입되도록 한다.
      if(checkName==""){
         alert("메뉴명를 확인해주세요!");
         return false;
      }   
   }); // end registerForm submit 
   
   $(document).on("click", "#del-btn", function() {
	   if (confirm("해당 메뉴를 삭제하시겠습니까?")){
	   var menuName = $(this).prev().val();
		 $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/deleteMenu-Ajax.do",
	            data : "cafeNo="+cafeNo+"&menuName="+menuName,
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
	         });//ajax1  
	   }
	});
});
</script>
</head>
<body>
<div class="container" style="width: 500px; float: center;">
  <h2>메뉴 추가하기</h2>
  <hr style="width: 300px; float:left;"><br><br>
  <form method="post" action="${pageContext.request.contextPath}/updateMenu-Ajax.do" class="was-validated" id="updateMenuForm" enctype="multipart/form-data">
  <sec:csrfInput/>
  	<div class="form-group">
  	 종류 선택<br>
  	 	<input type="radio" name="espresso" value="1" checked> COFFEE &nbsp;&nbsp;&nbsp;
  	 	<input type="radio" name="espresso" value="0"> NON COFFEE
  	</div>
    
    <div class="form-group">
       메뉴명 : 
      <input type="text" name="menuName" id="updateMenuName"  class="form-control" placeholder="메뉴명(ICE) or 메뉴명(HOT)" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">메뉴를 입력해주세요.</div>
      <span id="nameCheckResult"></span>
    </div>
    
    <div class="form-group">
     메뉴가격 :
      <input type="text" name="menuPrice" id="updateMenuPrice" class="form-control" placeholder="가격은 숫자로만 입력해주세요." required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  가격을 입력해주세요.</div>
      <span id="priceCheckResult"></span>
    </div>

    <hr style="width: 480px; float:left;"><br>

	<input type="button" value="추가하기" class="btn btn-primary" id="menu-btn" style="float:center;">
	
  </form>
  
</div><!-- container -->
<hr>
<c:choose>
<%-- 등록된 메뉴가 있는 경우 : 메뉴 리스트를 보여준다 --%>
<c:when test="${menuList.size() > 0}">
<table class="table table-hover">
<thead>
   <tr>	
      <th scope="col">종류</th>
      <th scope="col">메뉴명</th>
      <th scope="col">메뉴가격</th>
      <th colspan="2">삭제</th>
   </tr>
</thead>
<tbody>
   <c:forEach items="${menuList}" var="list">
      <tr>
         <td>
         	<c:choose>
         	<c:when test="${list.espresso=='1'}">
         		COFFEE
         	</c:when>
         	<c:otherwise>
         		NON-COFFEE
         	</c:otherwise>
         	</c:choose>
       	</td>
         <td>${list.menuVO.menuName}</td>
         <td>${list.menuVO.menuPrice}원</td>
         <td>
            <%-- 삭제 폼 --%>
            <form method="POST" action="${pageContext.request.contextPath}/deleteMenu-Ajax.do">
               <sec:csrfInput/>
               <input type="hidden" name="cafeNo" value="${list.menuVO.menuName}">
               <input type="button" class="btn btn-danger btn-sm" id="del-btn" value="삭제하기">
             </form> 
         </td>
      </tr>
   </c:forEach>
</tbody>   
</table>
</c:when>

<%-- 등록된 메뉴가 없는 경우 --%>
<c:otherwise>
	<div class="container" style="width:100%; text-align: center;">
		<h3>등록된 메뉴가 없습니다.</h3>
		<h3>상단에서 카페의 메뉴를 등록해주세요!</h3>
	</div>
</c:otherwise>

</c:choose>
<hr>
</body>
</html>