<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
#content { height: 850px; }

#mypage_password {
	height: 90%;
	padding: 30px;
	font-size: 20px;
}

#mypage_menuName {
	font-size: 30px;
	font-weight: bold;
	padding: 30px;
	padding-top: 50px;
}

#mypage_Password {
	width: 400px;
}

#mypage_password_btn {
	width: 80px;
	height: 35px;
}

.form-floating {
	margin-top: 10px;
}

#mypagePwdError {
	margin: 10px;
	font-weight: normal;
	font-size: 15px;
	color: red;
}

#mypage_content {
	padding-left: 50px;
}
</style>
</head>
<body>
	<div class="wrap">
		<!--전체를 감싸는 wrap영역-->

		<div id="content">
			<!--바디-->
			<div id="content_1"></div>
			<div id="content_2">

				<%@ include file="../common/mypageMenubar.jsp"%>

				<!-- 마이페이지 내용영역 -->
				<div id="mypage_content">
					<div id="mypage_menuName">회원정보수정</div>

					<div id="mypage_password">
						회원님의 개인정보를 보호하기 위해 비밀번호 확인 후 개인정보를 제공합니다. <br><br>
						비밀번호 입력 <br>
						<div class="form-floating">
							<input type="password" class="form-control" id="mypage_Password"
								placeholder="Password" name="memPwd"> <label
								for="floatingPassword">Password</label>

							<div id="mypagePwdError"></div>
							<button type="button" class="btn btn-primary"
								id="mypagePwdConfirm">확인</button>

						</div>
					</div>

				</div>
			</div>
			<div id="content_3"></div>
		</div>
	</div>

	<script>
		$(function() {
			// 확인 버튼 클릭하면 회원정보 수정 페이지로 넘어가기 
			$("#mypagePwdConfirm").click(function() {
				
				if($("input[name=memPwd]").val() == "<%=loginUser.getMemPwd()%>") {
					
					location.href = "<%=contextPath%>/mypageMemUpdatePage.me";

				} else {
					$("#mypagePwdError").html("비밀번호를 잘못 입력했습니다. 다시 입력해주세요.");
				}
			});
		});
	</script>
	
	

	<%@ include file="../common/footerbar.jsp"%>




</body>
</html>