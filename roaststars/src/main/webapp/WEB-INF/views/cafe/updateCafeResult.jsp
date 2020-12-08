<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
alert("${cafeOperVO.cafeVO.cafeName }카페정보가 수정되었습니다.");
location.href="${pageContext.request.contextPath}/update-cafelist.do";
</script>
