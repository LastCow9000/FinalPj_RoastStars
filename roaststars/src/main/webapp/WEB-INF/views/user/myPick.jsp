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
					if(result == 'ok')
						location.reload();
				}//end function
			});//end ajax
		});//end star click
		
	}); //end ready
</script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.id" var="loginId"/>
</sec:authorize>

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
<div class="pagingInfo">
    <%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
    <c:set var="pb" value="${lvo.pagingBean}"/>
    <!-- 
          step2 1) 이전 페이지 그룹이 있으면 화살표 보여준다
               	    페이징빈의 previousPageGroup 이용 
                2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
                hint)   startPageOfPageGroup-1 하면 됨        
     -->  
    <!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
                2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
                   	현 페이지이면 링크를 처리하지 않는다.  
                   PagingBean의 nowPage
                   jstl choose 를 이용  
                   예) <a href="DispatcherServlet?command=list&pageNo=...">               
     -->    
    <ul class="pagination pagination-sm">
    <c:if test="${pb.previousPageGroup}">   
       <li><a href="${pageContext.request.contextPath}/my-pick-list.do?id=${loginId}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
    </c:if>
    
    <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
       <c:choose>
          <c:when test="${pb.nowPage!=i}">
          <li><a href="${pageContext.request.contextPath}/my-pick-list.do?id=${loginId}&pageNo=${i}">${i}</a></li> 
          </c:when>
          <c:otherwise>
          <li class="active"><a href="#">${i}</a></li>
          </c:otherwise>
       </c:choose>
       &nbsp; 
    </c:forEach>
    
    <c:if test="${pb.nextPageGroup}">   
       <li><a href="${pageContext.request.contextPath}/my-pick-list.do?id=${loginId}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
    </c:if>
    </ul>          
</div><!-- 페이징 바 -->
	<hr>
	
</body>
</html>
