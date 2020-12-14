<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminDetail</title>
<script type="text/javascript">

	$(document).ready(function(){
		
		//권한 추가
		$(".grantAuthority").on("click", "#addAuthorityBtn", function(){
			var id=$(this).parent().parent().children("td:nth-child(1)").text();
			var authority=$(this).parent().parent().children("td:nth-child(6)").children().val();

			$.ajax({
				type:"POST",
				data:"id=" + id + "&authority=" + authority,
				url:"${pageContext.request.contextPath}/grant-authority.do",
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(result){
					if(result=="true"){
						alert("권한 부여 성공!");
					}else{
						alert("권한 부여 실패!");
					}
					location.reload();
				}
				
			});//end ajax
		});//end on(권한추가)
		
		//이미지 클릭시 확대보기
		$(document).on("click","img",function(e){
			var path = $(this).attr('src')
			var img = $(this).next().val();
			showImage("resources/upload/"+img);
		});//end click
		$(".bigPictureWrapper").on("click", function(e){
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    setTimeout(function(){
		      $('.bigPictureWrapper').hide();
		    }, 1000);
		  });//end bigWrapperClick
		function showImage(fileCallPath){
		    $(".bigPictureWrapper").css("display","flex").show();
		    $(".bigPicture")
		    .html("<img src='"+fileCallPath+"' >")
		    .animate({width:'100%', height: '100%'}, 1000);
		  }//end function
		  
	});//end ready
</script>
</head>
<body>
	
	<!-- 성호 : 네비 : 시작 -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" href="#">등급관리</a></li>
		<%--   <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath}/beanspick-detail-form.do">Bean's Pick관리</a>
  </li> --%>
	</ul>
	<%-- 성호 : 네비 : 종료 --%>
	<%-- 성호 : 등급테이블 : 시작 --%>
	<form class="grantAuthority">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">이름</th>
					<th scope="col">사업명</th>
					<th scope="col">사업자등록번호</th>
					<th scope="col">사업자등록증</th>
					<th scope="col">등급</th>
					<th scope="col">권한 부여</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lvo" items="${lvo.userList}">
					<tr>
						<td>${lvo.userVO.id}</td>
						<td>${lvo.userVO.name}</td>
						<td>${lvo.userVO.businessName}</td>
						<td>${lvo.userVO.businessNo}</td>	
						<td class="img"><a href="#" id="businessImg"><img src="resources/upload/${lvo.userVO.businessPic}" width="150" height="150"/>
						<input type="hidden" id="businessImg" value="${lvo.userVO.businessPic}"></a>
						<div class="bigPictureWrapper">
							<div class="bigPicture"></div>
						</div>
						</td>
						<td><select name="authority" id="getUserPositionList">
								<option value="">등급</option>
								<c:forEach items="${authorList}" var="auth">
									<option value="${auth}">${auth}</option>
								</c:forEach>
							</select>
						<input type="hidden" id="id" value="${lvo.userVO.id}">
						</td>
						<td><button type="button" id="addAuthorityBtn">권한 추가</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
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
    <ul class="pagination pagination-sm justify-content-center">
    <c:if test="${pb.previousPageGroup}">   
       <li><a href="${pageContext.request.contextPath}/admin-detail.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
    </c:if>
    
    <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
       <c:choose>
          <c:when test="${pb.nowPage!=i}">
          <li><a href="${pageContext.request.contextPath}/admin-detail.do?pageNo=${i}">${i}</a></li> 
          </c:when>
          
          <c:otherwise>
          <li class="active"><a href="#">${i}</a></li>
          </c:otherwise>
       </c:choose>
       &nbsp; 
    </c:forEach>
    
    <c:if test="${pb.nextPageGroup}">   
       <li><a href="${pageContext.request.contextPath}/admin-detail.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
    </c:if>
    </ul>          
    
    </div><!-- 페이징 바 -->
		<hr>
</body>
</html>




