<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역검색 결과</title>
</head>
<body>
<h4>선호 포인트</h4>
<p>선호 하는 요소를 선택해주세요!</p>
<div class="container">

   <!-- 선호 요소 선택 부분 -->
   <div class="col-sm-7">
     <div class="row">
      <select name="cafeFilter1" id="cafeFilter1" required="required">
      <option value="">--1순위--</option>
         <option value="taste">맛</option>
         <option value="price">가격</option>
         <option value="service">서비스</option>
         <option value="mood">분위기</option>
         <option value="diversity">메뉴의 다양성</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;
         
      <select name="cafeFilter2" id="cafeFilter2" required="required">
      <option value="">--2순위--</option>
         <option value="taste">맛</option>
         <option value="price">가격</option>
         <option value="service">서비스</option>
         <option value="mood">분위기</option>
         <option value="diversity">메뉴의 다양성</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;
      
      <select name="cafeFilter3" id="cafeFilter3" required="required">
      <option value="">--3순위--</option>
         <option value="taste">맛</option>
         <option value="price">가격</option>
         <option value="service">서비스</option>
         <option value="mood">분위기</option>
         <option value="diversity">메뉴의 다양성</option>
      </select>
      
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
      </div>
     </div>

   <!-- 카페 리스트 부분 -->
   <div class="col-sm-7">
      <div class="row">
      <h3>검색 결과ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ</h3>
      
      <c:forEach items="${cafeList}" var="list" varStatus="order">
         <c:choose>
            <c:when test="${order.count % 2 == 1}">
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  ${list.cafeName}
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                     </div>
                  ${list.cafeNo}
                  ${list.cafeLoc}
                  ${list.cafePic}
                  ${list.cafeInfo}
                  ${list.userVO.id}
               </div>   
            </c:when>
            <c:otherwise>
               <div class="col-sm-6" style="margin-top: 10px">
                  <strong>${order.count}</strong> <!-- count -->
                  ${list.cafeName}   
                  <div class="fakeimg">
                        <img src="#"
                             width="250" height="250">
                     </div>
                  ${list.cafeNo}
                  ${list.cafeLoc}
                  ${list.cafePic}
                  ${list.cafeInfo}
                  ${list.userVO.id}
               </div>
            </c:otherwise>
         </c:choose>
      </c:forEach>
      
      
      <!-- <div class="col-sm-3">
         헤헤헤헤<Br>
         동욱이<br>
         ㅋㅋㅋㅋㅋ
      </div>
      <div class="col-sm-offset-1 col-sm-3">
         헤헤헿헤<Br>
         예울이<br>
         ㅎㅎㅎㅎㅎㅎ
      </div> -->
      </div>
   </div>
   
   <!-- 카페 간략 정보 부분 -->
   <div class="co-sml-5">
      <div class="row">
      <h3>카페간략정보들어갈자리</h3>
      </div>
   </div>
</div>
</body>   
</html>