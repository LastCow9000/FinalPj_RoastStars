<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<script type="text/javascript">
	alert("권한이 없거나, 세션이 만료되었습니다.\n다시 로그인 후 이용해주세요.");
	location.href="${pageContext.request.contextPath}/home.do";
</script>
