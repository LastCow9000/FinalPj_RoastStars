<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
			alert("비밀번호가 변경되었습니다.\n다시 로그인해주세요.");
			$("#logoutForm").submit();
	});
</script>
</head>
<body>			
<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post"
		style="display: none">
	<sec:csrfInput/>
</form> 
</body>
</html>

