<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역검색 결과</title>
<script type="text/javascript">
	$(document).ready(function(){

		//셀렉트 옵션으로.
		var number = 2; // 기존에 처음 셀렉트폼(우선순위1)은 존재하므로 2부터 시작
		var pri_num = 1; // 처음 셀렉트폼(우선순위1, '#cafeFilter1')부터 옵션값을 받아와야 되므로
		var arrIndex = 0;
		var dictProperty={'taste':'맛', 'price':'가격', 'service':'서비스', //dictionary 사전자료형
								'mood':'분위기', 'diversity':'다양한 메뉴'};
		
		$("#selectFilter").on("change",".cafeFilter",function(){ //셀렉트폼의 옵션이 변경될 때  
			var arrOption = ['null', 'null', 'null']; //ajax처리를 위한 배열 선언
			var option = $('#cafeFilter' + pri_num +' option:selected').val();//셀렉트폼의 선택된 옵션 값(dictionary의 key값)
			arrOption[arrIndex]=option; //선택된 옵션 배열에 추가
			
			$.ajax({//선택된 옵션으로 카페리스트 정렬
				type:"get",
				data:"loc=${param.loc}&arrOption="+arrOption,
				dataType:"json",
				url:"${pageContext.request.contextPath}/cafe-list-sort-by-property.do",
				success:function(cafeList){
					var tags='';
					for(var i=0;i<cafeList.length;i++){
						if(i%2==0){
							tags+="<div class='col-sm-6' style='margin-top: 10px'>";
							tags+="<strong>" + i + "</strong><a href='#' class='cafeName'>"+cafeList[i].cafeVO.cafeName+"</a>";
							tags+="<input type='hidden' value='"+cafeList[i].cafeVO.cafeNo+"'>";
							tags+="<div class='fakeimg'><img src='#' width='250' height='250'></div>";
							tags+="</div>";
						}else{
							tags+="<div class='col-sm-6' style='margin-top: 10px'>";
							tags+="<strong>" + i + "</strong><a href='#' class='cafeName'>"+cafeList[i].cafeVO.cafeName+"</a>";
							tags+="<input type='hidden' value='"+cafeList[i].cafeVO.cafeNo+"'>";
							tags+="<div class='fakeimg'><img src='#' width='250' height='250'></div>";
							tags+="</div>";
						}
						$("#cafeList").html();
						$("#cafeList").html(tags);
					}
				
				}//success
			});//ajax

			var tags='';
			if (number <= 3 && pri_num <= 3){
				delete dictProperty[option];	//셀렉트폼에서 선택된 값 사전에서 삭제
				tags+='&nbsp&nbsp&nbsp&nbsp';
				tags+='<select class="cafeFilter" id="cafeFilter' + number + '" required="required">';
				tags+='<option value="">--' + number + '순위--</option>';
				for(key in dictProperty) {	//동적으로 생성된 셀렉트폼의 옵션값을 dictionary에서 받아옴 
					tags+='<option value="' + key + '">' + dictProperty[key] + '</option>';
				}	
				tags+=' </select>';
				$("#selectFilter").append(tags); //옵션값 동적으로 추가
				
				//alert(Object.keys(dictProperty)); //사전에 들어있는 키값 확인
				number++; // 다음 셀렉트폼을 선택하기 위하여 값 증가
				pri_num++; // 다음 옵션값을 선택하기 위하여 값 증가
				arrIndex++;
			}
			if(number == 4 || pri_num == 4){
				tags+='';
			}
			
		});//#selectFilter
				 
		//카페이름 클릭시 카페 간략정보 표현하는 ajax
 		$("#cafeList").on("click", ".cafeName", function(){
			var cafeNo=$(this).next().val();
			$.ajax({
				type:"get",
				dataType:"json",
				url:"${pageContext.request.contextPath}/cafe-simple.do",
				data:"cafeNo=" + cafeNo,
				success:function(cafeTotal){
					var tag="";
					tag +='<h2>' + cafeTotal.cafeVO.cafeName + '<span id="myPickStar"><a href="#" id="myPickIcon" ><i class="fas fa-star fa-2x" style="color:#ffc93c"></i></a></span></h2>';		
					tag +='<div class="fakeimg">';		
					tag +='<img src="#" width="500" height="300">';			
					tag +='</div>';			
					tag +='<table class="table cafeSimple">';		
					tag +='<tr>';		
					tag +='<td>위치</td>';		
					tag +='<td>' + cafeTotal.cafeVO.cafeLoc + '</td>';			
					tag +='</tr><tr>';				
					tag +='<td>운영시간</td>';				
					tag +='<td>';			
					tag +='평일 : ' + cafeTotal.weekdayTime + '<br>';			
					tag +='주말 : ' + cafeTotal.weekendTime + ' | 공휴일 : ' + cafeTotal.holidayTime;				
					tag +='</td></tr>';				
					tag +='<tr>';				
					tag +='<td colspan="2" align="center"><button id="cafeDetail">카페 상세정보 보기</button></td>';				
					tag +='</tr>';				
					tag +='</table>';			
					$("#cafeSimple").html(tag);
				}
			}); //ajax
		});//on 
		
	});//ready
