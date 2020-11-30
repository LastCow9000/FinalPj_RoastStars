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
<h4>중요도를 선택해주세요</h4>
<div class="row">
   <div class="col-sm-7">
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
   <div class="col-sm-5">
      지<br>
      도<br>
      가<br>
      들어<br>
      갈<br>
      자리<br>
   </div>
</div>
<div class="row">
   <div class="col-sm-7">
   <h3>검색 결과ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ2</h3>
      <c:forEach items="${cafeList}" var="list" varStatus="order">
         <c:choose>
            <c:when test="${order.count % 2 == 1}">
               ${list.cafeNo}
               ${list.cafeName}
               ${list.cafeLoc}
               ${list.cafePic}
               ${list.cafeInfo}
               ${list.userVO.id}
               
               &nbsp;&nbsp;&nbsp;
            </c:when>
            
            <c:when test="${order.count % 2 == 0}">
               ${list.cafeNo}
               ${list.cafeName}
               ${list.cafeLoc}
               ${list.cafePic}
               ${list.cafeInfo}
               ${list.userVO.id}
               <br><br>
            </c:when>
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
   <div class="co-sml-5">
      <h3>카페간략정로들어갈자리</h3>
   </div>
</div>
</body>
</html>