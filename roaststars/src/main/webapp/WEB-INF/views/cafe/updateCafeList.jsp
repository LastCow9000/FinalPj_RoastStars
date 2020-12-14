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
	            }//ajax1 success
	         });//ajax1
	         
			
	});// end document click
	
     // 카페 수정 시 한번 묻기
     $("#updateCafeInfoForm").submit(function() {
   		return confirm("카페 정보를 수정하시겠습니까?");
	});//end updateCafeInfoForm


     // 카페 삭제 시 한번 묻기
     $("#deleteCafeInfoForm").submit(function() {
 	   		return confirm("카페 정보를 삭제하시겠습니까?");
	});//end deleteCafeInfoForm

});// end ready
</script>
</head>
<body>
<table class="table table-hover">
<thead>
	<tr>
		<th scope="col">카페명</th>
		<th scope="col">카페 주소</th>
		<th scope="col">카페 전화번호</th>
		<th colspan="2">수정 | 삭제</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.cafeName}</td>
			<td>${list.cafeLoc}</td>
			<td>${list.cafeTel}</td>
			<td>
				<%-- 수정버튼 --%>
            	<button type="submit" class="btn btn-info btn-sm" form="updateCafeInfoForm">수정하기</button>
				
				<%-- 수정 폼 --%>
				<form method="POST" action="${pageContext.request.contextPath}/update-cafe-form.do" id="updateCafeInfoForm">
					<sec:csrfInput/>
					<input type="hidden" name="cafeNo" value="${list.cafeNo}">
				 </form>
			</td>
			<td>
				<%-- 삭제버튼 --%>
            	<button type="submit" class="btn btn-danger btn-sm" form="deleteCafeInfoForm">삭제하기</button>

				<%-- 삭제 폼 --%>
				<form method="POST" action="${pageContext.request.contextPath}/delete-cafe.do" id="deleteCafeInfoForm">
					<sec:csrfInput/>
					<input type="hidden" name="cafeNo" value="${list.cafeNo}">
				 </form> 
			</td>
		</tr>
	</c:forEach>
</tbody>	
</table>

</body>
</html>