</script>
</head>
<body>
<div class="container">
	<h4>선호 포인트</h4>
	<p>선호 하는 요소를 선택해주세요!</p>
	   <!-- 선호 요소 선택 부분 -->
   
   <div class="row">
   <div class="col-sm-7">
     	<div id="selectFilter">
	      <select class="cafeFilter" id="cafeFilter1" required="required">
	      	<option value="">--1순위--</option>
	        <option value="taste">맛</option>
	        <option value="price">가격</option>
	        <option value="service">서비스</option>
	        <option value="mood">분위기</option>
	        <option value="diversity">메뉴의 다양성</option>
	      </select>
      	</div>
    <%-- <div id="likeButton">				<!-- 버튼으로 -->
      <button type="button" id="taste" class="likePoint" value="taste">맛</button>
      <button type="button" id="price" class="likePoint" value="price">가격</button>
      <button type="button" id="serivce" class="likePoint" value="service">서비스</button>
      <button type="button" id="mood" class="likePoint" value="mood">분위기</button>
      <button type="button" id="diversity" class="likePoint" value="diversity">다양한 메뉴</button>
     </div>
      <p>1순위</p>
      <span id="1st">
      
      </span>
      <br>
      <p>2순위</p>
      <span id="2nd">
      
      </span>
      <br>
      <p>3순위</p>
      <span id="3rd">
      
      </span>
      <br>  --%>
     </div><!-- 우선순위 영역 -->
   
   <!-- 지도 나타나는 부분 -->
   <div class="col-sm-5">
      지<br>
      도<br>
      가<br>
      들어<br>
      갈<br>
      자리<br>
      <br><br><br><br>
   </div><!-- 지도 영역 -->
   </div><!-- row 1 -->
 
 
  
   <div class="row">
   <div class="col-sm-7"><!-- 카페 리스트 부분 -->
   
      <h3>검색 결과</h3>
      
      <div class="row cafeList" id="cafeList">
      <c:forEach items="${cafeList}" var="list" varStatus="order">
         <c:choose>
            <c:when test="${order.count % 2 == 1}">
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  <a href="#" class="cafeName">${list.cafeVO.cafeName}</a>
                  <input type="hidden" value="${list.cafeVO.cafeNo}">
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                  </div>
               </div>   
            </c:when>
            <c:otherwise>
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  <a href="#" class="cafeName">${list.cafeVO.cafeName}</a>   
                  <input type="hidden" value="${list.cafeVO.cafeNo}">
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      
      </div>
   </div><!-- 카페 리스트 부분 -->

   <!-- 카페 간략정보 영역 -->
   <div class="col-sm-4">
	   <!-- 카페 간략정보 표시 -->
	   <p id="cafeSimple"></p>
   </div><!-- 카페 간략정보 영역 -->
      	
  </div><!-- 아래쪽 영역 row -->
  
</div><!-- container -->
</body>   
</html>