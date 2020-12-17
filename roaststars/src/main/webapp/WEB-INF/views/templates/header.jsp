<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<title>Header</title>

<script type="text/javascript">
	// 드롭다운에서 한 가지 영역 클릭하여 이동 시, 
	// 다시 드롭다운이 활성화되지 않는 오류를 해결하기 위해 jQuery 추가
	$(document).ready(function() {
	    $(".dropdown-toggle").dropdown();
	    $("#logoutAction").click(function() {
			$("#logoutForm").submit();
		});
	});
</script>

</head>
<%-- Header Start --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="home.do"><span class="border border-secondary"><strong>Roast Stars</strong></span></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/main-beansPick.do">Beans Pick</a></li>
			<sec:authorize access="hasRole('ROLE_MEMBER')">
			<sec:authentication property="principal.id" var="loginId"/>
			<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/my-pick-list.do?id=${loginId}">My Pick</a></li>
			</sec:authorize>
		</ul>

		<%--로그인 X 사용자 (인증X) --%>
		<div class="btn-group">
		<sec:authorize access="!hasAnyRole('ROLE_MEMBER','ROLE_MANAGER','ROLE_ADMIN')">
				<a href="register-form.do" role="button" class="btn btn-dark"><i class="fas fa-user-plus"></i> 회원가입</a>
				<a href="login-form.do" role="button" class="btn btn-dark"><i class="fas fa-sign-in-alt"></i> 로그인</a>
		</sec:authorize>
		</div>
		<%-- 로그인 O 사용자 (인증O) --%>
		<sec:authorize access="hasAnyRole('ROLE_MEMBER','ROLE_MANAGER')">

				<%-- 
			Spring Security를 이용하면 Authentication Bean 이 생성
			로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
			 --%>
				<span id="loginNicknameHeader"><sec:authentication property="principal.nickname"/>님</span>&nbsp; &nbsp;
				<div class="btn-group">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="${pageContext.request.contextPath}/admin-detail.do" role="button" class="btn btn-warning">관리자 페이지 </a>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_MANAGER')">
					<!-- Dropdown -->
						<a class="nav-link dropdown-toggle btn btn-dark" href="#" id="navbardrop" data-toggle="dropdown" role="button">
							<font size=3>내 카페 관리하기</font>
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${pageContext.request.contextPath}/register-cafeform.do">카페 등록</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/update-cafelist.do">카페 수정 | 삭제</a>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/view-cafelist-for-menu.do">메뉴 관리</a>
						</div>
					</sec:authorize>
					
					<sec:authorize access="!hasRole('ROLE_ADMIN')"> <%-- 관리자는 회원정보수정과 탈퇴하기가 불가 --%>
						<sec:authentication property="principal.id" var="loginId"/>
						<a href="${pageContext.request.contextPath}/update-userform.do?id=${loginId}" role="button" class="btn btn-info">회원정보수정</a>
					</sec:authorize>
					
					<%-- spring security logout은 다음과 같은 처리가 필요하다
					로그인,로그아웃은 모두 post 방식 요청으로 해야 하면  csrf 토큰처리가 필요하다 --%>
					<a href="#" id="logoutAction" role="button" class="btn btn-danger">로그아웃</a>
				</div>
					<form id="logoutForm" action="${pageContext.request.contextPath}/logout.do" method="post" style="display: none">
						<sec:csrfInput/>
					</form>
			
		</sec:authorize>
	</div>

</nav>
<%-- Hearder End --%>