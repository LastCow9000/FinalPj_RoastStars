<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- <script type="text/javascript">
var name =<sec:authentication property="principal.name"/>;
	alert(name+"님 카페등록되었습니다.");
	location.href="home.do";
</script> -->
</head>
<body>
<%-- <sec:authentication property="principal.name"/>님 회원탈퇴되었습니다. --%>
${cafeOperVO } 
</body>
</html>

