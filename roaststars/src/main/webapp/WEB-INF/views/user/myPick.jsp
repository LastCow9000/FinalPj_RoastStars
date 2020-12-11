<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPickList</title>
<script type="text/javascript">
	$(document).ready(function(){
		<%--문젱ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ --%>
		//마이픽 삭제
		$(".myPickStar").on("click", "#myPickIcon",function(){
			var pickNo=$(this).parent().next().val();
			$.ajax({
				type:"post",
				data:"pickNo="+pickNo,
				dataType:"text",
				url:"${pageContext.request.contextPath}/my-pick-delete.do",
				beforeSend : function(xhr){   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
                	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(result){
						alert(1212);
				}//end function
			});//end ajax
		});//end star click
		
	}); //end ready
</script>
</head>
<body>
<h2>My Pick</h2>
<hr>
<div class="myPickrow">
	<c:forEach items="${lvo.myPickList}" var="myPickVO">
		<div class="card" style="width:358px">
			<div class="card-header">
				<h4 class="card-title" style="font-weight:bold">${myPickVO.cafeVO.cafeName}
				<span class="myPickStar"><a href="#" id="myPickIcon" ><i class="fas fa-star fa-2x" style="color:#ffc93c"></i></a></span>
				<input type="hidden" id="pickNo" value="${myPickVO.pickNo}">
				</h4>
			</div>
			<img class="card-img-top" src="resources/upload/${myPickVO.cafeVO.cafePic}" style="height:205px">
			<div class="card-body">
				<p class="card-text">주소 : ${myPickVO.cafeVO.cafeLoc}</p>	
				<p class="card-text">전화번호 : ${myPickVO.cafeVO.cafeTel}</p>
				<div style="text-align: center">
					<a href="${pageContext.request.contextPath}/cafe-detail.do?cafeNo=${myPickVO.cafeVO.cafeNo}" class="btn btn-primary">카페 상세정보</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
	
</body>
</html>

<%--
	<span id="myPickStar"><a href="#" id="myPickIcon" ><i class="fas fa-star fa-2x" style="color:#ffc93c"></i></a></span>
	<span id="myPickStar"><a href="#" id="myPickIcon" ><i class="far fa-star fa-2x" style="color:#ffc93c"></i></a></span>
--%>