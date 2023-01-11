<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/menubar.jsp"%>
<% 
   // 로그인한 유저의 생년월일
   String birthDate = loginUser.getBirthDate(); 

   // 로그인한 유저의 태어난 월 
   String month = birthDate.substring(5,7);
   
   // 로그인한 유저의 태어난 일 
   String day = birthDate.substring(8,10);
   
   //로그인한 유저의 태어난 연도 
   String year = birthDate.substring(0,4);
   
   // 생년월일 정리한거 
   String birthday = year + " 년 " + month + " 월 " + day + " 일"; 

   // 현재 로그인한 사용자의 아이디 
   String memId = loginUser.getMemId();

   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JV Art Center</title>
<style>
/* 각자 필요한 content 길이만큼 height 속성값 수정해서 길이 조정 */
* #content {
	height: 1200px;
}

#mypage_text {
	font-size: 40px;
	font-weight: bold;
}

#mypage_menuName {
	font-size: 30px;
	font-weight: bold;
	padding: 30px;
	padding-top: 50px;
}

#maypage_ChangingInfo {
	width: 800px;
	height: 800px;
	text-align: left;
	margin: 30px;
	font-size: 18px;
}

#maypage_ChangingInfo td {
	padding-bottom: 15px;

}

#maypage_ChangingInfo #mypagePwdUpdate {
	width: 300px;
}

#mypageEmailUpdate {
	width: 200px;
}

.form-control {
	display: inline;
}

.form-select {
	width: 130px;
	display: inline;
}

#mypagePhoneUpdate1, #mypagePhoneUpdate2 {
	width: 130px;
}

#mypageUpdate_btn {
	margin: 30px;
}

#mypageEmailUpdate2 {
	width: 200px !important;
}

#passward_info {
width: 300px;
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
					<form id="mypageMemUpdate-form" action="<%= contextPath %>/mypageMemUpdate.me" method="post">
						<table id="maypage_ChangingInfo">
							<tr>
								<td style="font-weight: bold">아이디</td>
								<td>
									<input type="hidden" name="memId" value="<%= memId %>">
									<%= memId %>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold">비밀번호</td>
								<td><input id="passward_info"  type="password" class="form-control" value="<%= loginUser.getMemPwd() %>" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: 15px">새 비밀번호 입력</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div class="form-floating">
										<input type="password" class="form-control"
											id="mypagePwdUpdate" placeholder="Password" name="updatePwd" required/> 
											<label for="floatingPassword">새 비밀번호를 입력해주세요</label>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: 15px">새 비밀번호 확인</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<div class="form-floating">
										<input type="password" class="form-control"
											id="mypagePwdUpdate" placeholder="Password" name="checkPwd" required/> 
											<label for="floatingPassword">새 비밀번호를 재입력해주세요</label>
									</div>
									<div id="mypagecheckPwd" style="color: red; font-weight: 500;"></div>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold">이름</td>
								<td><b><%= loginUser.getMemName() %></b></td>
							</tr>
							<tr>
								<td style="font-weight: bold">성별</td>
								<td><%= loginUser.getGender() %></td>
							</tr>
							<tr>
								<td style="font-weight: bold">이메일</td>
								<td><%= loginUser.getEmail() %></td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: 15px">이메일 변경</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="text" class="form-control" id="mypageEmailUpdate" name="updateEmail1"> @ 
									<select class="form-select" name="updateEmail2" id="mypageEmailUpdate2">
										<option value="naver.com">naver.com</option>
										<option value="google.com">google.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hanmail.net">hanmail.net</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="font-weight: bold">생년월일</td>
								<td><%= birthday %></td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: 15px">생년월일 변경</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<input type="hidden" name="year" value="<%= year %>">
								<%= year %>년 &nbsp;
								<select class="form-select" name="updateBirthDateMonth">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
								</select> 월 &nbsp;
								
								<select class="form-select" name="updateBirthDateDay">
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="21">21</option>
										<option value="22">22</option>
										<option value="23">23</option>
										<option value="24">24</option>
										<option value="25">25</option>
										<option value="26">26</option>
										<option value="27">27</option>
										<option value="28">28</option>
										<option value="29">29</option>
										<option value="30">30</option>
										<option value="31">31</option>
								</select> 일 &nbsp;
								</td>
							</tr>

							<tr>
								<td style="font-weight: bold">휴대폰 번호</td>
								<td><%= loginUser.getPhone() %></td>
							</tr>
							<tr>
								<td></td>
								<td style="font-size: 15px">휴대폰 번호 변경</td>
							</tr>
							<tr>
								<td></td>
								<td>
									<select name="updatePhone1" class="form-select">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="012">012</option>
									</select> - <input type="text" class="form-control"
										id="mypagePhoneUpdate1" name="updatePhone2" /> - <input type="text"
										class="form-control" id="mypagePhoneUpdate2" name="updatePhone3" />
								</td>
							</tr>
						</table>

						
						<!-- 취소,저장 버튼 -->
						<div id="mypageUpdate_btn">
							<button type="reset" class="btn btn-secondary" style="border: 1px solid;">취소</button>
							<button type="submit" class="btn btn-primary" onclick="return validatePwd();">저장</button>
						</div>

					</form>

				</div>
			</div>

			<div id="content_3"></div>
		</div>
	</div>

	<script>
		function passward() {
			// 사용자의 비밀번호가 치환되서 입력될 공간 
			let passwardArea = document.getElementById("passward_info");

			// 비교할 문자열 
			let pwd = <%= loginUser.getMemPwd() %>;

			// 메타문자 
			var regExp = /^[a-z\d!@#$%^]{8,15}$/i;

			userPwd = pwd.replace(regExp, "(***)");

			passwardArea.innerHTML(userPwd);
		}

		
		function validatePwd() {
			if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
                $("#mypagecheckPwd").html("비밀번호가 일치하지 않습니다.");
                return false;
                
            }
		}
		
	</script>


	<%@ include file="../common/footerbar.jsp"%>

</body>
</html>