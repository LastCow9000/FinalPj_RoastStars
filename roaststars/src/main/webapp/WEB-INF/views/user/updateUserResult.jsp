<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
//var name =<sec:authentication property="principal.name"/>;
	alert("${cafeOperVO}님 정보수정되었습니다.");
	location.href="home.do";
</script>