<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인하기</title>
<script type="text/javascript">
	function findPassPopup(){
		var options='width=450, height=450, top=150, left=500'; //팝업창 옵션
		window.open("${pageContext.request.contextPath}/find-password-form.do", "findPassPopup", options);
	}
</script>
</head>
<body>
	<br>
	<div class="container" style="width: 500px; float: center;">
  <h2>로그인</h2>
  <hr style="width: 300px; float:left;"><br><br>
  <form method="post" action="${pageContext.request.contextPath}/login.do" class="was-validated" id="loginForm" enctype="multipart/form-data">
  <sec:csrfInput/>
    <div class="form-group">
       아이디 : 
      <input type="text" name="id"  class="form-control" placeholder="Enter Id" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  아이디를 입력해주세요.</div>
    </div>
    <div class="form-group">
     비밀번호 :
      <input type="password" name="password" class="form-control" placeholder="Enter password" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  비밀번호를 입력해주세요.</div>
    </div>

    <hr style="width: 480px; float:left;"><br>


	<input type="submit" value="로그인" class="btn btn-primary" style="float:center;">
	<input type="button" value="비밀번호 찾기" class="btn btn-danger" onclick="findPassPopup()" style="float:center;">
  </form>
  
</div><!-- container -->
</body>
</html>