<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<%-- cafeNo도 변수에 담는다. --%>
<c:set var="cafeNo" value="${cafeTotal.cafeVO.cafeNo}"/>
<%-- 리뷰에서 쓸 cafeName도 변수에 담는다. --%>
<c:set var="cafeName" value="${cafeTotal.cafeVO.cafeName}"/>
<%-- 관리자 아이디 변수에 담기 --%>
<sec:authorize access="hasRole('ROLE_ADMIN')" var="adminId"/>
<%-- 로그인 아이디(세션) --%>
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication var="loginUser" property="principal.id"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>카페 상세보기</title>
<script type="text/javascript">
	$(document).ready(function() {
		           	   
		/* 한줄평 수정 시 길이 체크 공간 */
		var checkContent="";
		// 1. 리뷰 내용 부분에 입력을 시작하면 댓글 길이 나옴   
		$("#registerReviewForm").on("keyup","#reviewContent",function(){
			checkContent="";
			overLengthContent = "";
			var reviewContentVal  =  $("#reviewContent").val().trim();
			//한줄평 내용 길이 50자 넘어가면 빨갛게
			if(reviewContentVal.length > 50){
				$("#reviewContentLen").html(reviewContentVal.length).css("color","red");
				overLengthContent = reviewContentVal;
				return;
				//한줄평 내용 길이 평소에는 grey로
			} else {
				$("#reviewContentLen").html(reviewContentVal.length).css("color","grey");
				checkContent = reviewContentVal; //이 경우에만 입력된 내용을 checkContent에 할당해줌
			}
		});//keyup
		                 
		// 2. 리뷰 부분 클릭하면 기존 리뷰 길이 나옴	
		$("#reviewContent").mouseenter(function() {
			var reviewContentVal = $(this).val().trim();
			//한줄평 길이 20자 넘어가면 빨갛게
			if(reviewContentVal.length > 50){
				$("#reviewContentLen").html(reviewContentVal.length).css("color","red");
			//한줄평 길이 평소에는 grey로
			}else {
				$("#reviewContentLen").html(reviewContentVal.length).css("color","grey");
			}
		});//click
		
		//리뷰 폼 submit (registerReviewForm)
		$("#registerReviewForm").submit(function() {
			//var formData=$("#registerReviewForm").serialize();
			//한줄평 50글자 초과일 때 (checkContent에 아무것도 할당되지 않았을 때), submit 제한
			if (checkContent == ""){
				alert("한줄평은 50자 이하로 작성해주세요.");
				$("#reviewContent").val(overLengthContent.substring(0, 50));// 51자부터 글자 all 삭제
				$("#reviewContent").focus();
				return false;
			}
		});//registerReviewForm
		  
		// 리뷰 삭제 시 한번 묻기
		$("#deleteReviewForm").submit(function() {
			return confirm("리뷰를 삭제하시겠습니까?");
		});//deleteReviewBtn
		
		//마이픽 추가
		$(document).on("click", "#halfMyPickIcon",function(){
			$.ajax({
				type:"post",
				data:"id=${loginUser}&cafeNo=${cafeNo}",
				url:"${pageContext.request.contextPath}/my-pick-add.do",
				beforeSend : function(xhr){   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
				success:function(addResult){
					if(addResult=="ok"){
						$(".myPickStar").html('<a href="#" id="fullMyPickIcon"><i class="fas fa-star fa-2x" style="color:#ffc93c"></i></a>');
					}else{
						return;
					}
				}//end function
			});//end ajax
		});//end star click
	
		//마이픽 삭제
		$(document).on("click", "#fullMyPickIcon",function(){
			var cafeNo=$("#detailCafeNo").val();
			$.ajax({
				type:"post",
				data:"id=${loginUser}&cafeNo=${cafeNo}",
				url:"${pageContext.request.contextPath}/my-pick-delete-by-id-cafeNo.do",
				beforeSend : function(xhr){   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
		        		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        	},
				success:function(delResult){
					if(delResult == 'ok'){
						$(".myPickStar").html('<a href="#" id="halfMyPickIcon" ><i class="far fa-star fa-2x" style="color:#ffc93c"></i></a>');
					}
				}//end function
			});//end ajax
		});//end star click
		
		//어드민용 카페 삭제
		$("#deleteCafe").click(function(){
			if(confirm("이 카페를 정말 삭제하시겠습니까?")){
				$.ajax({
					type:"POST",
					data:"cafeNo=${cafeNo}",
					url:"${pageContext.request.contextPath}/deleteCafe-Ajax.do",
					beforeSend : function(xhr){   //데이터를 전송하기 전에 헤더에 csrf값을 설정한다
		        		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		        	},
					success:function(delResult){
						alert("카페 정보 삭제 완료!");
						location.href="${pageContext.request.contextPath}/home.do";
					}
				});//end ajax
			}
		});//end deleteCafe click
		
	});//ready              
	function openReviewModal(){
		//현재 카페 정보
		var cafeNo = ${cafeNo};
		//현재 로그인한 아이디
		var loginId = '${loginUser}';
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/check-review-ajax.do",
			data:"id="+loginId + "&cafeNo="+cafeNo,
			success: function(result) {
				if(result === 1){
					alert("이미 리뷰를 등록하였습니다.");
					location.href="${pageContext.request.contextPath}/cafe-detail.do?id=${loginUser}&cafeNo="+cafeNo;
				}else{
					$('#registerReviewForm').modal('show');
				}//else
			}//success
		});//ajax
	}
