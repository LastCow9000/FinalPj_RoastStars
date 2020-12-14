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
	
	$("#menu-btn").click(function() {
		var cafeNo = $(this).prev().val();
		//alert(cafeNo);
		 var updateMenuName = $("#updateMenuName").val();
		 var updateMenuPrice = $("#updateMenuPrice").val();
		   $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/updateMenu-Ajax.do",
	            data : "cafeNo="+cafeNo+"&menuName="+updateMenuName+"&menuPrice="+updateMenuPrice,
	            beforeSend : function(xhr){   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result) {
	                if (result == "ok"){
	         			alert("추가되었습니다.");	
		            	location.reload();
		            	$("#asdf").html(tags);
	               }
	               else{
	            	   alert("실패");
	            	}//else 
	               
	            }//ajax1 success
	         
	         });//ajax1 
	});//click
});
</script>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/update-menuAjax.do" id="updateMenuForm" enctype="multipart/form-data">
<sec:csrfInput/>
<div class="asdf"></div>
<input type="hidden" name="command" value="update">
   메뉴명: <input type="text" name="menuName" id="updateMenuName" placeholder="메뉴명(ICE) or 메뉴명(HOT)" required="required" size=30><span id="nameCheckResult"></span><br>
   가격: <input type="text" name="menuPrice" id="updateMenuPrice" required="required" size=30 placeholder="가격은 숫자로만 입력해주세요."><br>
  <!-- 메뉴사진 <input type="file" name="uploadFile">
  <input type="hidden" name="menuName" value="이름">
 <input type="hidden" name="menuPrice" value="가격">  -->
 
<input type="hidden" name="cafeNo" value="${cafeNo}">
<input  type="button" id="menu-btn" value="등록하기">
</form>
</body>
</html>