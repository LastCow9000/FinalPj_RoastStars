<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제 결과</title>
<script type="text/javascript">
	$(document).ready(function() {
			alert("탈퇴되었습니다.");
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

