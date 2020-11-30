<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BeansPickDetail</title>
</head>
<body>
<%-- Main Start --%>
<div class="container">
	<h3>관리자페이지</h3>
	<ul class="nav nav-tabs">
		<li><a href="admin-detail-form.do">권한설정</a></li>
		<li class="active"><a href="#">Bean's Pick</a></li>
	</ul>
	<br>
	<div class="container">
		<h2>권한설정</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>사업장</th>
					<th>사업자등록번호</th>
					<th>사업자등록증</th>
					<th>권한상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>java</td>
					<td>스타벅스</td>
					<td>000-00-00000</td>
					<td>image.jpg</td>
					<td><button type="button" class="btn btn-default">승인</button></td>
				</tr>
				<tr>
					<td>spring</td>
					<td>커피온리</td>
					<td>111-11-11111</td>
					<td>image.jpg</td>
					<td><button type="button" class="btn btn-default">승인</button></td>
				</tr>
				<tr>
					<td>ajax</td>
					<td>메가커피</td>
					<td>222-22-22222</td>
					<td>image.jpg</td>
					<td><button type="button" class="btn btn-default">승인</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="container text-center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li class="active"><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
</div>
<%-- Main End --%>
</body>
</html>