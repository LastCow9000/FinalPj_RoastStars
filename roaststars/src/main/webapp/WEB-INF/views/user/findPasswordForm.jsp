<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"  uri="http://www.springframework.org/security/tags"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/87f055c024.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/home.css">
<meta charset="UTF-8">
<title>임시 비밀번호 발급</title>
<script type="text/javascript">
	function closePopup(){ //팝업종료
		self.close();
	}
	$(document).ready(function(){
		var nameCheck ="";
		$("#submitBtn").click(function(){ 	//비밀번호 찾기 버튼 클릭시
			var tags='';
			var nameCheck = $("#name").val();
			 if(nameCheck===""){
		         alert("이름을 입력해주세요!");
		         return false;
		      }else{
			$.ajax({
				type:"POST",
				data:"id="+$("#id").val()+"&name="+$("#name").val(),
				url:"${pageContext.request.contextPath}/find-password.do",
				beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(result){
					tags+="발급받은 임시 비밀번호 :";
					tags+="<p>";
					tags+="<span style=' font: bold 2em Georgia, serif ; color: violet;'>";
					tags+=result;
					tags+="</span>";
					tags+="</p>";
					tags+="<hr style='width: 480px; float:left;'><br>";
					tags+="<input type='button' value='닫기' id='closeBtn' class='btn btn-success' style='float:center;' onclick='closePopup();'>";
					$(".was-validated").html(tags);
				}
			
			});//end ajax
		      }
		});//end submitBtn click
		
		//입력한 아이디와 이름이 일치하는지 확인하기
		$("#name").keyup(function() {
	    	checkName="";
	   	 var nameValue= $("#name").val().trim();
	       $.ajax({
	          type : "post",
	          url : "${pageContext.request.contextPath}/name-checkAjax.do",
	          data:"id="+$("#id").val()+"&name="+nameValue,
	          beforeSend : function(xhr){   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
	                  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	              }, 
	          success : function(result) {
	             
	             if (result == 1){
	                $("#nameResult").html("이름이 일치합니다").css(
	                      "color", "green");
	                checkName = nameValue; 
	             } else {
	                $("#nameResult").html("이름이 일치하지 않습니다.").css(
	                      "color", "red");
	                checkName="";
	             }
	          }//success
	       });//ajax
	    });//keyup
	});//end ready
</script>
</head>
<body>
	<br>
	<div class="container" style="width: 500px; float: center;">
  <h2>비밀번호 찾기</h2>
  <hr style="width: 300px; float:left;"><br><br>
  <form class="was-validated" id="loginForm">
    <div class="form-group">
       아이디 : 
      <input type="text" id="id"  class="form-control" placeholder="발급받고자 하는 계정의 ID를 적어주세요" required>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">  아이디를 입력해주세요.</div>
    </div>
    <div class="form-group">
       이름 :
      <input type="text" id="name" class="form-control" placeholder="사용자의 이름을 적어주세요" required>
      <div class="valid-feedback">  <span id="nameResult"></span></div>
      <div class="invalid-feedback">  이름을 입력해주세요.</div>
     
    </div>

    <hr style="width: 480px; float:left;"><br>

	<input type="button" value="임시 비밀번호 발급 받기" id="submitBtn" class="btn btn-danger" style="float:center;">
  </form>
  
</div><!-- container -->
</body>
</html>