</script>
</head>
<body>
<%-- 코드를 줄이기 위해 pb 변수에 pagingBean을 담는다. --%>
<c:set var="pb" value="${requestScope.lvo.pagingBean}"/>
   <div class="container" style="margin-top: 10px">
      <div class="row">
         <!-- 카페 상세정보 영역 -->
         <div class="col-sm-6">
            <div style="margin-top: 10px; margin-bottom: 0px;" class="shadow-sm p-4 mb-4 bg-white">
            &nbsp;<p id="cafeDetailCafeTitle" class="font-weight-bolder">${cafeTotal.cafeVO.cafeName}</p> 
            <sec:authorize access="hasRole('ROLE_MEMBER')">
            <c:if test="${flag==true}">
            	<span class="myPickStar"><a href="#" id="fullMyPickIcon" ><i class="fas fa-star fa-2x" style="color:#ffc93c"></i></a></span>
            </c:if>
            <c:if test="${flag==false}">
            	<span class="myPickStar"><a href="#" id="halfMyPickIcon" ><i class="far fa-star fa-2x" style="color:#ffc93c"></i></a></span>
            </c:if>
            </sec:authorize>
            <br>
            <div>
               <img src="resources/upload/${cafeTotal.cafeVO.cafePic}" alt="no image" width="473" height="300" style="margin-left: 3px; margin-top: 0px;">
            </div>
           	<pre class="cafe-detail-info" ><span>${cafeTotal.cafeVO.cafeInfo}</span></pre>
            <table class="table">
               <tr><td>전화번호</td><td>${cafeTotal.cafeVO.cafeTel}</td>
               </tr>
               <tr><td>운영시간</td><td>평일 : ${cafeTotal.weekdayTime} <br>
	                  주말 : ${cafeTotal.weekendTime} | 공휴일 : ${cafeTotal.holidayTime}</td>
               </tr>
               <tr><td>주소</td><td>${cafeTotal.cafeVO.cafeLoc}</td>
               </tr>
               <tr>
               	  <%-- 메뉴보기 모달 버튼 --%>
                  <td colspan="2" align="center"><button type="button" id="reviewModalBtn" class="btn btn-success" data-toggle="modal" data-target="#menuModal"><strong>메뉴 보기</strong></button></td>
               </tr>
               
               <sec:authorize access="hasRole('ROLE_ADMIN')">
   	             <tr>
   	             	<td colspan="2" align="center">
            	 		<button class="btn btn-danger" id="deleteCafe"><strong>이 카페 데이터 지우기</strong></button>
                 	</td>
                 </tr>
              </sec:authorize>
            </table>
        </div>
         
         <!-- 메뉴판 모달 영역 -->
		  <!-- The Modal -->
		  <div class="modal fade" id="menuModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">카페 <${cafeName}> 메뉴</h4>
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		        <c:choose>
		        <%-- 등록된 메뉴가 없을 때 --%>
		        <c:when test="${menuList.size()==0}">
		        	등록된 메뉴가 없습니다.
		        </c:when>
		        
  		        <%-- 등록된 메뉴가 있을 때 --%>
		        <c:otherwise>
		          <table class="table">
		          	<thead class="thead-dark">
		          		<tr>
		          			<th colspan="2">COFFEE</th>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<c:forEach items="${menuList}" var="menuTotal">
		          		<%-- 커피 메뉴 --%>
		          		<c:if test="${menuTotal.espresso == '1'}">
		          		<tr>
		          			<td>${menuTotal.menuVO.menuName}</td>
		          			<td>${menuTotal.menuVO.menuPrice}</td>
		          		</tr>
		          		</c:if>
		          		</c:forEach>
		          	</tbody>
                  </table>
                  
       		 	 <table class="table">
		          	<thead class="thead-dark">
		          		<tr>
		          			<th colspan="2">NON-COFFEE</th>
		          		</tr>
		          	</thead>
		          	<tbody>
		          		<c:forEach items="${menuList}" var="menuTotal">
		          		<%-- 논 커피 메뉴 --%>
		          		<c:if test="${menuTotal.espresso == '0'}">
		          		<tr>
		          			<td>${menuTotal.menuVO.menuName}</td>
		          			<td>${menuTotal.menuVO.menuPrice}</td>
		          		</tr>
		          		</c:if>
		          		</c:forEach>
		          	</tbody>
                  </table>
                </c:otherwise>
		        </c:choose>
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div><!-- 메뉴판 모달 영역 -->
		
		</div><!-- 카페 상세보기 영역 -->
		   
      
          <!-- 리뷰 영역 -->
           <div class="col-sm-5 offset-sm-1 reviewArea" style="margin-top: 30px">
           	<div style="margin-top: 10px; border-radius: 15px !important;" class="shadow-sm p-4 mb-4 bg-white">
           	  <p id="reviewTitle" class="font-weight-bolder">리뷰 (${reviewTotalCount})</p>
              
              <%--로그인한 사용자만 보여지도록 secure 처리 --%>
              <sec:authorize access="hasRole('ROLE_MEMBER')">
              <sec:authentication var="loginUser" property="principal.id"/>
              <%-- 카페의 사장아이디와 로그인한 사용자의 아이디가 같은 경우도 안보이기--%> 
              <c:if test="${cafeTotal.cafeVO.userVO.id != loginUser}">
              <span id="reviewRegisterBtn">
              	<a onclick="openReviewModal()" id="reviewBtn">
                 <i class="fas fa-pencil-alt fa-1x" style="color:#155263"></i>
           		      리뷰 작성하기 
             	</a>
              </span>
             </c:if>
            </sec:authorize>
            <br>
            
             <hr>
            
             <div class="col-sm-11" style="margin-top: 20px; margin-bottom: 20px; margin-left: 20px; margin-right: 10px;">
              <%-- 리뷰 테이블 영역 --%>
              <%-- <table class="table"> --%>
              <span class="reviewTable">
                <c:forEach items="${lvo.reviewList}" var="review">
                  	<div align="left" id="reviewTableInfo"><%-- 닉네임, 작성일시 (+삭제버튼) --%>
                   	
                   	<c:choose>
                   	
                   	  <c:when test="${adminId == true || review.userVO.id == loginUser}">
	                	  <span id="reviewTableInfo" style="float:left;">${review.userVO.nickname}
                     		&nbsp;
                     		<!-- 삭제 버튼 -->
                     		<button type="submit" class="deleteReviewBtn" form="deleteReviewForm" value="${review.reviewNo}">삭제</button></span>
                     		<!-- 삭제 form -->
							 <form action="delete-review.do" id="deleteReviewForm" method="POST">
							 	<sec:csrfInput/><%-- csrf 토큰 --%>
							 	<input type="hidden" name="reviewNo" value="${review.reviewNo}">	
							 	<input type="hidden" name="cafeNo" value="${cafeNo}">
							 	<input type="hidden" name="id" value="${loginUser}">
							 </form>
                   	  </c:when>
                   	  <c:otherwise>
              	  	      <span id="reviewTableInfo" style="float:left;">${review.userVO.nickname}</span>
                   	  </c:otherwise>
                   	  
                   	 </c:choose>
                     <span id="reviewTableInfo" style="float:right;">${review.reviewRegdate}</span>
                   	 </div><%-- 닉네임, 작성일시 (+삭제버튼) 끝 --%>
                   	 
                   	 <br>
                   	 
                   	 <div><%-- 리뷰 내용 --%> 
                    	  <p align="left" style="margin-top: 0px !important; padding: 0px !important; margin-bottom: 0px !important;">${review.reviewContent}</p>
                	 </div>
                	 
                	 <hr>
                </c:forEach>
              </span> <%-- 리뷰 테이블 영역 --%>
              
              <br>
              
              <div class="pagingInfo">
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
               <ul class="pagination pagination-sm pagination-warning justify-content-center">
               <c:if test="${pb.previousPageGroup}">   
                  <li class="page-item"><a href="${pageContext.request.contextPath}/cafe-detail.do?id=${loginUser}&cafeNo=${cafeNo}&pageNo=${pb.startPageOfPageGroup-1}" class="page-link">&laquo;</a></li>
	               &nbsp;
               </c:if>
               
               <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                  <c:choose>
                     <c:when test="${pb.nowPage!=i}">
                     <li class="page-item"><a href="${pageContext.request.contextPath}/cafe-detail.do?id=${loginUser}&cafeNo=${cafeNo}&pageNo=${i}" class="page-link">${i}</a></li> 
                     </c:when>
                     
                     <c:otherwise>
                     <li class="active page-item"><a href="#" class="page-link">${i}</a></li>
                     </c:otherwise>
                  </c:choose>
                  &nbsp; 
               </c:forEach>
               
               <c:if test="${pb.nextPageGroup}">   
                  <li class="page-item"><a href="${pageContext.request.contextPath}/cafe-detail.do?id=${loginUser}&cafeNo=${cafeNo}&pageNo=${pb.endPageOfPageGroup+1}" class="page-link">&raquo;</a></li>
               </c:if>
               </ul>          
               
               </div><!-- 페이징 바 -->
             
            </div> <!-- 리뷰테이블 영역 -->
            </div><!-- 리뷰 마진 -->
           </div><!-- 리뷰영역 -->
         
         
         <!-- 리뷰 작성 팝업(모달) -->
         <!-- The Modal -->
           <div class="modal fade" id="registerReviewForm">
             <div class="modal-dialog">
               <div class="modal-content">
               
                 <!-- Modal Header -->
                 <div class="modal-header">
                   <p class="modal-title" id="reviewTitle"><${cafeName}> 리뷰 작성</p>
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                 </div>
                 
                 <!-- Modal body -->
                <form action="register-review.do" method="POST" id="registerReviewForm">
                 <div class="modal-body">
                    <sec:csrfInput/><%-- csrf 토큰 --%>
                    <!-- cafeNo 보내기 -->
                    <input type="hidden" name="cafeNo" value="${cafeNo}"> 
                    <!-- 현재 로그인 중인 회원의 id 보내기 -->
                    <input type="hidden" name="id" value="${loginUser}">
                    
                    <!-- 리뷰 특성 선택 table -->
                      <table class="reviewForm">
                         <tr class="reviewTableProperty">
                            <td></td>
                            <td>좋아요! <i class="far fa-grin-hearts propertyIcon"></i></td>
                            <td>보통이에요 <i class="far fa-grin propertyIcon"></i></td>
                            <td>별로예요 <i class="far fa-angry propertyIcon"></i></td>
                         </tr>
                         
                         <tr></tr>
                         
                         <tr class="reviewTableProperty">
                            <td>맛</td>
                            <td><input type="radio" name="taste" value="1"></td>
                            <td><input type="radio" name="taste" value="0" checked></td>
                            <td><input type="radio" name="taste" value="-2"></td>
                         </tr>
                         
                         <tr class="reviewTableProperty">
                            <td>가격</td>
                            <td><input type="radio" name="price" value="1"></td>
                            <td><input type="radio" name="price" value="0" checked></td>
                            <td><input type="radio" name="price" value="-2"></td>
                         </tr>
                         
                        <tr class="reviewTableProperty">
                            <td>서비스</td>
                            <td><input type="radio" name="service" value="1"></td>
                            <td><input type="radio" name="service" value="0" checked></td>
                            <td><input type="radio" name="service" value="-2"></td>
                         </tr>
                         
                        <tr class="reviewTableProperty">
                            <td>분위기</td>
                            <td><input type="radio" name="mood" value="1"></td>
                            <td><input type="radio" name="mood" value="0" checked></td>
                            <td><input type="radio" name="mood" value="-2"></td>
                         </tr>
                         
                        <tr class="reviewTableProperty">
                            <td>다양한 메뉴</td>
                            <td><input type="radio" name="diversity" value="1"></td>
                            <td><input type="radio" name="diversity" value="0" checked></td>
                            <td><input type="radio" name="diversity" value="-2"></td>
                         </tr>
                         
                      </table>
                      
                      <!-- 한줄평 작성 -->
                      <hr>
                      <div style="margin-left: 20px; margin-right: 20px; ">
                         	한줄평 (<span id="reviewContentLen"></span>)<br>
                            <textarea name="reviewContent" id="reviewContent" class="form-control reviewContent" maxlength="50" 
                              cols="2" wrap="hard" required placeholder="한줄평을 작성해주세요"></textarea>
                      </div>
                 </div><!-- modal-body -->
                 
                 <!-- Modal footer -->
                 <div class="reviewSubmitBtn">
                   <button type="submit" class="btn btn-info btn-sm"><strong>리뷰 등록</strong></button>
                   &nbsp;
                   <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal"><strong>취소</strong></button>
                 </div><!-- modal-footer -->
                 
                 </form>
                 
               </div>
             </div>
           </div>
           
      </div><!-- row -->
   </div><!-- container -->
</body>
</html>