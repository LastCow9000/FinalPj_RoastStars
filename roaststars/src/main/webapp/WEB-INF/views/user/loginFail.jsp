<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	<%-- spring security(MemberAuthenticationProvider)에서 throws 한 예외 메세지를 보여준다  --%>
	alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	location.href="home.do";
</script>