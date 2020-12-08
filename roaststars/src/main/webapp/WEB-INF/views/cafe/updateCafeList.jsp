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
	
	$(document).on("click", "#del-btn", function() {
		var cafeNo = $(this).prev().val();//상위에 있는 값 불러오기
		//alert(cafeNo);
		  $.ajax({
	            type : "post",
	            url : "${pageContext.request.contextPath}/deleteCafe-Ajax.do",
	            data : "cafeNo="+cafeNo,
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
	});
});
</script>
</head>
<body>
<table>
<tr>
	<td>카페명</td><td>카페위치</td><td>카페전화번호</td>
	<td></td>
	</tr>
<c:forEach items="${list }" var="list">
	
	<tr>
	<td>${list.cafeName }</td><td>${list.cafeLoc }</td><td>${list.cafeTel }</td>
	<td>
		<form method="get" action="${pageContext.request.contextPath}/update-cafeform.do">
		<sec:csrfInput/>
		<input type="hidden" name="command" value="updateCafe">
		<input type="hidden" name="cafeNo" value="${list.cafeNo}">
		<input type="submit" value="수정하기">
		 </form>
	</td>
	<td>
	<form method="get" action="${pageContext.request.contextPath}/delete-cafe.do" id="delete">
		<input type="hidden" name="command" value="deleteCafe">
		<input type="hidden" name="cafeNo" value="${list.cafeNo}">
		<input type="button" id="del-btn" value="삭제하기">	
		 
		<sec:csrfInput/>
		 </form> 
	</td>
	</tr>
</c:forEach>
</table>
</body>
</html>