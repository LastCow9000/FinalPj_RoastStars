<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>  
<sec:authorize access="hasRole('ROLE_MEMBER')">
	<sec:authentication property="principal.id" var="loginId"/>
</sec:authorize>    
<script type="text/javascript">
	alert("카페정보가 수정되었습니다.");
	location.href="cafe-detail.do?id=${loginId}&cafeNo=${cafeNo}";
</script>
