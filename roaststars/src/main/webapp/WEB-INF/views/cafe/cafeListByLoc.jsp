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
		//선호요소 선택시 카페리스트 필터링
		
		/*			버튼으로 구현하다 만 것
		$("#likeButton").on("click",".likePoint",function(){
			//alert($(this).val());
			var buttonVal = $(this).val();
			if(buttonVal=='taste')
				buttonVal='맛';
			else if(buttonVal=='price')
				buttonVal='가격';
			else if(buttonVal=='service')
				buttonVal='서비스';
			else if(buttonVal=='mood')
				buttonVal='무드';
			else if(buttonVal=='diversity')
				buttonVal='다양한 메뉴';
			$("#1st").html('<input type="button" class="movedLikePoint" id=buttonVal value='+buttonVal+'>');
			
			//if($("#1st").)
			$(this).remove();
			$(".movedLikePoint").click(function(){
				$("#likeButton").append('<input type="button" class="likePoint" id=buttonVal value='+buttonVal+'>');
				$(this).remove();
			});// .movedLikePoint click
		});// .likePoint click*/
			
		//셀렉트 옵션으로.
		var number = 2;
		var pri_num = 1;
		$("#selectFilter").on("change",".cafeFilter",function(){
			//alert($(this).val());
			var dictProperty={'taste':'맛', 'price':'가격', 'service':'서비스', 
								'mood':'분위기', 'diversity':'다양한 메뉴'};
			//var dicLen= Object.keys(dictProperty).length;
			
			var option='';			
			var chosenPropertyVal = $('#cafeFilter' + pri_num +' option:selected').val();
			alert(chosenPropertyVal);
			
			var tags='';
			if (number <= 3 && pri_num <= 3){
				tags+='&nbsp&nbsp&nbsp&nbsp';
				tags+='<select class="cafeFilter" id="cafeFilter' + number + '" required="required">';
				tags+='<option value="">--' + number + '순위--</option>';
				for(key in dictProperty) {
					tags+='<option value="' + key + '">' + dictProperty[key] + '</option>';
				}	
				tags+=' </select>';
				$("#selectFilter").append(tags);
				option = chosenPropertyVal;
				delete dictProperty[option];
				alert(Object.keys(dictProperty));
				//$('#cafeFilter' + (number) + ' option[value=' + option + ']').remove();
				number++;
				pri_num++;
			}

			
		});//#selectFilter
				
		//카페이름 클릭시 카페 간략정보 표현하는 ajax
		$(".cafeName").click(function(){
			var cafeNo=$(this).next().val();
			$.ajax({
				type:"get",
				dataType:"json",
				url:"${pageContext.request.contextPath}/cafe-simple.do",
				data:"cafeNo=" + cafeNo,
				success:function(cafeVO){
					var tag="";
					tag +='<div class="col-sm-5">';
					tag +='<div class="row" style="margin-top: 10px">';
					tag +='<h2>' + cafeVO.cafeName + '*끝에 별표</h2>';		
					tag +='<div class="fakeimg">';		
					tag +='<img src="#" width="500" height="300">';			
					tag +='</div>';			
					tag +='<table class="table cafeSimple">';		
					tag +='<tr>';		
					tag +='<td>위치</td>';		
					tag +='<td>' + cafeVO.cafeLoc + '</td>';			
					tag +='</tr><tr>';				
					tag +='<td>운영시간</td>';				
					tag +='<td>';			
					tag +='평일 : ' + cafeVO.cafeOperatingTimeVO.weekdayTime + '<br>';			
					tag +='주말 : ' + cafeVO.cafeOperatingTimeVO.weekendTime + ' | 공휴일 : ' + cafeVO.cafeOperatingTimeVO.holidayTime;				
					tag +='</td></tr>';				
					tag +='<tr>';				
					tag +='<td colspan="2" align="center"><button id="cafeDetail">카페 상세정보 보기</button></td>';				
					tag +='</tr>';				
					tag +='</table>';			
					tag +='</div>';			
					tag +='</div>';				
					$("#cafeSimple").html(tag);
				}
			}); //ajax
		});//click
		
	});//ready
</script>
</head>
<body>
<div class="container">
<h4>선호 포인트</h4>
<p>선호 하는 요소를 선택해주세요!</p>
   <!-- 선호 요소 선택 부분 -->
   
   <div class="col-sm-7">
     <div class="row">
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
     </div>
   </div>
 
   
   <!-- 지도 나타나는 부분 -->
   <div class="col-sm-5">
      <div class="row">
      지<br>
      도<br>
      가<br>
      들어<br>
      갈<br>
      자리<br>
      <br><br><br><br><br><br><br><br>
      </div>
   </div>

   <!-- 카페 리스트 부분 -->
   <div class="col-sm-7">
      <div class="row">
      <h3>검색 결과</h3>
      
      <c:forEach items="${cafeList}" var="list" varStatus="order">
         <c:choose>
            <c:when test="${order.count % 2 == 1}">
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  <a href="#" class="cafeName">${list.cafeName}</a>
                  <input type="hidden" value="${list.cafeNo}">
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                  </div>
               </div>   
            </c:when>
            <c:otherwise>
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  <a href="#" class="cafeName">${list.cafeName}</a>   
                  <input type="hidden" value="${list.cafeNo}">
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                  </div>
               </div>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      
      </div>
   </div>
   <!-- 카페 간략정보 표시 -->
   <p id="cafeSimple"></p>
      	
</div><!-- container -->
</body>   
</html>