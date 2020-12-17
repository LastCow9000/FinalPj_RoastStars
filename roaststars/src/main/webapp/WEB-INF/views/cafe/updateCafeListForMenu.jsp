<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 메뉴 관리</title>
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
<div class="container"  style="width: 800px; margin-top: 20px; float: center;">
<table class="table table-hover">
<thead>
	<tr>
		<th scope="col">카페명</th>
		<th scope="col">카페 주소</th>
		<th scope="col">메뉴 관리</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.cafeName}</td>
			<td>${list.cafeLoc}</td>
			<td>
				<%-- 메뉴 관리 버튼 --%>
				<form method="get" action="${pageContext.request.contextPath}/update-menuList.do">
					<input type="hidden" name="cafeNo" value="${list.cafeNo}">
					<input type="submit" class="btn btn-sm btn-success"value="메뉴목록">	
				 </form> 
			</td>
		</tr>
	</c:forEach>
</tbody>	
</table>
</div>
</body>
</html>