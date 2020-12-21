<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans Pick Form</title>

<%--  --%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
.timeBox {
	text-align: center;
	width: 200px;
}
</style>
<script type="text/javascript">
	/* 길이 체크 공간 */

	$(document).ready(
			function() {

				var checkName = "";
				var checkInfo = "";
				var checkTel = "";

				// 제목 길이 체크
				$("#registCafeName").keyup(
						function() {
							checkName = "";
							var nameValue = $(this).val().trim();

							//제목 길이 10자 넘어가면 빨갛게
							if (nameValue.length > 10) {
								$("#nameCheckResult").html(nameValue.length)
										.css("color", "red");
								return;
								//제목 길이 평소에는 grey로
							} else {
								$("#nameCheckResult").html(nameValue.length)
										.css("color", "grey");
								checkName = nameValue;
							}
						});// end registCafeName keyup

				// 본문 길이 체크
				$("#cafeInfo").keyup(
						function() {
							checkInfo = "";
							var infoValue = $(this).val().trim();

							//본문 길이 200자 넘어가면 빨갛게
							if (infoValue.length > 500) {
								$("#infoCheckResult").html(infoValue.length)
										.css("color", "red");
								return;
								//본문 길이 평소에는 grey로
							} else {
								$("#infoCheckResult").html(infoValue.length)
										.css("color", "grey");
								checkInfo = infoValue;
							}
						});// end registCafeName keyup

				/* 길이 넘었을 때 submit 안 되도록 막기 */
				$("#registerForm").submit(function() {
					// 제목 길이 체크
					if (checkName == "") {
						alert("BeansPick 제목은 10자 이내로 작성해주세요.");
						return false;
					}
					// 본문 길이 체크
					if (checkInfo == "") {
						alert("BeansPick 내용은 500자 이내로 작성해주세요.");
						return false;
					}

				});//sumit

			});//ready
</script>
<%--  --%>

</head>
<body>
	<div class="shadow-sm p-4 mb-4 bg-white">
		<div class="container" style="width: 800px; float: center; margin-left: 130px;">
			<h2>BeansPick 수정하기</h2>
			<form method="post" action="${pageContext.request.contextPath}/register-result-beansPick.do" id="registerForm" enctype="multipart/form-data">
				<input type="hidden" name="beansNo" value="${beansPickVO.beansNo}">
				<sec:csrfInput />
				<table class="table table-sm">
					<thead></thead>
					<tbody>
						<tr>
							<td>BeansPick 사진 :</td>
							<td colspan=1>
								<div class="input-group mb-1">
									<input type="file" name="uploadFile" required="required" id="inputGroupFile02" size=50>
								</div>
							</td>
						</tr>
						<tr>
							<td>BeansPick 제목 :</td>
							<td colspan=1><input type="text" name="beansTitle" required="required" value="${beansPickVO.beansTitle}" size=50 id="registCafeName">&nbsp; <span id="nameCheckResult"></span>/10</td>
						</tr>
						<tr>
							<td>BeansPick 본문 :</td>
						</tr>
						<tr>
							<td colspan="3"><textarea rows="10" cols="120" placeholder="${beansPickVO.beansContent}" name="beansContent" required="required" id="cafeInfo"></textarea>
							<br> <span id="infoCheckResultSpan"><span id="infoCheckResult"></span>/500</span></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="submit" class="btn btn-success" value="등록하기"></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
